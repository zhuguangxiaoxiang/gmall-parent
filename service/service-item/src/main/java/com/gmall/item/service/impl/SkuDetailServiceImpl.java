package com.gmall.item.service.impl;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.ReentrantLock;


import com.gmall.common.constant.RedisConst;
import com.gmall.feign.product.ProductSkuDetailFeignClient;
import com.gmall.product.entity.SkuImage;
import com.gmall.product.entity.SpuSaleAttr;
import com.gmall.product.vo.CategoryTreeVo;
import com.gmall.product.entity.SkuInfo;
import com.gmall.product.vo.SkuDetailVo.CategoryViewDTO;

import com.gmall.item.service.SkuDetailService;
import com.gmall.product.vo.SkuDetailVo;
import com.gmall.starter.cache.aspect.annotaion.MallCache;
import com.gmall.starter.cache.service.CacheService;
import lombok.extern.slf4j.Slf4j;
import org.jetbrains.annotations.NotNull;
import org.redisson.api.RedissonClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;


/**
 * @Auther: Administrator
 * @Date: 2023/5/29
 */
@Slf4j
@Service
public class SkuDetailServiceImpl implements SkuDetailService {

    @Autowired
    ProductSkuDetailFeignClient skuDetailFeignClient;

    @Autowired
    ThreadPoolExecutor executor;

    @Autowired
    StringRedisTemplate redisTemplate;

    @Autowired
    CacheService cacheService;

    @Autowired
    RedissonClient redissonClient;


    //业务Service只关注业务，增强逻辑由切面完成
    //
    @MallCache(
            cacheKey = RedisConst.SKU_DETAIL_CACHE + "#{#args[0]}",
            bitMapName = RedisConst.SKUID_BIT_MAP,
            bitMapKey = "#{#args[0]}",
            lockKey = RedisConst.SKU_LOCK + "#{#args[0]}",
            ttl = 7,
            unit = TimeUnit.DAYS)
    @Override
    public SkuDetailVo getSkuDetailData(Long skuId) {
        return getDataFromRpc(skuId);
    }

//    public SkuDetailVo getSkuDetailDataWithDistLock(Long skuId) throws InterruptedException {
//        //1、先查缓存
//        SkuDetailVo cache = cacheService.getFromCache(skuId);
//        if (cache != null) {
//            //2、缓存没有直接返回
//            log.info("缓存命中.....");
//            return cache;
//        }
//        log.info("缓存未命中.....");
//        //3、缓存没有；准备回源
//        //4、先问bitmap，数据库有没有这个商品 【防止随机值攻击】
//        boolean contain = cacheService.mightContain(skuId);
//        if (!contain) {
//            //bitmap不包含，代表数据库无数据，直接返回null
//            return null;
//        }
//        //5、bitmap说有，就去数据库查一查。查之前加锁 【防止缓存击穿】
//        RLock lock = redissonClient.getLock(RedisConst.SKU_LOCK + skuId);//锁的粒度要细
//        boolean tryLock = false;
//        try {
//            //6、加锁 tryLock尝试竞争锁
//            tryLock = lock.tryLock();
//            if (tryLock) {
//                //7、抢到锁；回源
//                cache = getDataFromRpc(skuId);
//                //8、放到缓存中
//                cacheService.saveData(skuId, cache);
//                return cache;
//            } else {
//                //9、睡300ms直接查缓存即可
//                TimeUnit.MILLISECONDS.sleep(300);
//                return cacheService.getFromCache(skuId);
//            }
//        } finally {
//            if (tryLock) {
//                try {
//                    lock.unlock();
//                } catch (Exception e) {
//                }
//            }
//        }
//    }


    //缓存
    //本地缓存：缓存中的数据就存在微服务所在的jvm内存中
    private Map<Long, SkuDetailVo> cache = new ConcurrentHashMap<>();


    //JUC：本地锁；在分布式场景，会导致锁不住所有机器；
    ReentrantLock lock = new ReentrantLock();//原理：AQS、CAS

//    public SkuDetailVo getSkuDetailDataWithLocalLock(Long skuId) {
//        SkuDetailVo returnValue = null;
//        //1、先查缓存
//        log.info("商品详情查询开始...");
//        returnValue = cacheService.getFromCache(skuId);
//        if (returnValue == null) {//一定要判定出真没(null)还是假没("")
//            //2、位图判定是否有
//            boolean contain = cacheService.mightContain(skuId);
//            if (!contain) {
//                log.info("bitmap没有，疑似攻击请求，直接打回");
//                return null;
//            }
//            //3、缓存中没有：回源
//            log.info("bitmap有，准备回源。需要加锁防止击穿");
//            //准备拦截击穿风险
//            boolean tryLock = lock.tryLock(); //100w进来瞬间进行抢索；CAS
//            if (tryLock) {
//                log.info("加锁成功...正在回源");
//                //4、抢锁成功
//                returnValue = getDataFromRpc(skuId);
//                //5、保存缓存;   null值缓存都可能不会被调用;如果这里使用的是bloomfilter，可能会误判，即使误判，放给数据库没有也要null值缓存
//                cacheService.saveData(skuId, returnValue);
//                lock.unlock();
//            } else {
//                log.info("加锁失败...稍等直接返回数据");
//                //6、抢锁失败，300ms后直接看缓存
//                try {
//                    TimeUnit.MILLISECONDS.sleep(300);
//                    returnValue = cacheService.getFromCache(skuId);
//                } catch (InterruptedException e) {
//                }
//            }
//        }
//
//        return returnValue;
//    }

//    public SkuDetailVo getSkuDetailDataNullSave(Long skuId) {
//        //1、先查保存 sku:info:49 == 商品json
//        String json = redisTemplate.opsForValue().get(RedisConst.SKU_DETAIL_CACHE + skuId);
//        if (StringUtils.isEmpty(json)) {
//            //2、缓存中没有，回源
//            synchronized (this) {
//                //先看缓存
//                SkuDetailVo data = getDataFromRpc(skuId);
//                log.info("正在存储缓存");
//                String jsonData;
//                //3、放入缓存：即使null也缓存到redis
//                jsonData = JSON.toJSONString(data); //“{}”
//                if (jsonData.equals("{}")) {
//                    jsonData = "";
//                }
//                redisTemplate.opsForValue().set(RedisConst.SKU_DETAIL_CACHE + skuId, JSON.toJSONString(jsonData), 7, TimeUnit.DAYS);
//                return data;
//            }
//        }
//        //4、缓存中有
//        //1)、真有：json真数据
//        //2)、假有：x
//        if ("".equals(json)) {
//            log.info("疑似攻击请求");
//            return null;
//        }
//        SkuDetailVo data = JSON.parseObject(json, SkuDetailVo.class);
//        log.info("正在读取缓存");
//        return data;
//    }

