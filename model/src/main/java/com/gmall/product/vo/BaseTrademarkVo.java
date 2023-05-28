package com.gmall.product.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Auther: Administrator
 * @Date: 2023/5/28
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class BaseTrademarkVo {

    private Long id;
    /**
     * 属性值
     */
    private String tmName;

    /**
     * 品牌logo的图片路径
     */
    private String logoUrl;


}
