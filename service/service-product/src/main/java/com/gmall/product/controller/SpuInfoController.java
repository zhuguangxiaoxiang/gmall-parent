package com.gmall.product.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gmall.common.result.Result;
import com.gmall.product.entity.SpuImage;
import com.gmall.product.entity.SpuInfo;
import com.gmall.product.service.SpuInfoService;
import com.gmall.product.vo.SpuSaveInfoVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @Auther: Administrator
 * @Date: 2023/5/26
 */
@RequestMapping("/admin/product")
@Api(tags = "SPU管理")
@RestController
public class SpuInfoController {

    @Autowired
    SpuInfoService spuInfoService;


    @ApiOperation("根据spuId获取图片列表")
    @GetMapping("/spuImageList/{spuId}")
    public Result spuImageList(@PathVariable("spuId") Long spuId) {
        List<SpuImage> spuImageList = spuInfoService.getSpuImage(spuId);
         return Result.ok(spuImageList);
    }

    @GetMapping("/{page}/{limit}")
    @ApiOperation("根据三级分类ID获取spu分页列表")
    public Result getSpuInfo(SpuInfo spuInfo,//还有一种写法 传递的参数与实体类里的一致可以用实体类接收 SpuInfo spuInfo  @RequestParam("category3Id") Long category3Id
                             @PathVariable("page") Long page,
                             @PathVariable("limit") Long limit
                             ) {
        Page<SpuInfo> spuInfoList = spuInfoService.getSpuInfo(new Page<SpuInfo>(page, limit), spuInfo.getCategory3Id());
        return Result.ok(spuInfoList);
    }

    /**
     * 1、模型固定：如果前端传递一个复杂的JSON。一定要先编写一个vo来进行数据封装
     * 2、模型不固定：就直接用map接受比较方便
     * @param spuSaveInfoVo
     * @return
     */
    @PostMapping("/saveSpuInfo")
    @ApiOperation("添加SPU")
    public Result saveSpuInfo(@RequestBody SpuSaveInfoVo spuSaveInfoVo) {
        //保存SPU
        spuInfoService.saveSpuInfo(spuSaveInfoVo);
        return Result.ok();
    }
}
