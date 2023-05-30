package com.gmall.product.mapper;

import com.gmall.product.entity.BaseCategory1;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.gmall.product.vo.CategoryTreeVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
* @author Administrator
* @description 针对表【base_category1(一级分类表)】的数据库操作Mapper
* @createDate 2023-05-24 18:29:57
* @Entity com.gmall.product.entity.BaseCategory1
*/
public interface BaseCategory1Mapper extends BaseMapper<BaseCategory1> {

    List<CategoryTreeVo> getCategoryTree();

    CategoryTreeVo getCategoryTreeWithC3Id(@Param("c3Id") Long c3Id);
}




