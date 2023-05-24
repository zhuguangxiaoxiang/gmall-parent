package com.gmall.product.service;

import com.gmall.product.entity.BaseAttrInfo;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
* @author Administrator
* @description 针对表【base_attr_info(属性表)】的数据库操作Service
* @createDate 2023-05-24 18:29:56
*/
public interface BaseAttrInfoService extends IService<BaseAttrInfo> {

    List<BaseAttrInfo> getAttrValueAndName(Long category1Id, Long category2Id, Long category3Id);
}
