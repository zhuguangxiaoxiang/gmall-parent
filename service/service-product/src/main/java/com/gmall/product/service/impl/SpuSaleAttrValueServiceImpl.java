package com.gmall.product.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gmall.product.entity.SpuSaleAttr;
import com.gmall.product.entity.SpuSaleAttrValue;
import com.gmall.product.service.SpuSaleAttrValueService;
import com.gmall.product.mapper.SpuSaleAttrValueMapper;
import com.gmall.product.vo.SpuSaleAttrVo;
import org.springframework.stereotype.Service;

import java.util.List;

/**
* @author Administrator
* @description 针对表【spu_sale_attr_value(spu销售属性值)】的数据库操作Service实现
* @createDate 2023-05-24 18:29:57
*/
@Service
public class SpuSaleAttrValueServiceImpl extends ServiceImpl<SpuSaleAttrValueMapper, SpuSaleAttrValue>
    implements SpuSaleAttrValueService{

    /**
     * 查询spu销售属性名和值的集合
     * @param spuId
     * @return
     */
    @Override
    public List<SpuSaleAttrVo > spuSaleAttrList(Long spuId) {
        return baseMapper.getSpuSaleAttrList(spuId);
    }
}




