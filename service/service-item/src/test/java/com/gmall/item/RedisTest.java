package com.gmall.item;
import java.util.Date;

import com.alibaba.fastjson.JSON;
import com.gmall.product.entity.SkuImage;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.StringRedisTemplate;

import java.util.UUID;

/**
 * @Auther: Administrator
 * @Date: 2023/5/30
 */
//@SpringBootTest
public class RedisTest {

    @Autowired
    StringRedisTemplate redisTemplate;

    @Test
    void testJson() {
        SkuImage skuImage = null;
        skuImage.setId(0L);
        skuImage.setSkuId(0L);
        skuImage.setImgName("");
        skuImage.setImgUrl("");
        skuImage.setSpuImgId(0L);
        skuImage.setIsDefault("");
        skuImage.setCreateTime(new Date());
        skuImage.setUpdateTime(new Date());
        skuImage.setIsDeleted(0);

        String jsonString = JSON.toJSONString(skuImage);
        System.out.println(jsonString);
    }

    @Test
    public void testRedis() {
        redisTemplate.opsForValue().set("a", UUID.randomUUID().toString());
        System.out.println("保存完成...");

        String a = redisTemplate.opsForValue().get("a");
        System.out.println("读到：" + a);
    }
}
