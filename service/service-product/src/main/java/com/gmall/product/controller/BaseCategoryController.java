package com.gmall.product.controller;

import com.gmall.common.result.Result;
import com.gmall.product.entity.BaseCategory1;
import com.gmall.product.entity.BaseCategory2;
import com.gmall.product.entity.BaseCategory3;
import com.gmall.product.service.BaseCategory1Service;
import com.gmall.product.service.BaseCategory2Service;
import com.gmall.product.service.BaseCategory3Service;
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
 * @Date: 2023/5/24
 */

@Api(tags = "三级分类管理")
@RequestMapping("/admin/product")
@RestController
public class BaseCategoryController {

    @Autowired
    BaseCategory1Service baseCategory1Service;

    @Autowired
    BaseCategory2Service baseCategory2Service;

    @Autowired
    BaseCategory3Service baseCategory3Service;

    /**
     * 获取一级分类
     * @return
     */
    @ApiOperation("获取一级分类")
    @GetMapping("/getCategory1")
    public Result getCatory1() {
        List<BaseCategory1> category1s = baseCategory1Service.getCategory1();
        return Result.ok(category1s);
    }


    @ApiOperation("获取某个一级分类下的所有二级分类")
    @GetMapping("/getCategory2/{category1Id}")
    public Result getCatory2(@PathVariable("category1Id") Long category1Id) {
        List<BaseCategory2> category2s = baseCategory2Service.getCategory2(category1Id);
        return Result.ok(category2s);
    }

    @ApiOperation("获取某个二级分类下的所有三级分类")
    @GetMapping("/getCategory3/{category2Id}")
    public Result getCatory3(@PathVariable("category2Id") Long category2Id) {
        List<BaseCategory3> category3s = baseCategory3Service.getCategory3(category2Id);
        return Result.ok(category3s);
    }
}