    /**
     * 获取商品的详情数据
     *
     * @param skuId
     * @return
     */
//    public SkuDetailVo getSkuDetailDataLocalCache(Long skuId) {
//
//        //1、先查缓存
//        SkuDetailVo data = cache.get(skuId);
//
//        //2、缓存中没有
//        if (data == null) {
//            log.info("商品详情：缓存未命中，正在回源");
//            //3、回源：回到数据源头进行查询
//            data = getDataFromRpc(skuId);
//            //4、把数据同步到缓存
//            cache.put(skuId, data);
//        } else {
//            log.info("商品详情：缓存命中");
//        }
//        return data;
//
//    }
    @NotNull
    private SkuDetailVo getDataFromRpc(Long skuId) {
        //获取商品的详情数据
        SkuDetailVo skuDetailVo = new SkuDetailVo();

        //1、异步：商品详情【图片】 //自定义的线程池
        CompletableFuture<SkuInfo> skuInfoFuture = CompletableFuture.supplyAsync(() -> {
            log.info("详情：skuinfo");
            SkuInfo skuInfo = skuDetailFeignClient.getSkuInfo(skuId).getData();
            return skuInfo;
        }, executor);

        //2、异步：图片
        CompletableFuture<Void> imageFuture = skuInfoFuture.thenAcceptAsync(data -> {
            log.info("图片：skuimages");
            List<SkuImage> skuImages = skuDetailFeignClient.getSkuImages(skuId).getData();
            if (data == null) return;
            data.setSkuImageList(skuImages);
            skuDetailVo.setSkuInfo(data);
        }, executor);


        //3、异步：当前商品精确完整分类信息;
        CompletableFuture<Void> categoryFuture = skuInfoFuture.thenAcceptAsync(data -> {
            log.info("分类：category");
            if (data == null) return;
            CategoryTreeVo categoryTreeVo = skuDetailFeignClient.getCategoryTreeWithC3Id(data.getCategory3Id()).getData();
            //数据模型转换
            CategoryViewDTO categoryViewDTO = converToCategoryViewDTO(categoryTreeVo);
            skuDetailVo.setCategoryView(categoryViewDTO);
        }, executor);

        //4、异步：实时价格
        CompletableFuture<Void> priceFuture = CompletableFuture.runAsync(() -> {
            log.info("价格：price");
            try {
                BigDecimal price = skuDetailFeignClient.getPrice(skuId).getData();
                skuDetailVo.setPrice(price);
            } catch (Exception e) {

            }
        }, executor);

        //5、销售属性
        CompletableFuture<Void> saleAttrFuture = skuInfoFuture.thenAcceptAsync(data -> {
            log.info("销售属性：saleAttr");
            if (data == null) return;
            List<SpuSaleAttr> spuSaleAttrs = skuDetailFeignClient.getSpuSaleAttr(data.getSpuId(), skuId).getData();
            skuDetailVo.setSpuSaleAttrList(spuSaleAttrs);
        }, executor);


        //6、当前sku的所有兄弟的所有组合可能性
        CompletableFuture<Void> valueJsonFuture = skuInfoFuture.thenAcceptAsync(data -> {
            log.info("组合：valueJson");
            if (data == null) return;
            String json = skuDetailFeignClient.getValueSkuJson(data.getSpuId()).getData();
            skuDetailVo.setValuesSkuJson(json);
        }, executor);

        //等待所有的任务都完成
        CompletableFuture
                .allOf(imageFuture, categoryFuture, priceFuture, saleAttrFuture, valueJsonFuture)
                .join();
        return skuDetailVo;
    }

    @NotNull
    private static CategoryViewDTO converToCategoryViewDTO(CategoryTreeVo categoryTreeVo) {
        CategoryViewDTO categoryViewDTO = new CategoryViewDTO();
        categoryViewDTO.setCategory1Id(categoryTreeVo.getCategoryId());
        categoryViewDTO.setCategory1Name(categoryViewDTO.getCategory1Name());

        CategoryTreeVo child1 = categoryTreeVo.getCategoryChild().get(0);
        categoryViewDTO.setCategory2Id(child1.getCategoryId());
        categoryViewDTO.setCategory2Name(child1.getCategoryName());

        CategoryTreeVo child2 = child1.getCategoryChild().get(0);
        categoryViewDTO.setCategory3Id(child2.getCategoryId());
        categoryViewDTO.setCategory3Name(child2.getCategoryName());
        return categoryViewDTO;
    }


}
