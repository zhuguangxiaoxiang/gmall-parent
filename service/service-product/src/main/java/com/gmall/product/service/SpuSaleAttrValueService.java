package com.gmall.product.service;

import com.gmall.product.entity.SpuSaleAttr;
import com.gmall.product.entity.SpuSaleAttrValue;
import com.baomidou.mybatisplus.extension.service.IService;
import com.gmall.product.vo.SpuSaleAttrVo;

import java.util.List;

/**
* @author Administrator
* @description 针对表【spu_sale_attr_value(spu销售属性值)】的数据库操作Service
* @createDate 2023-05-24 18:29:57
*/
public interface SpuSaleAttrValueService extends IService<SpuSaleAttrValue> {

    List<SpuSaleAttrVo > spuSaleAttrList(Long spuId);
}
