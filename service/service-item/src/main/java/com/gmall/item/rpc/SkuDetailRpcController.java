package com.gmall.item.rpc;

import com.gmall.common.result.Result;
import com.gmall.item.service.SkuDetailService;
import com.gmall.product.vo.SkuDetailVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Auther: Administrator
 * @Description sku详情
 * @Date: 2023/5/29
 */
@RequestMapping("/api/inner/rpc/item")
@RestController
public class SkuDetailRpcController {

    @Autowired
    SkuDetailService skuDetailService;

    /**
     * 获取商品详情数据
     * @param skuId
     * @return
     */
    @GetMapping("/sku/detail/{skuId}")
    public Result<SkuDetailVo> getSkuDetails(@PathVariable("skuId") Long skuId){
        SkuDetailVo skuDetailVo = skuDetailService.getSkuDetailData(skuId);
        //TODO 获取商品详情
        return Result.ok(skuDetailVo);
    }
}