package com.gmall.product.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gmall.common.result.Result;
import com.gmall.product.entity.SkuImage;
import com.gmall.product.entity.SkuInfo;
import com.gmall.product.entity.SpuImage;
import com.gmall.product.service.SkuInfoService;
import com.gmall.product.vo.SkuSaveInfoVo;
import com.gmall.starter.cache.constant.RedisConst;
import com.gmall.starter.cache.service.CacheService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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

    @Autowired
    CacheService cacheService;

    //修改sku
    @GetMapping("/updateSkuInfo")
    public Result updateSkuInfo(@RequestBody SkuSaveInfoVo skuSaveInfoVo) {
        //1、修改数据库

        //2、删除缓存
        cacheService.delayDoubleDel(RedisConst.SKU_DETAIL_CACHE + skuSaveInfoVo.getId());
        return Result.ok();
    }


    @ApiOperation("下架")
    @GetMapping("/cancelSale/{skuId}")
    public Result cancelSale(@PathVariable("skuId") Long skuId) {
        skuInfoService.cancelSale(skuId);
        return Result.ok();
    }

    @ApiOperation("上架")
    @GetMapping("/onSale/{skuId}")
    public Result onSale(@PathVariable("skuId") Long skuId) {
        skuInfoService.onSale(skuId);
        return Result.ok();
    }
    @ApiOperation("保存sku")
    @PostMapping("/saveSkuInfo")
    public Result saveSkuInfo(@RequestBody SkuSaveInfoVo skuSaveInfoVo) {
        skuInfoService.saveSkuInfo(skuSaveInfoVo);
        return Result.ok();
    }

    @ApiOperation("获取sku分页列表")
    @GetMapping("/list/{page}/{limit}")
    public Result skuInfoList(@PathVariable("page") Long page,
                              @PathVariable("limit") Long limit) {
        Page<SkuInfo> skuInfoPage = skuInfoService.getSkuInfoList(new Page<SkuInfo>(page, limit));
        return Result.ok(skuInfoPage);
    }
}
