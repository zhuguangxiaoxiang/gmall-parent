package com.gmall.starter.cache.service;

import java.lang.reflect.Type;
import java.util.concurrent.TimeUnit;

/**
 * @Auther: Administrator
 * @Date: 2023/5/31
 */
public interface CacheService {

//    /**
//     * 缓存中查询sku
//     * @param skuId
//     * @return
//     */
//    SkuDetailVo getFromCache(Long skuId);

//    /**
//     * 保存商品
//     *
//     * @param skuId
//     * @param returnValue
//     */
//    void saveData(Long skuId, Object returnValue);

//    /**
//     * 判断是否有这个sku
//     *
//     * @param skuId
//     * @return
//     */
//    boolean mightContain(Long skuId);

    /**
     * 从缓存中获取指定类型的数据
     * @param s
     * @param returnType
     * @return
     */
    Object getCacheDatta(String s, Type returnType);

    /**
     * 判定指定位图bitMapName中有没有bitMapIndex位置的数据
     * @param bitMapKey
     * @param bitMapIndex
     * @return
     */
    boolean mightContain(String bitMapKey, Long bitMapIndex);

    /**
     * 给缓存中保存指定数据
     *
     * @param cacheKey
     * @param proceed
     * @param ttl
     * @param unit
     */
    void saveCatchData(String cacheKey, Object proceed, long ttl, TimeUnit unit);

    /**
     * 延迟双删
     * @param cacheKey
     */
    void delayDoubleDel(String cacheKey);
}
