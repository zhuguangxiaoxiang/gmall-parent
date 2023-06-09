package com.gmall.product.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gmall.product.entity.SkuAttrValue;
import com.gmall.product.service.SkuAttrValueService;
import com.gmall.product.mapper.SkuAttrValueMapper;
import com.gmall.search.SearchAttr;
import org.springframework.stereotype.Service;

import java.util.List;

/**
* @author Administrator
* @description 针对表【sku_attr_value(sku平台属性值关联表)】的数据库操作Service实现
* @createDate 2023-05-24 18:29:57
*/
@Service
public class SkuAttrValueServiceImpl extends ServiceImpl<SkuAttrValueMapper, SkuAttrValue>
    implements SkuAttrValueService{

    @Override
    public List<SearchAttr> getSkuAttrsAndValues(Long skuId) {
        return baseMapper.getSkuAttrsAndValues(skuId);
    }
}




