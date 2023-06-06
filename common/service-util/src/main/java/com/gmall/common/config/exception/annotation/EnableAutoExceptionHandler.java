package com.gmall.common.config.exception.annotation;

import com.gmall.common.config.exception.GlobalExceptionAutoConfiguration;
import com.gmall.common.config.exception.handler.GlobalExceptionHandler;
import org.springframework.context.annotation.Import;

import java.lang.annotation.*;

/**
 * @Auther: Administrator
 * @Description
 * @Date: 2023/6/6
 */
@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Inherited
@Import(GlobalExceptionAutoConfiguration.class)
public @interface EnableAutoExceptionHandler {
}
