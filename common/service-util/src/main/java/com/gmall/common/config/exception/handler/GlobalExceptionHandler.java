package com.gmall.common.config.exception.handler;

import com.gmall.common.execption.GmallException;
import com.gmall.common.result.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * @Auther: Administrator
 * @Description
 * @Date: 2023/6/6
 */
//controller的异常切面
//@ResponseBody
//@ControllerAdvice //aop：Advice：通知
@Slf4j
@RestControllerAdvice
public class GlobalExceptionHandler {


    /**
     * 和业务有关的异常；要用 GmallException
     *
     * @param e
     * @return
     */

    @ExceptionHandler(GmallException.class)
    public Result handleGmallException(GmallException e) {
        Result<Object> fail = Result.fail();
        fail.setCode(e.getCode());
        fail.setMessage(e.getMessage());
        return fail;
    }


    /**
     * 处理所有controller出现的其他异常
     *
     * @param e
     * @return
     */
    @ExceptionHandler(Exception.class)
    public Result handleException(Exception e) {
        log.error("系统异常：{}",e);
        Result<Object> fail = Result.fail();
        fail.setMessage(e.getMessage());
        return fail;
    }
}
