package com.gmall.product.vo;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;
import lombok.NoArgsConstructor;
import com.gmall.product.vo.dto.SpuSaleAttrValueListAndNameDTO;
import java.util.List;

/**
 * @Auther: Administrator
 * @Date: 2023/5/28
 */
@NoArgsConstructor
@Data
public class SpuSaleAttrVo {

    @JsonProperty("id")
    private Integer id;
    @JsonProperty("spuId")
    private Integer spuId;
    @JsonProperty("baseSaleAttrId")
    private Integer baseSaleAttrId;
    @JsonProperty("saleAttrName")
    private String saleAttrName;
    @JsonProperty("spuSaleAttrValueList")
    private List<SpuSaleAttrValueListAndNameDTO> spuSaleAttrValueList;

}
