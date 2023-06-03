package com.gmall.product.init;

import com.gmall.common.constant.RedisConst;
import com.gmall.product.entity.SkuInfo;
import com.gmall.product.service.SkuInfoService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @Auther: Administrator
 * @Description
 * @Date: 2023/5/31
 */
@Slf4j
@Component
public class InitRunner implements CommandLineRunner {


    @Autowired
    StringRedisTemplate redisTemplate;

    @Autowired
    SkuInfoService skuInfoService;

    @Override
    public void run(String... args) throws Exception {
        log.info("InitRunner...启动run,skuInfoService:{}", skuInfoService);
        initBitMap();
    }


    public void initBitMap() {
        log.info("正在初始化 skuids-bitmap");
        List<SkuInfo> ids = skuInfoService.lambdaQuery().select(SkuInfo::getId).list();
        ids.forEach(item -> {
            redisTemplate.opsForValue().setBit(RedisConst.SKUID_BIT_MAP, item.getId(), true);
        });
        log.info("初始化 skuids-bitmap完成");
    }
}
