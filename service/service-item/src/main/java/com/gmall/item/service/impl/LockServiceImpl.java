package com.gmall.item.service.impl;

import com.gmall.item.service.LockService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.script.DefaultRedisScript;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

/**
 * @Auther: Administrator
 * @Description
 * @Date: 2023/5/31
 */
@Service
public class LockServiceImpl implements LockService {

    @Autowired
    StringRedisTemplate redisTemplate;

    /**
     * 阻塞式加锁：
     * 1、如果获取锁失败就一直等待锁，直到成功
     *
     * @return
     */
    @Override
    public String lock() throws InterruptedException {
        //加锁失败不能跳出方法，继续while循环
        String uuid = UUID.randomUUID().toString();
        Boolean absent = redisTemplate.opsForValue().setIfAbsent("lock", uuid, 30, TimeUnit.SECONDS);
        while (!absent) {
            //加锁成功以后。
            TimeUnit.MILLISECONDS.sleep(10);
        }

        //走到这里说明加锁成功
//        redisTemplate.expire("lock", 10, TimeUnit.MINUTES);
        return uuid;
    }

    @Override
    public void unlock(String uuid) {
        //得到锁值，这个值有可能和我们加锁时用的值不一样（锁过期redis自动删除，别人占上就是别的值）
//        String lock = redisTemplate.opsForValue().get("lock");
//        if (uuid.equals(lock)) {
//            //2、锁没有发生变化再删除
//            redisTemplate.delete("lock");
//            //有可能发生获取锁值的时候确实没过期，但是等到发送del的命令的时候，锁过期了，直接删除锁导致删除了别人的锁
//
//            //del lock if dsaasfasfsa
//            //lua脚本
//        }
        //删锁：获取值 + 删除锁 = 原子操作
        String script = "if redis.call(\"get\",KEYS[1]) == ARGV[1]\n" +
                "then\n" +
                "    return redis.call(\"del\",KEYS[1])\n" +
                "else\n" +
                "    return 0\n" +
                "end";
        //删除成功：
        //1、返回0：删锁失败，有可能是别人的锁
        //2、返回1：删锁成功

        /**
         * if redis.call("get", KEYS[1]) == ARGV[1] then
         *
         *
         * return redis.call("del", KEYS[1])
         * else
         *     return 0
         * end
         *
         * 1、lua脚本保证原子性，但保证事务吗？
         * 2、lua脚本不要写超长，而且还加各种修改，会导致事务问题
         * 3、开启redis事务机制
         */
        Long lock = redisTemplate.execute(
                new DefaultRedisScript<>(script, Long.class),
                Arrays.asList("lock"), uuid);
        System.out.println("删锁结果：" + lock);
    }
}
