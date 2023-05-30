package com.gmall.web.controller;

import com.gmall.common.result.Result;
import com.gmall.product.vo.SkuDetailVo;
import com.gmall.web.feign.SkuDetailFeignClient;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import javax.annotation.Resource;

/**
 * @Auther: Administrator
 * @Date: 2023/5/29
 */
@Controller
public class ItemController {

    @Resource
    SkuDetailFeignClient skuDetailFeignClient;

    /**
     * 商品详情页
     *
     * @param skuId
     * @return
     */
    @GetMapping("/{skuId}.html")
    public String itemPage(@PathVariable("skuId") Long skuId,
                           Model model) {
        //远程调用查询数据
        Result<SkuDetailVo> skuDetails = skuDetailFeignClient.getSkuDetails(skuId);

        SkuDetailVo skuDetailVo = skuDetails.getData();

        //1、分类视图{category1Id,category2Id,category3Id,category1Name,category2Name,category3Name}
        model.addAttribute("categoryView", skuDetailVo.getCategoryView());

        //2、sku信息{基本信息，图片列表}
        model.addAttribute("skuInfo", skuDetailVo.getSkuInfo());

        //3、实时价格
        model.addAttribute("price", skuDetailVo.getPrice());

        //4、所有销售属性集合
        model.addAttribute("spuSaleAttrList", skuDetailVo.getSpuSaleAttrList());

        //5、valuesSkuJson
        model.addAttribute("valuesSkuJson", skuDetailVo.getValuesSkuJson());

        //TODO 6、sku的规格；平台属性
        return "item/index";
    }
}
