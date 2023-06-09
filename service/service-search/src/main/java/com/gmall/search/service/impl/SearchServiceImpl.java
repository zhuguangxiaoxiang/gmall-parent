package com.gmall.search.service.impl;

import com.gmall.search.vo.SearchRespVo.OrderMap;

import com.gmall.search.Goods;
import com.gmall.search.repo.GoodsRepository;
import com.gmall.search.vo.SearchParamVo;
import com.gmall.search.vo.SearchRespVo;
import com.gmall.search.service.SearchService;
import com.google.common.collect.Lists;
import org.apache.lucene.search.join.ScoreMode;
import org.elasticsearch.index.query.*;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.elasticsearch.core.ElasticsearchRestTemplate;
import org.springframework.data.elasticsearch.core.SearchHit;
import org.springframework.data.elasticsearch.core.SearchHits;
import org.springframework.data.elasticsearch.core.mapping.IndexCoordinates;
import org.springframework.data.elasticsearch.core.query.NativeSearchQuery;
import org.springframework.data.elasticsearch.core.query.Query;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

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

    static int pageSize = 10;

    @Override
    public SearchRespVo search(SearchParamVo searchParamVo) {
        //1、根据前端传递的请求参数，构建检索使用的query条件
        Query query = buildQuery(searchParamVo);
        //检索
        SearchHits<Goods> result = elasticsearchRestTemplate.search(query, Goods.class, IndexCoordinates.of("goods"));

        SearchRespVo searchRespVo = buildSearchResp(result, searchParamVo);
        return searchRespVo;
    }

    /**
     * 根据检索到的结果，构建前端需要返回的结果
     *
     * @param result
     * @return
     */
    private SearchRespVo buildSearchResp(SearchHits<Goods> result, SearchParamVo searchParamVo) {
        SearchRespVo respVo = new SearchRespVo();
        //1、检索参数
        respVo.setSearchParam(searchParamVo);
        //品牌面包屑
        if (!StringUtils.isEmpty(searchParamVo.getTrademark())) {
            //品牌：小米
            String[] split = searchParamVo.getTrademark().split(":");
            respVo.setTrademarkParam("品牌：" + split[1]);
        }
        //属性面包屑
        if (Objects.nonNull(searchParamVo.getProps()) && searchParamVo.getProps().length > 0) {
//            List<SearchRespVo.Props> propLists = new ArrayList<>();
//            遍历前端传递的所有props参数
//            for (String prop : searchParamVo.getProps()) {
//                String[] split = prop.split(":");
//                SearchRespVo.Props props = new SearchRespVo.Props();
//                props.setAttrName(split[2]);
//                props.setAttrValue(split[1]);
//                props.setAttrId(Long.parseLong(split[0]));
//                propLists.add(props);
//            }

            List<SearchRespVo.Props> collect = Arrays.stream(searchParamVo.getProps())
                    .map(item -> {
                        String[] split = item.split(":");
                        SearchRespVo.Props props = new SearchRespVo.Props();
                        props.setAttrName(split[2]);
                        props.setAttrValue(split[1]);
                        props.setAttrId(Long.parseLong(split[0]));
                        return props;
                    }).collect(Collectors.toList());
            respVo.setPropsParamList(collect);
        }
        //4、TODO 品牌列表；MySQL里的分组 select * from sku_info where xxx=xx and xxx=xxx group by tm_id  等于 es里的聚合
        respVo.setTrademarkList(null);
        //5、TODO 属性列表 select GROUP_CONCAT(attrValue) xxx group by attrId 等于 es里的聚合
        respVo.setAttrsList(null);
        //6、TODO url参数就是这一堆
        //list.html?category3Id=61&props=4:256GB:机身储存&props=3:8GB:运行内存
        String urlParam = buildUrlParam(searchParamVo);
        respVo.setUrlParam(urlParam);

        //7、排序信息
        OrderMap orderMap = new OrderMap();
        if (!StringUtils.isEmpty(searchParamVo.getOrder())) {
            String[] split = searchParamVo.getOrder().split(":");
            orderMap.setType(split[0]);
            orderMap.setSort(split[1]);
            respVo.setOrderMap(orderMap);
        }

        //8、商品列表
        for (SearchHit<Goods> searchHit : result.getSearchHits()) {
            Goods goods = searchHit.getContent();
        }
        List<Goods> collect = result.getSearchHits().stream()
                .map(SearchHit::getContent).collect(Collectors.toList());
        respVo.setGoodsList(collect);

        //9、页码
        respVo.setPageNo(searchParamVo.getPageNo());
        //总记录数
        long totalHits = result.getTotalHits();
        //总页码：总记录数%每页大小 == 0? 总记录数/每页大小:总记录数/每页大小 + 1
        respVo.setTotalPages(totalHits % pageSize == 0 ? totalHits / pageSize : totalHits / pageSize + 1);
        return respVo;
    }

    /**
     * 根据前段带来的参数构建原来的url
     * 格式：list.html?category3Id=61&props=4:256GB:机身储存&props=3:8GB:运行内存
     *
     * @param searchParamVo
     * @return
     */
    private String buildUrlParam(SearchParamVo searchParamVo) {
        StringBuilder builder = new StringBuilder("list.html?");
        //分类参数
        appendParam(builder, "category1Id", searchParamVo.getCategory1Id());
        appendParam(builder, "category2Id", searchParamVo.getCategory2Id());
        appendParam(builder, "category3Id", searchParamVo.getCategory3Id());

        //keyword
        if (!StringUtils.isEmpty(searchParamVo.getKeyword())) {
            builder.append("&keyword=").append(searchParamVo.getKeyword());
        }

        //品牌
        if (!StringUtils.isEmpty(searchParamVo.getTrademark())) {
            builder.append("&trademark=").append(searchParamVo.getTrademark());
        }
        //属性
        if (Objects.nonNull(searchParamVo.getProps()) && searchParamVo.getProps().length > 0) {
            Arrays.stream(searchParamVo.getProps()).forEach(item -> {
                builder.append("&props=").append(item);
            });
        }

        //排序不要

        //分页不要
//        builder.append("&pageNo").append(searchParamVo.getPageNo());
        return builder.toString();
    }


    private void appendParam(StringBuilder builder, String paramName, Long paramValue) {
        if (Objects.nonNull(paramValue)) {
            builder.append("&").append(paramName).append("=").append(paramValue);
        }
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
        if (Objects.nonNull(searchParamVo.getProps()) && searchParamVo.getProps().length > 0) {
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
        Pageable pageable = PageRequest.of(searchParamVo.getPageNo() - 1, pageSize);
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
