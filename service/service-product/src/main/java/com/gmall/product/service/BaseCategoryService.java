package com.gmall.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.gmall.product.entity.BaseCategory1;

import java.util.List;

/**
 * @Auther: Administrator
 * @Date: 2023/5/23
 */
public interface BaseCategoryService extends IService<BaseCategory1> {
    List<BaseCategory1> getCategory1();
}
