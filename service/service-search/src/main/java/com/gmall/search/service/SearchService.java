package com.gmall.search.service;

import com.gmall.search.Goods;
import com.gmall.search.vo.SearchParamVo;
import com.gmall.search.vo.SearchRespVo;

/**
 * @Auther: Administrator
 * @Description
 * @Date: 2023/6/8
 */
public interface SearchService {
    /**
     * 检索
     * @param searchParamVo
     * @return
     */
    SearchRespVo search(SearchParamVo searchParamVo);

    /**
     * 保存到es
     * @param goods
     */
    void up(Goods goods);

    /**
     * 从es里删除
     * @param skuId
     */
    void down(Long skuId);

    /**
     * 修改热度分
     * @param skuId
     * @param score
     */
    void updateHotScore(Long skuId, Long score);
}
