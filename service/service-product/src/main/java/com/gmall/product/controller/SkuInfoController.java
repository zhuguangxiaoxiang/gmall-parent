package com.gmall.product.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gmall.common.result.Result;
import com.gmall.product.entity.SkuImage;
import com.gmall.product.entity.SkuInfo;
import com.gmall.product.entity.SpuImage;
import com.gmall.product.service.SkuInfoService;
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
 * @Date: 2023/5/27
 */
@RequestMapping("/admin/product")
@Api(tags = "SKU管理")
@RestController
public class SkuInfoController {

    @Autowired
    SkuInfoService skuInfoService;

    @ApiOperation("获取sku分页列表")
    @GetMapping("/list/{page}/{limit}")
    public Result skuInfoList(@PathVariable("page") Long page,
                              @PathVariable("limit") Long limit) {
        Page<SkuInfo> skuInfoPage = skuInfoService.getSkuInfoList(new Page<SkuInfo>(page, limit));
        return Result.ok(skuInfoPage);
    }
}
