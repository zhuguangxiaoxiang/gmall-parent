package com.gmall.item.service.impl;

import com.alibaba.fastjson.JSON;
import com.gmall.common.constant.RedisConst;
import com.gmall.item.service.CacheService;
import com.gmall.product.vo.SkuDetailVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.concurrent.TimeUnit;

/**
 * @Auther: Administrator
 * @Date: 2023/5/31
 */
@Slf4j
@Service
public class CacheServiceImpl implements CacheService {

    @Autowired
    StringRedisTemplate redisTemplate;

    @Override
    public SkuDetailVo getFromCache(Long skuId) {
        log.info("正在查询缓存...");
        //"sku:info:" 1、查询缓存
        String json = redisTemplate.opsForValue().get(RedisConst.SKU_DETAIL_CACHE + skuId);
        //2、缓存没有
        if (StringUtils.isEmpty(json)) {
            return null;
        } else if ("".equals(json)) {
            return new SkuDetailVo();//返回空对象
        } else {
            log.info("缓存命中...");
            return JSON.parseObject(json, SkuDetailVo.class);
        }
    }

    /**
     * 保存商品
     *
     * @param skuId
     * @param returnValue
     */
    @Override
    public void saveData(Long skuId, SkuDetailVo returnValue) {
        String json = ""; //默认是空
        if (returnValue != null) {
            json = JSON.toJSONString(returnValue);//真正的json
        }

        redisTemplate.opsForValue().set(RedisConst.SKU_DETAIL_CACHE + skuId, json, 7, TimeUnit.DAYS);
    }

    /**
     * 判断是否有这个sku
     *
     * @param skuId
     * @return
     */
    @Override
    public boolean mightContain(Long skuId) {
        return redisTemplate.opsForValue().getBit(RedisConst.SKUID_BIT_MAP, skuId);

    }
}
