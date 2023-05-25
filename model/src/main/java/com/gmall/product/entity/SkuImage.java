package com.gmall.product.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 库存单元图片表
 * @TableName sku_image
 */
@TableName(value ="sku_image")
@Data
public class SkuImage implements Serializable {
    /**
     * 编号
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 商品id
     */
    private Long skuId;

    /**
     * 图片名称（冗余）
     */
    private String imgName;

    /**
     * 图片路径(冗余)
     */
    private String imgUrl;

    /**
     * 商品图片id
     */
    private Long spuImgId;

    /**
     * 是否默认
     */
    private String isDefault;

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