package com.gmall.product.controller;

import com.gmall.common.result.Result;
import com.gmall.product.entity.BaseSaleAttr;
import com.gmall.product.service.BaseSaleAttrService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @Auther: Administrator
 * @Date: 2023/5/26
 */
@Api(tags = "销售属性管理")
@RequestMapping("/admin/product/")
@RestController
public class BaseSaleAttrController {

    @Autowired
    BaseSaleAttrService baseSaleAttrService;

    @ApiOperation("获取销售属性")
    @GetMapping("/baseSaleAttrList")
    public Result getBaseSaleAttrList() {
        List<BaseSaleAttr> baseSaleAttrList = baseSaleAttrService.list();
        return Result.ok(baseSaleAttrList);
    }
}
