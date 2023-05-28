package com.gmall.product.mapper;

import com.gmall.product.entity.SpuSaleAttr;
import com.gmall.product.entity.SpuSaleAttrValue;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.gmall.product.vo.SpuSaleAttrVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
* @author Administrator
* @description 针对表【spu_sale_attr_value(spu销售属性值)】的数据库操作Mapper
* @createDate 2023-05-24 18:29:57
* @Entity com.gmall.product.entity.SpuSaleAttrValue
*/
public interface SpuSaleAttrValueMapper extends BaseMapper<SpuSaleAttrValue> {

    List<SpuSaleAttrVo > getSpuSaleAttrList(@Param("spuId") Long spuId);
}




