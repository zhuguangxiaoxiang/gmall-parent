package com.gmall.product.mapper;

import com.gmall.product.entity.SkuInfo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

/**
* @author Administrator
* @description 针对表【sku_info(库存单元表)】的数据库操作Mapper
* @createDate 2023-05-24 18:29:57
* @Entity com.gmall.product.entity.SkuInfo
*/
public interface SkuInfoMapper extends BaseMapper<SkuInfo> {

    void updateIsOnSale(@Param("skuId") Long skuId);

    void updateCancelSale(@Param("skuId") Long skuId);
}




