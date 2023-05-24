package com.gmall.product.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import lombok.Data;

/**
 * 前端数据保护表
 * @TableName base_frontend_param
 */
@TableName(value ="base_frontend_param")
@Data
public class BaseFrontendParam implements Serializable {
    /**
     * 编号
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 属性名称
     */
    private String code;

    /**
     * 分类id
     */
    private Long deleteId;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}