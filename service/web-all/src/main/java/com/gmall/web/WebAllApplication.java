package com.gmall.web;

import com.gmall.common.config.exception.annotation.EnableAutoExceptionHandler;
import com.gmall.common.config.thread.annotation.EnableAppThreadPool;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.cloud.client.SpringCloudApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 * @Auther: Administrator
 * @Date: 2023/5/29
 */
//@SpringBootApplication(exclude = DataSourceAutoConfiguration.class)
//@EnableDiscoveryClient
//@EnableCircuitBreaker
//SpringBoot：只会扫描自己主程序所在的包和子包组件
@EnableAutoExceptionHandler
@EnableAppThreadPool
@EnableFeignClients(basePackages = {
        "com.gmall.feign.product",
        "com.gmall.feign.item"
})
@SpringCloudApplication
public class WebAllApplication {
    public static void main(String[] args) {
        SpringApplication.run(WebAllApplication.class, args);
    }
}
