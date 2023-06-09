package com.gmall.search.service.impl;

import com.gmall.search.Goods;
import com.gmall.search.repo.GoodsRepository;
import com.gmall.search.vo.SearchParamVo;
import com.gmall.search.vo.searchRespVo;
import com.gmall.search.service.SearchService;
import org.apache.lucene.search.join.ScoreMode;
import org.elasticsearch.index.query.*;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.elasticsearch.core.ElasticsearchRestTemplate;
import org.springframework.data.elasticsearch.core.SearchHits;
import org.springframework.data.elasticsearch.core.mapping.IndexCoordinates;
import org.springframework.data.elasticsearch.core.query.NativeSearchQuery;
import org.springframework.data.elasticsearch.core.query.Query;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

/**
 * @Auther: Administrator
 * @Description
 * @Date: 2023/6/8
 */
@Service
public class SearchServiceImpl implements SearchService {

    @Autowired
    GoodsRepository goodsRepository;

    @Autowired
    ElasticsearchRestTemplate elasticsearchRestTemplate;

    @Override
    public searchRespVo search(SearchParamVo searchParamVo) {
        //1、根据前端传递的请求参数，构建检索使用的query条件
        Query query = buildQuery(searchParamVo);
        //TODO 检索
        SearchHits<Goods> result = elasticsearchRestTemplate.search(query, Goods.class, IndexCoordinates.of("goods"));
        return null;
    }

    @NotNull
    private static Query buildQuery(SearchParamVo searchParamVo) {

        //=========================查询开始==============================================
        //1、查询条件
        BoolQueryBuilder boolQuery = QueryBuilders.boolQuery();
        //构建bool里面的查询条件
        //1.1)、一级分类
        if (Objects.nonNull(searchParamVo.getCategory1Id())) {
            TermQueryBuilder term = QueryBuilders.termQuery("category1Id", searchParamVo.getCategory1Id());
            boolQuery.must(term);
        }
        //1.2)、二级分类
        if (Objects.nonNull(searchParamVo.getCategory2Id())) {
            TermQueryBuilder term = QueryBuilders.termQuery("category2Id", searchParamVo.getCategory2Id());
            boolQuery.must(term);
        }
        //1.3)、三级分类
        if (Objects.nonNull(searchParamVo.getCategory3Id())) {
            TermQueryBuilder term = QueryBuilders.termQuery("category3Id", searchParamVo.getCategory3Id());
            boolQuery.must(term);
        }

        //1.4)、关键字查询
        if (!StringUtils.isEmpty(searchParamVo.getKeyword())) {
            MatchQueryBuilder match = QueryBuilders.matchQuery("title", searchParamVo.getKeyword());
            boolQuery.must(match);
        }
        //1.5)、品牌查询
        if (!StringUtils.isEmpty(searchParamVo.getTrademark())) {
            String[] split = searchParamVo.getTrademark().split(":");
            TermQueryBuilder term = QueryBuilders.termQuery("tmId", split[0]);
            boolQuery.must(term);
        }

        //1.6)、属性查询
        if (searchParamVo.getProps() != null && searchParamVo.getProps().length > 0) {
            Arrays.stream(searchParamVo.getProps())
                    .forEach(item -> {
                        //&props=4:128G:机身内存&props=3:12GB:运行内存
                        String[] split = item.split(":");
                        BoolQueryBuilder boolQueryBuilder = QueryBuilders.boolQuery();
                        //按照属性ID
                        boolQueryBuilder.must(QueryBuilders.termQuery("attrs.attrId", split[0]));
                        //属性值条件
                        boolQueryBuilder.must(QueryBuilders.termQuery("attrs.attrValue", split[1]));
                        NestedQueryBuilder nested = QueryBuilders.nestedQuery("attrs", boolQueryBuilder, ScoreMode.None);
                        boolQuery.must(nested);
                    });
        }

        //=========================查询结束==============================================

        //创建一个原生query
        Query query = new NativeSearchQuery(boolQuery);

        //=========================排序开始=============================================
        if (!StringUtils.isEmpty(searchParamVo.getOrder())) {
            //1/2：asc/desc  1:asc
            Sort sort = null;
            String[] split = searchParamVo.getOrder().split(":");
            Sort.Direction direction = split[1].equals("asc") ? Sort.Direction.ASC : Sort.Direction.DESC;
            switch (split[0]) {
                case "1":
                    sort = Sort.by(direction, "hotScore");
                    break;
                case "2":
                    sort = Sort.by(direction, "price");
                    break;
                default:
                    Sort.by(Sort.Direction.DESC, "hotScore");
            }
            query.addSort(sort);
        }
        //=========================排序结束=============================================

        //=========================分页开始=============================================
        //页码是从0开始
        Pageable pageable = PageRequest.of(searchParamVo.getPageNo() - 1, 10);
        query.setPageable(pageable);

        //=========================分页结束=============================================

        return query;
    }

    @Override
    public void up(Goods goods) {
        goodsRepository.save(goods);
    }

    @Override
    public void down(Long skuId) {
        goodsRepository.deleteById(skuId);
    }
}
