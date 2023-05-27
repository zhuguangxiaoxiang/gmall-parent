package com.gmall.product;

import lombok.extern.slf4j.Slf4j;
import org.junit.Test;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * @Auther: Administrator
 * @Date: 2023/5/27
 */
@Slf4j
public class StreamTest {
    @Test
    public void test() {
        log.info("主线程：{}", Thread.currentThread());
        List<Integer> list = Arrays.asList(1, 2, 3, 4, 5, 6);
        //1、把每个元素 * 2，返回 声明式编程： 命令式编程
//        Integer integer = list.stream()
////                .parallel() //并行
//                .map(item -> {
//                    log.info(Thread.currentThread() + "正在处理：{}", item);
//                    if (item == 2) {
//                        try {
//                            Thread.sleep(2000);
//                        } catch (InterruptedException e) {
//                            throw new RuntimeException(e);
//                        }
//                    }
//                    return item * 2;
//                })
//                //2、把所有能除以3的都跳出来
//                .filter(item -> item % 3 == 0)
////                .flatMap() //打散 拉平
//                .reduce((o1, o2) -> o1 + o2).get();//归并处理
        List<Integer> collect = list.stream()
                .flatMap(item -> Arrays.asList(item + 6, item + 8)
                        .stream()).collect(Collectors.toList());
        System.out.println(collect);
    }
}
