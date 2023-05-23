package com.gmall.product.mapper;

import com.gmall.product.entity.BaseAttrInfo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
* @author Administrator
* @description 针对表【base_attr_info(属性表)】的数据库操作Mapper
* @createDate 2023-05-23 19:38:26
* @Entity com.gmall.product.entity.BaseAttrInfo
*/
public interface BaseAttrInfoMapper extends BaseMapper<BaseAttrInfo> {

    List<BaseAttrInfo> getBaseAttrAndValue(@Param("category1Id") Long category1Id,
                                           @Param("category2Id") Long category2Id,
                                           @Param("category3Id") Long category3Id);
}




