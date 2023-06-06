package com.gmall.web.controller;

import com.gmall.common.result.Result;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Auther: Administrator
 * @Description
 * @Date: 2023/6/6
 */
@RestController
public class HelloTestController {
    @GetMapping("/div")
    public Result div(@RequestParam("num") Long num) {
        Long i = 10 / num;
        return Result.ok(i);
    }

//    /**
//     * 只能处理这个类的所有异常
//     *
//     * @return
//     */
//    @ExceptionHandler({Exception.class})
//    public Result handleException(Exception e) {
//        Result<Object> fail = Result.fail();
//        fail.setMessage(e.getMessage());
//        return fail;
//    }
}
