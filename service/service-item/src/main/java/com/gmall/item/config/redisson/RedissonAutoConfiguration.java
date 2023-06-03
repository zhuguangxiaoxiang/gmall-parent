package com.gmall.item.config.redisson;

import org.redisson.Redisson;
import org.redisson.api.RedissonClient;
import org.redisson.config.Config;
import org.springframework.boot.autoconfigure.AutoConfigureAfter;
import org.springframework.boot.autoconfigure.data.redis.RedisAutoConfiguration;
import org.springframework.boot.autoconfigure.data.redis.RedisProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @Auther: Administrator
 * @Description
 * @Date: 2023/6/1
 */
@AutoConfigureAfter(RedisAutoConfiguration.class)
@Configuration
public class RedissonAutoConfiguration {

    @Bean
    public RedissonClient redissonClient(RedisProperties redisProperties) {
        Config config = new Config();

        config.useSingleServer()
                .setAddress("redis://" + redisProperties.getHost() + ":" + redisProperties.getPort())
                .setPassword(redisProperties.getPassword());
        System.out.println(redisProperties.getHost());
        //1、创建客户端对象
        RedissonClient client = Redisson.create();
        return client;
    }
}
