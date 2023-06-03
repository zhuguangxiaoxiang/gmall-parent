package com.gmall.item.service;

import com.gmall.product.vo.SkuDetailVo;

/**
 * @Auther: Administrator
 * @Date: 2023/5/29
 */
public interface SkuDetailService {
    SkuDetailVo getSkuDetailData(Long skuId) throws InterruptedException;
}
