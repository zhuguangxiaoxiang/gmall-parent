package com.gmall.product.vo;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @Auther: Administrator
 * @Date: 2023/5/27
 */
@NoArgsConstructor
@Data
public class SpuSaveInfoVo {

    @JsonProperty("id")
    private Long id;
    @JsonProperty("spuName")
    private String spuName;
    @JsonProperty("description")
    private String description;
    @JsonProperty("category3Id")
    private Long category3Id;
    @JsonProperty("tmId")
    private Long tmId;
    //把以上信息存到spu_info里
    @JsonProperty("spuImageList")
    private List<SpuImageListDTO> spuImageList;
    @JsonProperty("spuSaleAttrList")
    private List<SpuSaleAttrListDTO> spuSaleAttrList;

    @NoArgsConstructor
    @Data
    public static class SpuImageListDTO {
        @JsonProperty("imgName")
        private String imgName;
        @JsonProperty("imgUrl")
        private String imgUrl;
    }

    @NoArgsConstructor
    @Data
    public static class SpuSaleAttrListDTO {
        @JsonProperty("baseSaleAttrId")
        private Long baseSaleAttrId;
        @JsonProperty("saleAttrName")
        private String saleAttrName;
        @JsonProperty("spuSaleAttrValueList")
        private List<SpuSaleAttrValueListDTO> spuSaleAttrValueList;

        @NoArgsConstructor
        @Data
        public static class SpuSaleAttrValueListDTO {
            @JsonProperty("baseSaleAttrId")
            private Long baseSaleAttrId;
            @JsonProperty("saleAttrValueName")
            private String saleAttrValueName;
        }
    }
}
