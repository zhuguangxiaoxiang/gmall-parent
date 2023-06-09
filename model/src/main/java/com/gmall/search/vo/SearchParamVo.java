package com.gmall.search.vo;

import lombok.Data;

/**
 * @Auther: Administrator
 * @Description 封装检索用的所有参数
 * @Date: 2023/6/8
 */
@Data
public class SearchParamVo {

    private Long category1Id;
    private Long category2Id;
    private Long category3Id;
    //以上是分类相关参数 category3Id=61

    //关键字检索
    private String keyword; //keyword=华为

    //品牌检索
    private String trademark;//trademark=2:华为

    //平台属性
    private String[] props;//&props=4:128G:机身内存&props=3:8GB:运行内存

    //排序方式 1:综合（热度分）    2：价格
    private String order;

    //页码
    private Integer pageNo = 1;
}
