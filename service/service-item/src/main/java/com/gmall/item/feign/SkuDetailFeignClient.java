package com.gmall.item.feign;

import com.gmall.common.result.Result;
import com.gmall.product.entity.SkuImage;
import com.gmall.product.entity.SkuInfo;
import com.gmall.product.entity.SpuSaleAttr;
import com.gmall.product.vo.CategoryTreeVo;
import com.gmall.product.vo.SpuSaleAttrVo;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.math.BigDecimal;
import java.util.List;

/**
 * @Auther: Administrator
 * @Date: 2023/5/29
 */
@RequestMapping("/api/inner/rpc/product")
@FeignClient("service-product")
public
interface SkuDetailFeignClient {
    /**
     * 1、根据三级分类ID，得到整个分类的完整路径
     *
     * @param c3Id
     * @return
     */
    @GetMapping("/category/view/{c3Id}")
    Result<CategoryTreeVo> getCategoryTreeWithC3Id(@PathVariable("c3Id") Long c3Id);

    /**
     * 2、获取sku-info
     *
     * @param skuId
     * @return
     */
    @GetMapping("/skuinfo/{skuId}")
    Result<SkuInfo> getSkuInfo(@PathVariable Long skuId);

    /**
     * 3、获取sku-images
     *
     * @param skuId
     * @return
     */
    @GetMapping("/skuimages/{skuId}")
    Result<List<SkuImage>> getSkuImages(@PathVariable("skuId") Long skuId);


    /**
     * 4、获取实时价格
     *
     * @param skuId
     * @return
     */
    @GetMapping("/skuprices/{skuId}")
    Result<BigDecimal> getPrice(@PathVariable("skuId") Long skuId);

    /**
     * 5、获取spu销售属性名和值集合
     *
     * @param spuId
     * @param skuId
     * @return
     */
    @GetMapping("/SkuSaleAttr/{spuId}/{skuId}")
    Result<List<SpuSaleAttr>> getSpuSaleAttr(@PathVariable("spuId") Long spuId,
                                             @PathVariable("skuId") Long skuId);

    /**
     * 6、获取valueSkuJson
     *
     * @param spuId
     * @return
     */
    @GetMapping("/valueSkuJson/{spuId}")
    Result<String> getValueSkuJson(@PathVariable("spuId") Long spuId);
}
