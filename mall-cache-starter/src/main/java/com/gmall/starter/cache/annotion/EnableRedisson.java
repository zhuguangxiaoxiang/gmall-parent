package com.gmall.starter.cache.annotion;

import com.gmall.starter.cache.redisson.RedissonAutoConfiguration;
import org.springframework.context.annotation.Import;

import java.lang.annotation.*;

/**
 * @Auther: Administrator
 * @Description
 * @Date: 2023/6/6
 */
@Import(RedissonAutoConfiguration.class)
@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Inherited
public @interface EnableRedisson {
}
