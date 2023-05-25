package com.gmall.product.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import lombok.Data;

/**
 * 属性表
 * @TableName base_attr_info
 */
@TableName(value ="base_attr_info")
@Data
public class BaseAttrInfo implements Serializable {
    /**
     * 编号
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 属性名称
     */
    private String attrName;

    /**
     * 分类id
     */
    private Long categoryId;

    /**
     * 分类层级
     */
    private Integer categoryLevel;

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
    private List<BaseAttrValue> attrValueList;


    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}