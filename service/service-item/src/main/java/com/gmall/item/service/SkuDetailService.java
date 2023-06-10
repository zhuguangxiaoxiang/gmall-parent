package com.gmall.item.service;

import com.gmall.product.vo.SkuDetailVo;

/**
 * @Auther: Administrator
 * @Date: 2023/5/29
 */
public interface SkuDetailService {
    SkuDetailVo getSkuDetailData(Long skuId);

    /**
     * 增强商品热度
     * @param skuId
     */
    void incrHotScore(Long skuId);
}
