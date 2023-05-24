package com.gmall.product.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gmall.product.entity.BaseCategory2;
import com.gmall.product.service.BaseCategory2Service;
import com.gmall.product.mapper.BaseCategory2Mapper;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Administrator
 * @description 针对表【base_category2(二级分类表)】的数据库操作Service实现
 * @createDate 2023-05-24 18:29:57
 */
@Service
public class BaseCategory2ServiceImpl extends ServiceImpl<BaseCategory2Mapper, BaseCategory2>
        implements BaseCategory2Service {

    @Override
    public List<BaseCategory2> getCategory2(Long category1Id) {
        return this.list(new LambdaQueryWrapper<BaseCategory2>().eq(BaseCategory2::getCategory1Id, category1Id).eq(BaseCategory2::getIsDeleted, 0));
    }
}




