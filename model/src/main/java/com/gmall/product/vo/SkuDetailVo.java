package com.gmall.product.vo;

import com.gmall.product.entity.SkuInfo;
import com.gmall.product.entity.SpuSaleAttr;
import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

/**
 * @Auther: Administrator
 * @Date: 2023/5/29
 */
@Data
public class SkuDetailVo {
    //分类信息
    private CategoryViewDTO categoryView;

    //2、sku信息
    private SkuInfo skuInfo;

    //3、价格
    private BigDecimal price;

    //4、销售属性集合
    private List<SpuSaleAttr> spuSaleAttrList;

    //5、valueSkuJson
    private String valuesSkuJson;

    @Data
    public static class CategoryViewDTO {
        private Long category1Id;
        private Long category2Id;
        private Long category3Id;
        private String category1Name;
        private String category2Name;
        private String category3Name;
    }
}
