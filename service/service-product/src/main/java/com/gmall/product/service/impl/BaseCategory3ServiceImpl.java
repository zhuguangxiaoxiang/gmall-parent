package com.gmall.product.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gmall.product.entity.BaseCategory2;
import com.gmall.product.entity.BaseCategory3;
import com.gmall.product.service.BaseCategory3Service;
import com.gmall.product.mapper.BaseCategory3Mapper;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Administrator
 * @description 针对表【base_category3(三级分类表)】的数据库操作Service实现
 * @createDate 2023-05-23 19:38:26
 */
@Service
public class BaseCategory3ServiceImpl extends ServiceImpl<BaseCategory3Mapper, BaseCategory3>
        implements BaseCategory3Service {

    @Override
    public List<BaseCategory3> getCategory3(Long category2) {
        return this.list(new LambdaQueryWrapper<BaseCategory3>().eq(BaseCategory3::getCategory2Id, category2));
    }
}




