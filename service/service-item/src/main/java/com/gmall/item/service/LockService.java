package com.gmall.item.service;

/**
 * @Auther: Administrator
 * @Description
 * @Date: 2023/5/31
 */
public interface LockService {

    /**
     * 阻塞式加锁：
     * 1、如果获取锁失败就一直等待锁，直到成功
     *
     * @return
     */
    String lock() throws InterruptedException;

    void unlock(String uuid);
}
