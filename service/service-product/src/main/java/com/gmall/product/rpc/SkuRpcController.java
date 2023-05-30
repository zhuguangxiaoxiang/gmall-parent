package com.gmall.product.rpc;

import com.gmall.common.result.Result;
import com.gmall.product.entity.SkuImage;
import com.gmall.product.entity.SkuInfo;
import com.gmall.product.entity.SpuSaleAttr;
import com.gmall.product.service.SkuImageService;
import com.gmall.product.service.SkuInfoService;
import com.gmall.product.service.SpuSaleAttrService;
import com.gmall.product.vo.SpuSaleAttrVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;
import java.util.List;

/**
 * @Auther: Administrator
 * @Date: 2023/5/29
 */
@RestController
@RequestMapping("/api/inner/rpc/product")
public class SkuRpcController {

    @Autowired
    SkuInfoService skuInfoService;

    @Autowired
    SkuImageService skuImageService;

    @Autowired
    SpuSaleAttrService spuSaleAttrService;

    /**
     * 1、获取sku-info
     *
     * @param skuId
     * @return
     */
    @GetMapping("/skuinfo/{skuId}")
    public Result<SkuInfo> getSkuInfo(@PathVariable Long skuId) {
        SkuInfo skuInfo = skuInfoService.getById(skuId);
        return Result.ok(skuInfo);
    }

    /**
     * 2、获取sku-images
     *
     * @param skuId
     * @return
     */
    @GetMapping("/skuimages/{skuId}")
    public Result<List<SkuImage>> getSkuImages(@PathVariable("skuId") Long skuId) {
        List<SkuImage> skuImages = skuImageService.lambdaQuery().eq(SkuImage::getSkuId, skuId).list();
        return Result.ok(skuImages);
    }

    /**
     * 3、获取实时价格
     *
     * @param skuId
     * @return
     */
    @GetMapping("/skuprices/{skuId}")
    public Result<BigDecimal> getPrice(@PathVariable("skuId") Long skuId) {
        SkuInfo one = skuInfoService.lambdaQuery()
                .select(SkuInfo::getPrice)//只查找指定列
                .eq(SkuInfo::getId, skuId)
                .one();
        return Result.ok(one.getPrice());
    }

    /**
     * 4、获取spu销售属性名和值集合
     *
     * @param spuId
     * @return
     */
    @GetMapping("/SkuSaleAttr/{spuId}/{skuId}")
    public Result<List<SpuSaleAttr>> getSpuSaleAttr(@PathVariable("spuId") Long spuId,
                                                      @PathVariable("skuId") Long skuId) {
        List<SpuSaleAttr> spuSaleAttrList = spuSaleAttrService.getSpuSaleAttrListOrder(spuId, skuId);
        return Result.ok(spuSaleAttrList);
    }

    /**
     * 5、获取valueSkuJson
     *
     * @param spuId
     * @return
     */
    @GetMapping("/valueSkuJson/{spuId}")
    public Result<String> getValueSkuJson(@PathVariable("spuId") Long spuId) {

        String json = spuSaleAttrService.getValuesSkuJson(spuId);
        return Result.ok(json);
    }
}
