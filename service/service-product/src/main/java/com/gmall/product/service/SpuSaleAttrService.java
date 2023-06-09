package com.gmall.product.service;

import com.gmall.product.entity.SpuSaleAttr;
import com.baomidou.mybatisplus.extension.service.IService;
import com.gmall.product.vo.SpuSaleAttrVo;

import java.util.List;

/**
 * @author Administrator
 * @description 针对表【spu_sale_attr(spu销售属性)】的数据库操作Service
 * @createDate 2023-05-24 18:29:57
 */
public interface SpuSaleAttrService extends IService<SpuSaleAttr> {

    /**
     * 查询spu销售属性名和值的集合
     *
     * @param spuId
     * @return
     */
    List<SpuSaleAttr> spuSaleAttrList(Long spuId);

    List<SpuSaleAttr> getSpuSaleAttrListOrder(Long spuId, Long skuId);

    /**
     * 根据spuId得到所有sku的销售属性的集合
     *
     * @param spuId
     * @return
     */
    String getValuesSkuJson(Long spuId);
}
