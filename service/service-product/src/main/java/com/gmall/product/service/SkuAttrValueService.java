package com.gmall.product.service;

import com.gmall.product.entity.SkuAttrValue;
import com.baomidou.mybatisplus.extension.service.IService;
import com.gmall.search.SearchAttr;

import java.util.List;

/**
* @author Administrator
* @description 针对表【sku_attr_value(sku平台属性值关联表)】的数据库操作Service
* @createDate 2023-05-24 18:29:57
*/
public interface SkuAttrValueService extends IService<SkuAttrValue> {

    /**
     * 获取某个sku的所有平台属性名和值
     * @param skuId
     * @return
     */
    List<SearchAttr> getSkuAttrsAndValues(Long skuId);
}
