package com.gmall.product.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gmall.product.entity.BaseCategory1;
import com.gmall.product.mapper.BaseCategoryMapper;
import com.gmall.product.service.BaseCategoryService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Auther: Administrator
 * @Date: 2023/5/23
 */
@Service
public class BaseCategoryImpl extends ServiceImpl<BaseCategoryMapper, BaseCategory1> implements BaseCategoryService {
    @Override
    public List<BaseCategory1> getCategory1() {
        return this.list(null);
    }
}
