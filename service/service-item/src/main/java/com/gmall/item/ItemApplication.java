package com.gmall.item;

import com.gmall.common.config.thread.annotation.EnableAppThreadPool;
import org.springframework.boot.SpringApplication;
import org.springframework.cloud.client.SpringCloudApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

/**
 * @Auther: Administrator
 * @Date: 2023/5/29
 */
@EnableAspectJAutoProxy
//@EnableAppThreadPool
@EnableFeignClients
@SpringCloudApplication
public class ItemApplication {
    public static void main(String[] args) {
        SpringApplication.run(ItemApplication.class, args);
    }
}
