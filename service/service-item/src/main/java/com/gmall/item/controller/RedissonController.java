package com.gmall.item.controller;

import com.gmall.common.result.Result;
import lombok.extern.slf4j.Slf4j;
import org.redisson.api.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.UUID;
import java.util.concurrent.Semaphore;
import java.util.concurrent.TimeUnit;

/**
 * @Auther: Administrator
 * @Description
 * @Date: 2023/6/1
 */
@Slf4j
@RestController
public class RedissonController {

    @Autowired
    RedissonClient redissonClient;

    String x = "abc";



    /**
     * 信号量；能增能减
     * 停车场
     */
    @GetMapping("/init/park")
    public Result semaphore() {
        RSemaphore semaphore = redissonClient.getSemaphore("cshfpark");
        semaphore.trySetPermits(5);

        return Result.ok("初始化停车场完成");
    }

    @GetMapping("/car/park")
    public Result park() throws InterruptedException {
        RSemaphore semaphore = redissonClient.getSemaphore("cshfpark");
        //要一个
        semaphore.acquire(1);

        return Result.ok("停车成功");
    }

    @GetMapping("/car/go")
    public Result cargo() throws InterruptedException {
        RSemaphore semaphore = redissonClient.getSemaphore("cshfpark");
        //要一个
        semaphore.release(1);

        return Result.ok("车走了");
    }

    /**
     * 闭锁；只能减，减到0结束
     * 收集龙珠
     */
    @GetMapping("/shenlong")
    public Result shenlong() throws InterruptedException {
        RCountDownLatch qilongzhu = redissonClient.getCountDownLatch("qilongzhu");
        qilongzhu.trySetCount(7L);
        log.info("等待召唤");
        qilongzhu.await();
        return Result.ok("神龙....");
    }

    @GetMapping("/longzhu")
    public Result longzhu() {
        RCountDownLatch qilongzhu = redissonClient.getCountDownLatch("qilongzhu");
        qilongzhu.countDown();
        return Result.ok("1颗到手");
    }


    /**
     * 读写锁：改数据
     *
     * 读读：无锁
     * 写写：有锁
     * 写读：有锁，读要等待
     * 读写：有锁，写要等待
     *
     * @return
     */
    @GetMapping("/write")
    public Result write() throws InterruptedException {
        //1、获取读写锁
        RReadWriteLock readWriteLock = redissonClient.getReadWriteLock("haha-rw");

        //2、获取写锁
        RLock writeLock = readWriteLock.writeLock();

        try {
            writeLock.lock();

            log.info("业务正在进行数据修改");

            TimeUnit.SECONDS.sleep(15);

            x = UUID.randomUUID().toString();
            log.info("业务数据修改完成");
        } finally {
            try {
                writeLock.unlock();
            } catch (Exception e) {}
        }
        return Result.ok(x);
    }

    @GetMapping("/read")
    public Result read() throws InterruptedException {
        //1、获取读写锁
        RReadWriteLock readWriteLock = redissonClient.getReadWriteLock("haha-rw");

        //2、获取读锁
        RLock readLock = readWriteLock.readLock();

        //3、加读锁

        try {
            readLock.lock();
            log.info("业务正在进行读取数据中....");
            TimeUnit.SECONDS.sleep(10);
            log.info("业务远程读取数据完成....");
        } finally {
            readLock.unlock();
        }

        return Result.ok(x);
    }

    @GetMapping("/redisson/lock")
    public Result lock() {

        //1、获取一把锁
        RLock lock = redissonClient.getLock("haha-lock");

        //2、加锁
        try {
            //1、阻塞式加锁；一定要等到锁。   得到锁：锁的默认时间是30s
            lock.lock();//加解锁一定成对出现
            //2、阻塞式加锁(传了锁释放时间)；一定要等到锁。   得到锁：锁的默认时间是10s 而且锁没有续期功能
//            lock.lock(10, TimeUnit.SECONDS);

            //3、尝试加锁：试一下；true加锁成功
//            boolean tryLock = lock.tryLock(); //自动续期
            //4、尝试加锁：10s内一直尝试；true加锁成功(10s内返回true) false：10s以后一定会返回false
            log.info("准备加锁");
//            boolean tryLock = lock.tryLock(10, TimeUnit.SECONDS);
            //5、尝试加锁：10s内一直尝试；true：加锁成功锁就20秒有效
//            boolean tryLock = lock.tryLock(10, 20, TimeUnit.SECONDS);

//            if (tryLock) {
            log.info("加锁成功：业务正在执行......");
            //xxxx
            TimeUnit.SECONDS.sleep(60);
            log.info("业务执行完成");
//            } else {
//                log.info("加锁失败...");
//            }

        } catch (InterruptedException e) {
        } finally {
            try {
                //3、解锁
                lock.unlock(); //同步解锁   万一发现不是自己的锁，就不用解锁
//            lock.unlockAsync(); //异步解锁
                log.info("解锁完成...");
            } catch (Exception e) {
            }
        }


        return Result.ok();
    }


    @GetMapping("/redisson/test")
    public Result client() {
        log.info("redissonClient:{}", redissonClient);
        return Result.ok();
    }
}
