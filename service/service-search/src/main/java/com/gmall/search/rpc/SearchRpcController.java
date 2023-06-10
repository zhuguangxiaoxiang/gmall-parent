package com.gmall.search.rpc;

import com.gmall.common.result.Result;
import com.gmall.search.Goods;
import com.gmall.search.vo.SearchParamVo;
import com.gmall.search.vo.SearchRespVo;
import com.gmall.search.service.SearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @Auther: Administrator
 * @Description
 * @Date: 2023/6/8
 */
@RequestMapping("/api/inner/rpc/search")
@RestController
public class SearchRpcController {

    @Autowired
    SearchService searchService;

    /**
     * 增加热度分
     * @param skuId
     * @param score
     * @return
     */
    @GetMapping("/hotscore/{skuId}/{score}")
    public Result updateHotScore(@PathVariable("skuId") Long skuId,
                                 @PathVariable("score") Long score) {
        searchService.updateHotScore(skuId, score);
        return Result.ok();
    }


    /**
     * 下架
     *
     * @param skuId
     * @return
     */
    @GetMapping("/down/goods/{skuId}")
    public Result down(@PathVariable("skuId") Long skuId) {
        searchService.down(skuId);
        return Result.ok();
    }

    /**
     * 商品上架
     *
     * @param goods
     * @return
     */
    @PostMapping("/up/goods")
    public Result up(@RequestBody Goods goods) {
        searchService.up(goods);
        return Result.ok();
    }

    /**
     * 检索商品
     *
     * @param searchParamVo
     * @return
     */
    @PostMapping("/searchgoods")
    public Result<SearchRespVo> search(@RequestBody SearchParamVo searchParamVo) {
        //检索
        SearchRespVo resp = searchService.search(searchParamVo);
        return Result.ok(resp);
    }
}
