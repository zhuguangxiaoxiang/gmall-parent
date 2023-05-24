package com.gmall.product.service;

import com.gmall.product.entity.BaseCategory1;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
* @author Administrator
* @description 针对表【base_category1(一级分类表)】的数据库操作Service
* @createDate 2023-05-24 18:29:57
*/
public interface BaseCategory1Service extends IService<BaseCategory1> {

    List<BaseCategory1> getCategory1();
}
