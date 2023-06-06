package com.gmall.common.config.exception;

import com.gmall.common.config.exception.handler.GlobalExceptionHandler;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;


/**
 * @Auther: Administrator
 * @Description
 * @Date: 2023/6/6
 */
@Import(GlobalExceptionHandler.class)
@Configuration
public class GlobalExceptionAutoConfiguration {
}
