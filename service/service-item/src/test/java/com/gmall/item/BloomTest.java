package com.gmall.item;

import com.google.common.hash.BloomFilter;
import com.google.common.hash.Funnel;
import com.google.common.hash.Funnels;
import org.junit.jupiter.api.Test;

import java.nio.charset.StandardCharsets;

/**
 * @Auther: Administrator
 * @Date: 2023/5/31
 */
public class BloomTest {

    @Test
    void bloomTest() {
        /**
         * Funnel<? super T> funnel, 布隆过滤器要存哪些数据
         * int expectedInsertions, 希望插入数量
         * double fpp 误判率
         */
        Funnel<CharSequence> funnel = Funnels.stringFunnel(StandardCharsets.UTF_8);
        //1、创建
        BloomFilter<CharSequence> filter = BloomFilter
                .create(funnel, 10000000, 0.000001);

        //2、给bf添加一些元素
        filter.put("http://www.baidu.com");
        filter.put("http://www.qq.com");
        filter.put("http://www.jd.com");

        //3、判定哪个网页是否操作过
        String url = "http://www.gmall.com";
        //判定可能有
        System.out.println(filter.mightContain(url));
    }
}
