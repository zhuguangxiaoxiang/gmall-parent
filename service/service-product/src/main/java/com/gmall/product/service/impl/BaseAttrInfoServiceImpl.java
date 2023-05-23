package com.gmall.product.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gmall.product.entity.BaseAttrInfo;
import com.gmall.product.service.BaseAttrInfoService;
import com.gmall.product.mapper.BaseAttrInfoMapper;
import org.springframework.stereotype.Service;

import java.util.List;

/**
* @author Administrator
* @description 针对表【base_attr_info(属性表)】的数据库操作Service实现
* @createDate 2023-05-23 19:38:26
*/
@Service
public class BaseAttrInfoServiceImpl extends ServiceImpl<BaseAttrInfoMapper, BaseAttrInfo>
    implements BaseAttrInfoService{

    @Override
    public List<BaseAttrInfo> getBaseAttrValue(Long category1Id, Long category2Id, Long category3Id) {
        return baseMapper.getBaseAttrAndValue(category1Id, category2Id, category3Id);
    }
}




