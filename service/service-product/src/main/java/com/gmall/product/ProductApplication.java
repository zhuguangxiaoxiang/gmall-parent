package com.gmall.product;

import com.gmall.common.config.Swagger2Config;
import com.gmall.common.config.minio.annotation.EnableMinio;
import com.gmall.common.config.minio.config.MinioConfiguration;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.cloud.client.SpringCloudApplication;
import org.springframework.context.annotation.Import;


//@EnableCircuitBreaker
//@EnableDiscoveryClient
//@SpringBootApplication
//启动只扫描主程序所在的包以及子包
//主程序：   com.gmall.product
//swagger： com.gmall.common.config
//minio:    com.gmall.common.config.minio

@EnableMinio //开启minio功能
@Import({Swagger2Config.class})
@MapperScan(basePackages = "com.gmall.product.mapper")
@SpringCloudApplication //这是一个cloud服务，自动开始服务发现，服务熔断等功能
public class ProductApplication {

    public static void main(String[] args) {
        SpringApplication.run(ProductApplication.class, args);
    }
}
