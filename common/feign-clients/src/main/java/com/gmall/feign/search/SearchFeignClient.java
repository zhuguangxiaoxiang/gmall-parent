package com.gmall.feign.search;

import com.gmall.common.result.Result;
import com.gmall.search.Goods;
import com.gmall.search.vo.SearchParamVo;
import com.gmall.search.vo.SearchRespVo;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

/**
 * @Auther: Administrator
 * @Description
 * @Date: 2023/6/8
 */
@RequestMapping("/api/inner/rpc/search")
@FeignClient("service-search")
public interface SearchFeignClient {

    /**
     * 检索商品
     * @param searchParamVo
     * @return
     */
    @PostMapping("/searchgoods")
    Result<SearchRespVo> search(@RequestBody SearchParamVo searchParamVo);




    /**
     * 商品上架
     * @param goods
     * @return
     */
    @PostMapping("/up/goods")
    Result up(@RequestBody Goods goods);



    /**
     * 下架
     * @param skuId
     * @return
     */
    @GetMapping("/down/goods/{skuId}")
    Result down(@PathVariable("skuId") Long skuId);
}
