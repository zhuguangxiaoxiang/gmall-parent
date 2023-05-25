package com.gmall.product.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * spu销售属性值
 * @TableName spu_sale_attr_value
 */
@TableName(value ="spu_sale_attr_value")
@Data
public class SpuSaleAttrValue implements Serializable {
    /**
     * 销售属性值编号
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 商品id
     */
    private Long spuId;

    /**
     * 销售属性id
     */
    private Long baseSaleAttrId;

    /**
     * 销售属性值名称
     */
    private String saleAttrValueName;

    /**
     * 销售属性名称(冗余)
     */
    private String saleAttrName;

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