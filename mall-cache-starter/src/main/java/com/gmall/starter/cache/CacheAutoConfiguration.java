package com.gmall.starter.cache;

import com.gmall.starter.cache.annotion.EnableRedisson;
import com.gmall.starter.cache.aspect.CacheAspect;
import com.gmall.starter.cache.redisson.RedissonAutoConfiguration;
import com.gmall.starter.cache.service.CacheService;
import com.gmall.starter.cache.service.impl.CacheServiceImpl;
import org.springframework.boot.autoconfigure.AutoConfigureAfter;
import org.springframework.boot.autoconfigure.data.redis.RedisAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

/**
 * @Auther: Administrator
 * @Description
 * @Date: 2023/6/6
 */
@EnableAspectJAutoProxy
@EnableRedisson
@AutoConfigureAfter({RedisAutoConfiguration.class, RedissonAutoConfiguration.class})
@Configuration
public class CacheAutoConfiguration {

    @Bean
    public CacheAspect cacheAspect() {
        return new CacheAspect();
    }

    @Bean
    public CacheService cacheService() {
        return new CacheServiceImpl();
    }
}
