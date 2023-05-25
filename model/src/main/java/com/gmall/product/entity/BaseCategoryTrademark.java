package com.gmall.product.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 三级分类表
 * @TableName base_category_trademark
 */
@TableName(value ="base_category_trademark")
@Data
public class BaseCategoryTrademark implements Serializable {
    /**
     * 编号
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 三级级分类id
     */
    private Long category3Id;

    /**
     * 品牌id
     */
    private Long trademarkId;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 
     */
    private Date updateTime;

    /**
     * 
     */
    @TableLogic
    private Integer isDeleted;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}