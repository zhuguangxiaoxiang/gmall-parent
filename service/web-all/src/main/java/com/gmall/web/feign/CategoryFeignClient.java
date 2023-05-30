package com.gmall.web.feign;

import com.gmall.common.result.Result;
import com.gmall.product.vo.CategoryTreeVo;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * @Auther: Administrator
 * @Date: 2023/5/29
 */
@RequestMapping("/api/inner/rpc/product")
@FeignClient("service-product")//1、说清楚调用哪个微服务
public interface CategoryFeignClient {

    //给远程的service-product发送get请求 路径是/api/inner/rpc/product/category/tree?haha=dd

    /**
     * 1、先去注册中心找到@FeignClient注解说明的service-product对应的ip地址
     * 2、给指定的ip发送方法声明的这种方式请求，而且路径声明的路径
     * 3、对方处理完成以后，给feign返回json数据
     * 4、feign把接受到的json自动转为方法指定的类型
     *
     * controller：
     *      @xxxMapping：接受各种方式哦的请求
     *      @RequestParam：接受请求参数中的值
     *      @RequestBody：接受请求体中的值
     *      @PathVariable：接受请求路径的值
     *      @RequestHeader：接受请求头的值
     * feignClient：
     *      @xxxMapping：发送各种方式哦的请求
     *      @RequestParam：方法传参中的值放到请求参数中发送出去
     *      @RequestBody：方法传参中的值放到请求体中发送出去
     *      @PathVariable：方法传参中的值放到请求体中发送出去
     *      @RequestHeader：方法传参中的值放到请求头中发送出去
     * @return
     */
    @GetMapping("/category/tree")
    Result<List<CategoryTreeVo>> getCategoryTree();
}
