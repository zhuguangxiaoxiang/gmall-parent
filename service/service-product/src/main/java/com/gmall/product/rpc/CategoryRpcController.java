package com.gmall.product.rpc;

import com.gmall.common.result.Result;
import com.gmall.product.service.BaseCategory1Service;
import com.gmall.product.vo.CategoryTreeVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @Auther: Administrator
 * @Date: 2023/5/29
 */
@RequestMapping("/api/inner/rpc/product")
@RestController
public class CategoryRpcController {

    @Autowired
    BaseCategory1Service baseCategoryService;

    /**
     * 获取全部数据并组织成树形结构
     * @return
     */
    @GetMapping("/category/tree")
    public Result getCategoryTree() {
        List<CategoryTreeVo> categoryTreeVoList = baseCategoryService.getCategoryTree();
        return Result.ok(categoryTreeVoList);
    }

    /**
     * 根据三级分类ID，得到整个分类的完整路径
     * @param c3Id
     * @return
     */
    @GetMapping("/category/view/{c3Id}")
    public Result<CategoryTreeVo> getCategoryTreeWithC3Id(@PathVariable("c3Id") Long c3Id) {
        CategoryTreeVo categoryTreeVo = baseCategoryService.getCategoryTreeWithC3Id(c3Id);
        return Result.ok(categoryTreeVo);
    }

}
