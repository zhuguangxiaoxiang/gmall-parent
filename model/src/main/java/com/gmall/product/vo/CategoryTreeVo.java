package com.gmall.product.vo;

import lombok.Data;

import java.util.List;

/**
 * @Auther: Administrator
 * @Date: 2023/5/29
 */
@Data
public class CategoryTreeVo {
    //分类ID
    private Long categoryId;

    //分类名
    private String categoryName;

    //子分类
    private List<CategoryTreeVo> categoryChild;
}
