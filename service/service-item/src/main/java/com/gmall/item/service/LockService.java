package com.gmall.item.service;

/**
 * @Auther: Administrator
 * @Description
 * @Date: 2023/5/31
 */
public interface LockService {
    String lock() throws InterruptedException;

    void unlock(String uuid);
}
