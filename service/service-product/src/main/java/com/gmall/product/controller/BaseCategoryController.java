package com.gmall.product.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.gmall.common.result.Result;
import com.gmall.product.entity.BaseCategory1;
import com.gmall.product.entity.BaseCategory2;
import com.gmall.product.entity.BaseCategory3;
import com.gmall.product.service.BaseCategory2Service;
import com.gmall.product.service.BaseCategory3Service;
import com.gmall.product.service.BaseCategoryService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @Auther: Administrator
 * @Date: 2023/5/23
 */
@Api(tags = "三级分类管理")
@RequestMapping("/admin/product/")
@RestController
public class BaseCategoryController {

    @Autowired
    BaseCategoryService baseCategoryService;

    @Autowired
    BaseCategory2Service baseCategory2Service;
    
    @Autowired
    BaseCategory3Service baseCategory3Service;

    /**
     * 查询所有一级分类
     *
     * @return
     */
    @ApiOperation("查询所有一级分类")
    @GetMapping("/getCategory1")
    public Result getCategory1() {
        List<BaseCategory1> category1s = baseCategoryService.getCategory1();
        return Result.ok(category1s);
    }

    /**
     * 查询某个一级分类下的所有二级分类
     */
    @ApiOperation("查询某个一级分类下的所有二级分类")
    @GetMapping("/getCategory2/{category1}")
    public Result getCategory2(@PathVariable("category1") Long category1) {
        List<BaseCategory2> category2s = baseCategory2Service.getCategory2(category1);
        return Result.ok(category2s);
    }  
    
    /**
     * 查询某个二级分类下的所有三级分类
     */
    @ApiOperation("查询某个二级分类下的所有三级分类")
    @GetMapping("/getCategory3/{category2}")
    public Result getCategory3(@PathVariable("category2") Long category2) {
        List<BaseCategory3> category3s = baseCategory3Service.getCategory3(category2);
        return Result.ok(category3s);
    }
}
