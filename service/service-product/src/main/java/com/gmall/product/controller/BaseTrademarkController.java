package com.gmall.product.controller;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gmall.common.result.Result;
import com.gmall.product.entity.BaseTrademark;
import com.gmall.product.service.BaseTrademarkService;
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
 * @Date: 2023/5/26
 */
@RequestMapping("/admin/product/baseTrademark")
@Api(tags = "品牌管理")
@RestController
public class BaseTrademarkController {

    @Autowired
    BaseTrademarkService baseTrademarkService;

    /**
     * 获取品牌属性
     * @return
     */
    //http://api.gmall.com/admin/product/baseTrademark/getTrademarkList
    @ApiOperation("获取品牌属性")
    @GetMapping("/getTrademarkList")
    public Result getTrademarkList() {
        List<BaseTrademark> TrademarkList = baseTrademarkService.getTrademarkList();
        return Result.ok(TrademarkList);
    }

    /**
     * 获取品牌分页列表
     * @param page
     * @param limit
     * @return
     */
    @ApiOperation("分页获取品牌分页列表")
    //http://api.gmall.com/admin/product/{page}/{limit}?category3Id=61
    @GetMapping("/{page}/{limit}")
    public Result getTrademarkPage(@PathVariable("page") Long page,
                                   @PathVariable("limit") Long limit) {
        //Mybatis-Plus封装了分页方法，封装了一个分页查询结构Ipage
        Page<BaseTrademark> baseTrademarkPage = new Page<>(page, limit);
        Page<BaseTrademark> baseTrademark = baseTrademarkService.getTrademarkPage(baseTrademarkPage);
        return Result.ok(baseTrademark);
    }
}
