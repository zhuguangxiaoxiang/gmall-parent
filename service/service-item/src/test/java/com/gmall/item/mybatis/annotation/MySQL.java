package com.gmall.item.mybatis.annotation;

import java.lang.annotation.*;

/**
 * @Auther: Administrator
 * @Description
 * @Date: 2023/6/4
 */
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface MySQL {
    String value();
}
