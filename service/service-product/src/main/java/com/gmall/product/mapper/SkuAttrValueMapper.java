package com.gmall.product.mapper;

import com.gmall.product.entity.SkuAttrValue;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.gmall.search.SearchAttr;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
* @author Administrator
* @description 针对表【sku_attr_value(sku平台属性值关联表)】的数据库操作Mapper
* @createDate 2023-05-24 18:29:57
* @Entity com.gmall.product.entity.SkuAttrValue
*/
public interface SkuAttrValueMapper extends BaseMapper<SkuAttrValue> {

    List<SearchAttr> getSkuAttrsAndValues(@Param("skuId") Long skuId);
}




