package com.gmall.product.controller;

import com.gmall.common.result.Result;
import com.gmall.product.entity.BaseAttrInfo;
import com.gmall.product.service.BaseAttrInfoService;
import io.swagger.annotations.Api;
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
@Api(tags = "平台属性管理")
@RequestMapping("/admin/product")
@RestController
public class BaseAttrInfoController {

    @Autowired
    BaseAttrInfoService baseAttrInfoService;

    @GetMapping("/attrInfoList/{category1Id}/{category2Id}/{category3Id}")
    public Result getAttrInfoList(
            @PathVariable("category1Id") Long category1Id,
            @PathVariable("category2Id") Long category2Id,
            @PathVariable("category3Id") Long category3Id) {
        List<BaseAttrInfo> baseAttrInfoList = baseAttrInfoService.getAttrValueAndName(category1Id, category2Id, category3Id);
        return Result.ok(baseAttrInfoList);
    }
}
