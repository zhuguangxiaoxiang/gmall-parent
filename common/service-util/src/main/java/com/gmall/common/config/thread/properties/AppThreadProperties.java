package com.gmall.common.config.thread.properties;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * @Auther: Administrator
 * @Description
 * @Date: 2023/6/4
 */
@ConfigurationProperties(prefix = "app.threadpool")
@Data
public class AppThreadProperties {
    private Integer corePoolSize;
    private Integer maximumPoolSize;
    private Long keepAliveTime;
    private Integer workQueueSize;
}
