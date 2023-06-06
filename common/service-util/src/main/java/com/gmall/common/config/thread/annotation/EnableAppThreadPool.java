package com.gmall.common.config.thread.annotation;

import com.gmall.common.config.thread.AppThreadPoolAutoConfiguration;
import org.springframework.context.annotation.Import;

import java.lang.annotation.*;

/**
 * @Auther: Administrator
 * @Description
 * @Date: 2023/6/4
 */
@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Import({AppThreadPoolAutoConfiguration.class})
public @interface EnableAppThreadPool {
}
