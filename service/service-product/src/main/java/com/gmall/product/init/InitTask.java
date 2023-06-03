package com.gmall.product.init;

import com.gmall.common.constant.RedisConst;
import com.gmall.product.entity.SkuInfo;
import com.gmall.product.service.SkuInfoService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.SpringApplicationRunListener;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Auther: Administrator
 * @Description 项目启动就创建
 * @Date: 2023/5/31
 */
@Slf4j
public class InitTask implements SpringApplicationRunListener {


    SpringApplication application;





    public InitTask(SpringApplication application, String[] args) {
        log.info("监听器对象创建：applicaton:{}; args:{}", application, args);
    }

    @Override
    public void started(ConfigurableApplicationContext context) {
        log.info("监听到项目started;skuInfoService:{}");
    }

    @Override
    public void starting() {
        log.info("监听到项目starting");
    }


}
