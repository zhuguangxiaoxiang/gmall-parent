package com.gmall.item.service.impl;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.gmall.item.feign.SkuDetailFeignClient;
import com.gmall.product.entity.SkuImage;
import com.gmall.product.entity.SpuSaleAttr;
import com.gmall.product.vo.CategoryTreeVo;
import com.gmall.product.entity.SkuInfo;
import com.gmall.product.vo.SkuDetailVo.CategoryViewDTO;

import com.gmall.item.service.SkuDetailService;
import com.gmall.product.vo.SkuDetailVo;
import lombok.extern.slf4j.Slf4j;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;


/**
 * @Auther: Administrator
 * @Date: 2023/5/29
 */
@Slf4j
@Service
public class SkuDetailServiceImpl implements SkuDetailService {

    @Autowired
    SkuDetailFeignClient skuDetailFeignClient;


    //缓存
    //本地缓存：缓存中的数据就存在微服务所在的jvm内存中
    private Map<Long, SkuDetailVo> cache = new ConcurrentHashMap<>();

    @Autowired
    StringRedisTemplate redisTemplate;

    @Override
    public SkuDetailVo getSkuDetailData(Long skuId) {
        //1、先查保存 sku:info:49 == 商品json
        String json = redisTemplate.opsForValue().get("sku:info:" + skuId);
        if (StringUtils.isEmpty(json)) {
            //2、缓存中没有，回源
            synchronized (this) {
                //先看缓存
                SkuDetailVo result = getDataFromRpc(skuId);
                log.info("正在存储缓存");
                String jsonData;
                //3、放入缓存：即使null也缓存到redis
                jsonData = JSON.toJSONString(result); //“{}”
                if (jsonData.equals("{}")) {
                    jsonData = "";
                }
                redisTemplate.opsForValue().set("sku:info:" + skuId, JSON.toJSONString(jsonData),7, TimeUnit.DAYS);
                return result;
            }
        }
        //4、缓存中有
        //1)、真有：json真数据
        //2)、假有：x
        if ("".equals(json)) {
            log.info("疑似攻击请求");
            return null;
        }
        SkuDetailVo result = JSON.parseObject(json, SkuDetailVo.class);
        log.info("正在读取缓存");
        return result;
    }

    /**
     * 获取商品的详情数据
     *
     * @param skuId
     * @return
     */
    public SkuDetailVo getSkuDetailDataLocalCache(Long skuId) {

        //1、先查缓存
        SkuDetailVo result = cache.get(skuId);

        //2、缓存中没有
        if (result == null) {
            log.info("商品详情：缓存未命中，正在回源");
            //3、回源：回到数据源头进行查询
            result = getDataFromRpc(skuId);
            //4、把数据同步到缓存
            cache.put(skuId, result);
        } else {
            log.info("商品详情：缓存命中");
        }
        return result;

    }

    @NotNull
    private SkuDetailVo getDataFromRpc(Long skuId) {
        //获取商品的详情数据
        SkuDetailVo skuDetailVo = new SkuDetailVo();


        //1、异步：商品详情【图片】 //自定义的线程池
        CompletableFuture<SkuInfo> skuInfoFuture = CompletableFuture.supplyAsync(() -> {
            log.info("详情：skuinfo");
            SkuInfo skuInfo = skuDetailFeignClient.getSkuInfo(skuId).getData();
            return skuInfo;
        });

        //2、异步：图片
        CompletableFuture<Void> imageFuture = skuInfoFuture.thenAcceptAsync(result -> {
            log.info("图片：skuimages");
            List<SkuImage> skuImages = skuDetailFeignClient.getSkuImages(skuId).getData();
            if (result == null) return;
            result.setSkuImageList(skuImages);
            skuDetailVo.setSkuInfo(result);
        });


        //3、异步：当前商品精确完整分类信息;
        CompletableFuture<Void> categoryFuture = skuInfoFuture.thenAcceptAsync(result -> {
            log.info("分类：category");
            if (result == null) return;
            CategoryTreeVo categoryTreeVo = skuDetailFeignClient.getCategoryTreeWithC3Id(result.getCategory3Id()).getData();
            //数据模型转换
            CategoryViewDTO categoryViewDTO = converToCategoryViewDTO(categoryTreeVo);
            skuDetailVo.setCategoryView(categoryViewDTO);
        });

        //4、异步：实时价格
        CompletableFuture<Void> priceFuture = CompletableFuture.runAsync(() -> {
            log.info("价格：price");
            try {
                BigDecimal price = skuDetailFeignClient.getPrice(skuId).getData();
                skuDetailVo.setPrice(price);
            } catch (Exception e) {

            }
        });

        //5、销售属性
        CompletableFuture<Void> saleAttrFuture = skuInfoFuture.thenAcceptAsync(result -> {
            log.info("销售属性：saleAttr");
            if (result == null) return;
            List<SpuSaleAttr> spuSaleAttrs = skuDetailFeignClient.getSpuSaleAttr(result.getSpuId(), skuId).getData();
            skuDetailVo.setSpuSaleAttrList(spuSaleAttrs);
        });


        //6、当前sku的所有兄弟的所有组合可能性
        CompletableFuture<Void> valueJsonFuture = skuInfoFuture.thenAcceptAsync(result -> {
            log.info("组合：valueJson");
            if (result == null) return;
            String json = skuDetailFeignClient.getValueSkuJson(result.getSpuId()).getData();
            skuDetailVo.setValuesSkuJson(json);
        });

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
