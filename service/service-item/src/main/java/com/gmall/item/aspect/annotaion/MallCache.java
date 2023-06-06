package com.gmall.item.aspect.annotaion;

import java.lang.annotation.*;
import java.util.concurrent.TimeUnit;

/**
 * @Auther: Administrator
 * @Description
 * @Date: 2023/6/5
 */
@Target({ElementType.TYPE, ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Inherited
@Documented
public @interface MallCache {

    /**
     * 指定缓存存的key.支持编写一个动态表达式
     * 1、#{} 内部的东西会被动态计算
     * 2、#变量名
     *      现在支持：#args  取出所有方法参数
     * @return
     */
    String cacheKey() default "";

    /**
     * 制定位图的名字；位图的数据都在redis中。名字很重要。要用这个名找到位图
     * 如果不写位图名，默认就不用位图
     * @return
     */
    String bitMapName() default "";

    /**
     * 位图中需要判定的值。支持表达式
     * @return
     */
    String bitMapKey() default "";

    /**
     * 锁用的键
     * @return
     */
    String lockKey() default "";

    /**
     * 数据的过期时间。
     * @return
     */
    long ttl() default 1800L;

    /**
     * 默认的时间单位
     * @return
     */
    TimeUnit unit() default TimeUnit.SECONDS;
}
