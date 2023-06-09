package com.gmall.search.vo;

import lombok.Data;

import java.util.List;

/**
 * @Auther: Administrator
 * @Description
 * @Date: 2023/6/8
 */
@Data
public class searchRespVo {
    //1、检索用的参数
    private SearchParamVo searchParam;
    //2、品牌面包屑
    private String trademarkParam;
    //3、属性面包屑
    private List<Props> propsParamList;
    //4、品牌列表
    private List<Trademark> trademarkList;
    //5、属性列表
    private List<Attrs> attrsList;
    //6、URL参数
    private String urlParam;
    //7、排序信息
    private OrderMap orderMap;
    //8、TODO 商品列表
    private List<Object> goodsList;
    //9、页码
    private Long pageNo;
    //10、总页码
    private Long totalPages;



    @Data
    public static class Props {
        private String attrName;
        private String attrValue;
        private Long attrId;
    }

    @Data
    public static class Trademark {
        private Long tmId;
        private String tmName;
        private String tmLogoUrl;
    }

    @Data
    public static class Attrs {
        private String attrName;
        private List<String>attrValueList;
        private Long attrId;
    }

    @Data
    public static class OrderMap {
        private String type;
        private String sort;
    }
}
