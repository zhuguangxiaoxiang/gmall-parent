package com.gmall.product.controller;

import com.baomidou.mybatisplus.extension.api.R;
import com.gmall.common.result.Result;
import com.gmall.product.entity.BaseAttrInfo;
import com.gmall.product.entity.BaseAttrValue;
import com.gmall.product.service.BaseAttrInfoService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

/**
 * @Auther: Administrator
 * @Date: 2023/5/24
 */
@Api(tags = "平台属性管理")
@RequestMapping("/admin/product")
@RestController
public class BaseAttrInfoController {

    @Autowired
    BaseAttrInfoService baseAttrInfoService;

    @ApiOperation("根据分类id获取平台属性")
    @GetMapping("/attrInfoList/{category1Id}/{category2Id}/{category3Id}")
    public Result getAttrInfoList(
            @PathVariable("category1Id") Long category1Id,
            @PathVariable("category2Id") Long category2Id,
            @PathVariable("category3Id") Long category3Id) {
        List<BaseAttrInfo> baseAttrInfoList = baseAttrInfoService.getAttrValueAndName(category1Id, category2Id, category3Id);
        return Result.ok(baseAttrInfoList);
    }

    @ApiOperation("添加或修改平台属性")
    @PostMapping("/saveAttrInfo")
    public Result saveAttrInfo(@RequestBody BaseAttrInfo baseAttrInfo) {
        baseAttrInfoService.saveAttrInfo(baseAttrInfo);
        return Result.ok();
    }

    @ApiOperation("根据平台属性ID获取平台属性对象数据")
    @GetMapping("/getAttrValueList/{attrId}")
    public Result getAttrInfoListForId(@PathVariable("attrId") Long attrId) {
        //调用服务层方法直接查询平台属性值表
//        List<BaseAttrValue> baseAttrValueList = baseAttrInfoService.getAttrInfoListForId(attrId);
        //先查询平台属性，再从平台属性中获取到平台属性值
        BaseAttrInfo baseAttrInfo = baseAttrInfoService.getAttrInfo(attrId);
        return Result.ok(baseAttrInfo.getAttrValueList());
    }
}
