package com.gmall.search;

import com.gmall.common.config.exception.annotation.EnableAutoExceptionHandler;
import com.gmall.common.config.thread.annotation.EnableAppThreadPool;
import org.springframework.boot.SpringApplication;
import org.springframework.cloud.client.SpringCloudApplication;
import org.springframework.data.elasticsearch.repository.config.EnableElasticsearchRepositories;

/**
 * @Auther: Administrator
 * @Description 检索
 * @Date: 2023/6/7
 */
@EnableElasticsearchRepositories
@EnableAutoExceptionHandler
@EnableAppThreadPool
@SpringCloudApplication
public class SearchApplication {
    public static void main(String[] args) {
        SpringApplication.run(SearchApplication.class, args);
    }
}
