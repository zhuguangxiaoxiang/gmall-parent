package com.gmall.web.controller;

import com.gmall.feign.search.SearchFeignClient;
import com.gmall.search.vo.SearchParamVo;
import com.gmall.search.vo.SearchRespVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @Auther: Administrator
 * @Description
 * @Date: 2023/6/7
 */
@Controller
public class SearchController {

    @Autowired
    SearchFeignClient searchFeignClient;

    @GetMapping("/list.html")
    public String search(
            SearchParamVo param,
            Model model) {

        //远程调用检索服务

        SearchRespVo searchData = searchFeignClient.search(param).getData();

        //1、检索参数：   SearchParamVo
        model.addAttribute("searchParam", param);

        //2、品牌面包屑：  字符串
        model.addAttribute("trademarkParam", searchData.getTrademarkParam());

        //3、品牌属性面包屑：    集合[{attrName、attrValue、attrId}]
        model.addAttribute("propsParamList", searchData.getPropsParamList());

        //4、品牌列表：   集合[{tmId、tmName、tmLogoUrl}]
        model.addAttribute("trademarkList", searchData.getTrademarkList());

        //5、属性列表：   集合[{attrName、attrValueList(字符串集合)、attrId}]
        model.addAttribute("attrsList", searchData.getAttrsList());

        //6、URL参数
        model.addAttribute("urlParam", searchData.getUrlParam());

        //7、排序信息(type、sort)
        model.addAttribute("orderMap", searchData.getOrderMap());

        //8、商品列表    集合[{每个商品信息}]
        model.addAttribute("goodsList", searchData.getGoodsList());

        //9、页码
        model.addAttribute("pageNo", searchData.getPageNo());

        //10、总页码
        model.addAttribute("totalPages", searchData.getTotalPages());

        return "list/index"; //检索结果展示页
    }
}
