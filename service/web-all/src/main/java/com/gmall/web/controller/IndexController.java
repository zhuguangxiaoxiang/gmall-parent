package com.gmall.web.controller;

import com.gmall.common.result.Result;
import com.gmall.product.vo.CategoryTreeVo;
import com.gmall.feign.product.CategoryFeignClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

/**
 * @Auther: Administrator
 * @Date: 2023/5/29
 */
@Controller
public class IndexController {

    @Autowired
    CategoryFeignClient categoryFeignClient;

    @GetMapping("/")
    public String index(Model model) {
        // 远程调用 service-product 获取系统所有的三级分类
        Result<List<CategoryTreeVo>> categoryList = categoryFeignClient.getCategoryTree();
        List<CategoryTreeVo> data = categoryList.getData();
        model.addAttribute("list", data);
        return "index/index";
    }

    class CategoryVo { //嵌套的无限极树形结构

        //分类ID
        private Long categoryId;

        //分类名
        private String categoryName;

        //子分类
        private List<CategoryVo> categoryChild;
    }
}
