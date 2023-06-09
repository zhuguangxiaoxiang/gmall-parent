package com.gmall.product.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gmall.product.entity.BaseCategory1;
import com.gmall.product.service.BaseCategory1Service;
import com.gmall.product.mapper.BaseCategory1Mapper;
import com.gmall.product.vo.CategoryTreeVo;
import com.gmall.starter.cache.aspect.annotaion.MallCache;
import com.gmall.starter.cache.constant.RedisConst;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Administrator
 * @description 针对表【base_category1(一级分类表)】的数据库操作Service实现
 * @createDate 2023-05-24 18:29:57
 */
@Service
public class BaseCategory1ServiceImpl extends ServiceImpl<BaseCategory1Mapper, BaseCategory1>
        implements BaseCategory1Service {

    @Override
    public List<BaseCategory1> getCategory1() {
        return this.list(null);
    }

    @MallCache(cacheKey = RedisConst.CATEGORY_CATCH)
    @Override
    public List<CategoryTreeVo> getCategoryTree() {
        List<CategoryTreeVo> categoryTreeVoList = baseMapper.getCategoryTree();
        return categoryTreeVoList;
    }

    @Override
    public CategoryTreeVo getCategoryTreeWithC3Id(Long c3Id) {
        CategoryTreeVo categoryTreeVo = baseMapper.getCategoryTreeWithC3Id(c3Id);
        return categoryTreeVo;
    }
}




