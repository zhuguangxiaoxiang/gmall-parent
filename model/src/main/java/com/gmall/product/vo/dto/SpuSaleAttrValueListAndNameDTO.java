package com.gmall.product.vo.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Auther: Administrator
 * @Date: 2023/5/28
 */

@NoArgsConstructor
@Data
public class SpuSaleAttrValueListAndNameDTO {
    @JsonProperty("id")
    private Integer id;
    @JsonProperty("spuId")
    private Integer spuId;
    @JsonProperty("baseSaleAttrId")
    private Integer baseSaleAttrId;
    @JsonProperty("saleAttrValueName")
    private String saleAttrValueName;
    @JsonProperty("saleAttrName")
    private String saleAttrName;
    @JsonProperty("isChecked")
    private String isChecked;
}
