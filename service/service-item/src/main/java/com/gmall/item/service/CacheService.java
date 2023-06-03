package com.gmall.item.service;

import com.gmall.product.vo.SkuDetailVo;

/**
 * @Auther: Administrator
 * @Date: 2023/5/31
 */
public interface CacheService {
    SkuDetailVo getFromCache(Long skuId);

    void saveData(Long skuId, SkuDetailVo returnValue);

    boolean mightContain(Long skuId);
}
