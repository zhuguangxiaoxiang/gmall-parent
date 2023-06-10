package com.gmall.item;

import com.gmall.common.config.exception.annotation.EnableAutoExceptionHandler;
import com.gmall.common.config.thread.annotation.EnableAppThreadPool;
import org.springframework.boot.SpringApplication;
import org.springframework.cloud.client.SpringCloudApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 * @Auther: Administrator
 * @Date: 2023/5/29
 *
 * Spring：Redis
 * 1、导入starter
 * 2、写配置就行
 */
//@EnableAppCache
@EnableAutoExceptionHandler
@EnableAppThreadPool
//用谁扫谁
@EnableFeignClients(basePackages = {
        "com.gmall.feign.product",
        "com.gmall.feign.search"
})
@SpringCloudApplication
public class ItemApplication {
    public static void main(String[] args) {
        SpringApplication.run(ItemApplication.class, args);
    }
}
