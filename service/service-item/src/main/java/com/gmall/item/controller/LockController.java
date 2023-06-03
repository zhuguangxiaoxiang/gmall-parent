package com.gmall.item.controller;

import com.gmall.common.result.Result;
import com.gmall.item.service.LockService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.concurrent.CountDownLatch;
import java.util.concurrent.locks.ReentrantLock;

/**
 * @Auther: Administrator
 * @Description
 * @Date: 2023/5/31
 */
@Slf4j
@RestController
public class LockController {

    @Autowired
    StringRedisTemplate redisTemplate;

    @Value("${server.port}")
    String port;

    int i = 0; //有风险

    @Autowired
    LockService lockService;

    CountDownLatch latch = new CountDownLatch(10000);

    ReentrantLock lock = new ReentrantLock();

    /**
     * 1)、并发情况操作共享数据会产生安全问题。
     * 2)、多线程操作共享数据会产生线程安全问题
     * 发5000请求测试
     * 1、无锁、单实例情况： 预期：5000 实际：141
     * 2、本地锁、单实例情况： 预期：5000 实际：5000
     * 3、本地锁、集群情况：预期10000 实际4695
     * 4、分布式锁、集群情况：
     * 效果：
     * 1)、分布式下如果保证某个业务必须在同一时刻只有一个人在执行就得用分布式锁
     * 2)、分布式锁在分布式情况下能锁住无数人
     * 3）、锁越大，性能越差。
     *
     * @return
     */

    @GetMapping("/incr")
    public Result incrWithDistLock() throws InterruptedException {
        //分布式锁：利用setnx命令，让redis在没有这个key的时候插入这个key,有就无操作

            //如果不存在则set的一个值
            String uuid = lockService.lock();//自旋锁
            String num = redisTemplate.opsForValue().get("num");
            //2、对这个数字进行加1
            num = Integer.parseInt(num) + 1 + "";
            //3、加完以后修改给远程
            redisTemplate.opsForValue().set("num", num);

            lockService.unlock(uuid);


        return Result.ok();//解锁
    }


    //    @GetMapping("/incr")
    public Result incrWithLocalLock() {
        log.info("端口号为：{}", port);
//        i++;
        //1、读取i值
        //2、对i+1
        //3、重新复制i
//        latch.countDown(); //统计请求数量
        //1、从远程获取一个数字
        lock.lock();
        String num = redisTemplate.opsForValue().get("num");

        //2、对这个数字进行加1
        num = Integer.parseInt(num) + 1 + "";

        //3、加完以后修改给远程
        redisTemplate.opsForValue().set("num", num);
        lock.unlock();

        return Result.ok();
    }

    @GetMapping("/result")
    public Result lastResult() throws InterruptedException {

        latch.await();
        return Result.ok(i);
    }
}
