package com.gmall.product.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gmall.product.entity.SkuInfo;
import com.baomidou.mybatisplus.extension.service.IService;
import com.gmall.product.entity.SpuImage;
import com.gmall.product.vo.SkuSaveInfoVo;

import java.util.List;

/**
* @author Administrator
* @description 针对表【sku_info(库存单元表)】的数据库操作Service
* @createDate 2023-05-24 18:29:57
*/
public interface SkuInfoService extends IService<SkuInfo> {

    Page<SkuInfo> getSkuInfoList(Page<SkuInfo> skuInfoPage);

    void saveSkuInfo(SkuSaveInfoVo skuSaveInfoVo);

    void onSale(Long skuId);

    void cancelSale(Long skuId);
}
