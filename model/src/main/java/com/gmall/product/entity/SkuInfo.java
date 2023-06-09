package com.gmall.product.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import lombok.Data;

/**
 * 库存单元表
 *
 * @TableName sku_info
 */
@TableName(value = "sku_info")
@Data
public class SkuInfo implements Serializable {
    /**
     * 库存id(itemID)
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 商品id
     */
    private Long spuId;

    /**
     * 价格
     */
    private BigDecimal price;

    /**
     * sku名称
     */
    private String skuName;

    /**
     * 商品规格描述
     */
    private String skuDesc;

    /**
     * 重量
     */
    private BigDecimal weight;

    /**
     * 品牌(冗余)
     */
    private Long tmId;

    /**
     * 三级分类id（冗余)
     */
    private Long category3Id;

    /**
     * 默认显示图片(冗余)
     */
    private String skuDefaultImg;

    /**
     * 是否销售（1：是 0：否）
     */
    private Integer isSale;

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
    private List<SkuImage> skuImageList;//sku的图片列表

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}