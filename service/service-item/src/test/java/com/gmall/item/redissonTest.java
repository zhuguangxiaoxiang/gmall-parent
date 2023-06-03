package com.gmall.item;

import org.junit.jupiter.api.Test;
import org.redisson.Redisson;
import org.redisson.api.RedissonClient;
import org.redisson.config.Config;

/**
 * @Auther: Administrator
 * @Description
 * @Date: 2023/6/1
 */
public class redissonTest {
    @Test
    void redissonClient() {
        //1、创建配置
        Config config = new Config();
        config.useSingleServer()
                .setAddress("redis://192.168.200.123:6379")
                .setPassword("123456");
        //1、创建客户端对象
        RedissonClient client = Redisson.create();
        System.out.println(client);
        //2、使用功能

    }
}
