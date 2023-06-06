package com.gmall.common.retryer;

import feign.RetryableException;
import feign.Retryer;
import lombok.extern.slf4j.Slf4j;

/**
 * @Auther: Administrator
 * @Description
 * @Date: 2023/6/7
 */
@Slf4j
public class Retryer3 implements Retryer {
    int count = 3;
    int num = 1;

    /**
     * 远程超时feign会自动调用这个方法
     * 1、Propagate：传播错误
     * 2、重试器的方法只要不抛出错误就会继续重试一次远程调用
     * 继续还是传播
     *
     * @param e
     */
    @Override
    public void continueOrPropagate(RetryableException e) {
        //0 >= 3
        //1 >= 3
        //2 >= 3
        //3 >= 3
        if (num <= count) {
            log.info("正在重试第{}次", num);
            num++;
        } else {
            throw e;
        }
    }

    @Override
    public Retryer clone() {
        return new Retryer3();
    }
}
