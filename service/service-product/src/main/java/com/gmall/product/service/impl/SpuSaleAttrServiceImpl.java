package com.gmall.product.service.impl;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gmall.product.entity.SpuSaleAttr;
import com.gmall.product.service.SpuSaleAttrService;
import com.gmall.product.mapper.SpuSaleAttrMapper;
import com.gmall.product.vo.ValueSkuJsonVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @author Administrator
 * @description 针对表【spu_sale_attr(spu销售属性)】的数据库操作Service实现
 * @createDate 2023-05-24 18:29:57
 */
@Slf4j
@Service
public class SpuSaleAttrServiceImpl extends ServiceImpl<SpuSaleAttrMapper, SpuSaleAttr>
        implements SpuSaleAttrService {


    @Override
    public List<SpuSaleAttr> spuSaleAttrList(Long spuId) {
        return baseMapper.getSpuSaleAttrList(spuId);
    }

    @Override
    public List<SpuSaleAttr> getSpuSaleAttrListOrder(Long spuId, Long skuId) {
        return baseMapper.getSpuSaleAttrListOrder(spuId, skuId);
    }


    @Override
    public String getValuesSkuJson(Long spuId) {
        List<ValueSkuJsonVo> valueSkuJsonVos = baseMapper.getValuesSkuJson(spuId);
        Map<String, Long> map = valueSkuJsonVos.stream()
                .collect(Collectors.toMap(ValueSkuJsonVo::getValueJson, ValueSkuJsonVo::getSkuId));
        String jsonString = JSON.toJSONString(map);
        log.info("兄弟销售属性组合：{}", jsonString);
        return jsonString;
    }
}




