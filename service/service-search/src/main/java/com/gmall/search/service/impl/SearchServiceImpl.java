package com.gmall.search.service.impl;

import com.google.common.collect.Lists;

import com.gmall.search.vo.SearchRespVo.OrderMap;

import com.gmall.search.Goods;
import com.gmall.search.repo.GoodsRepository;
import com.gmall.search.vo.SearchParamVo;
import com.gmall.search.vo.SearchRespVo;
import com.gmall.search.service.SearchService;
import org.apache.lucene.search.join.ScoreMode;
import org.elasticsearch.index.query.*;
import org.elasticsearch.search.aggregations.Aggregation;
import org.elasticsearch.search.aggregations.AggregationBuilders;
import org.elasticsearch.search.aggregations.Aggregations;
import org.elasticsearch.search.aggregations.bucket.MultiBucketsAggregation;
import org.elasticsearch.search.aggregations.bucket.nested.NestedAggregationBuilder;
import org.elasticsearch.search.aggregations.bucket.nested.ParsedNested;
import org.elasticsearch.search.aggregations.bucket.terms.ParsedLongTerms;
import org.elasticsearch.search.aggregations.bucket.terms.ParsedStringTerms;
import org.elasticsearch.search.aggregations.bucket.terms.Terms;
import org.elasticsearch.search.aggregations.bucket.terms.TermsAggregationBuilder;
import org.elasticsearch.search.fetch.subphase.highlight.HighlightBuilder;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.elasticsearch.core.ElasticsearchRestTemplate;
import org.springframework.data.elasticsearch.core.SearchHit;
import org.springframework.data.elasticsearch.core.SearchHits;
import org.springframework.data.elasticsearch.core.document.Document;
import org.springframework.data.elasticsearch.core.mapping.IndexCoordinates;
import org.springframework.data.elasticsearch.core.query.HighlightQuery;
import org.springframework.data.elasticsearch.core.query.NativeSearchQuery;
import org.springframework.data.elasticsearch.core.query.Query;
import org.springframework.data.elasticsearch.core.query.UpdateQuery;
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
        //4、品牌列表；MySQL里的分组 select * from sku_info where xxx=xx and xxx=xxx group by tm_id  等于 es里的聚合
        //ParsedLongTerms
        ParsedLongTerms tmIdAgg = result.getAggregations().get("tmIdAgg");
        List<SearchRespVo.Trademark> trademarkList = tmIdAgg.getBuckets().stream()
                .map(bucket -> {
                    SearchRespVo.Trademark trademark = new SearchRespVo.Trademark();
                    Long tmId = bucket.getKeyAsNumber().longValue();
                    trademark.setTmId(tmId);
                    //2、品牌name
                    ParsedStringTerms tmNameAgg = bucket.getAggregations().get("tmNameAgg");
                    String tmName = tmNameAgg.getBuckets().get(0).getKeyAsString();
                    trademark.setTmName(tmName);
                    ParsedStringTerms tmLogoUrlAgg = bucket.getAggregations().get("tmLogoUrlAgg");
                    String tmLogUrl = tmLogoUrlAgg.getBuckets().get(0).getKeyAsString();
                    trademark.setTmLogoUrl(tmLogUrl);
                    return trademark;
                }).collect(Collectors.toList());
        respVo.setTrademarkList(trademarkList);
        //5、属性列表 select GROUP_CONCAT(attrValue) xxx group by attrId 等于 es里的聚合 aggregations
        ParsedNested attrAgg = result.getAggregations().get("attrAgg");
        //属性ID聚合结果
        ParsedLongTerms attrIdAgg = attrAgg.getAggregations().get("attrIdAgg");
        List<SearchRespVo.Attrs> attrsList = attrIdAgg.getBuckets().stream().map(bucket -> {
            SearchRespVo.Attrs attrs = new SearchRespVo.Attrs();
            //属性ID
            long attrId = bucket.getKeyAsNumber().longValue();
            attrs.setAttrId(attrId);
            //属性名
            ParsedStringTerms attrNameAgg = bucket.getAggregations().get("attrNameAgg");
            String attrName = attrNameAgg.getBuckets().get(0).getKeyAsString();
            attrs.setAttrName(attrName);
            //属性值
            ParsedStringTerms attrValueAgg = bucket.getAggregations().get("attrValueAgg");
            List<String> attrValueList = attrValueAgg.getBuckets().stream().map(MultiBucketsAggregation.Bucket::getKeyAsString)
                    .collect(Collectors.toList());
            attrs.setAttrValueList(attrValueList);
            return attrs;
        }).collect(Collectors.toList());
        respVo.setAttrsList(attrsList);
        //6、url参数就是这一堆
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
//        for (SearchHit<Goods> searchHit : result.getSearchHits()) {
//            Goods goods = searchHit.getContent();
//        }
        List<Goods> collect = result.getSearchHits().stream()
                .map(goodsSearchHit -> {
                    Goods content = goodsSearchHit.getContent();
                    if (!StringUtils.isEmpty(searchParamVo.getKeyword())) {
                        //模糊检索带高亮提示
                        String newTitle = goodsSearchHit.getHighlightField("title").get(0);
                        content.setTitle(newTitle);
                    }
                    return content;
                })
                .collect(Collectors.toList());
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
        mustTermQuery(boolQuery, "category1Id", searchParamVo.getCategory1Id());
        //1.2)、二级分类
        mustTermQuery(boolQuery, "category2Id", searchParamVo.getCategory2Id());
        //1.3)、三级分类
        mustTermQuery(boolQuery, "category3Id", searchParamVo.getCategory3Id());

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
        NativeSearchQuery query = new NativeSearchQuery(boolQuery);

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


        //=========================高亮=============================================
        if (!StringUtils.isEmpty(searchParamVo.getKeyword())) {
            //1、构建高亮
            HighlightBuilder highlightBuilder = new HighlightBuilder()
                    .field("title")
                    .preTags("<span style='color:red'>")
                    .postTags("</span>");
            HighlightQuery highlightQuery = new HighlightQuery(highlightBuilder);
            query.setHighlightQuery(highlightQuery);
        }

        //=========================聚合分析开始===========品牌==================================
        //品牌id聚合
        TermsAggregationBuilder tmIdAgg = AggregationBuilders
                .terms("tmIdAgg").field("tmId").size(200);
        //品牌name子聚合
        TermsAggregationBuilder tmNameAgg = AggregationBuilders
                .terms("tmNameAgg").field("tmName").size(1);
        tmIdAgg.subAggregation(tmNameAgg);
        //品牌url子聚合
        TermsAggregationBuilder tmLogoUrlAgg = AggregationBuilders
                .terms("tmLogoUrlAgg").field("tmLogoUrl").size(1);
        tmIdAgg.subAggregation(tmLogoUrlAgg);

        query.addAggregation(tmIdAgg);

        //=========================聚合分析开始===========属性==================================
        NestedAggregationBuilder attrAgg = AggregationBuilders.nested("attrAgg", "attrs");
        //属性ID聚合分析
        TermsAggregationBuilder attrIdAgg = AggregationBuilders
                .terms("attrIdAgg")
                .field("attrs.attrId").size(200);

        attrAgg.subAggregation(attrIdAgg);

        //属性名聚合分析
        TermsAggregationBuilder attrNameAgg = AggregationBuilders
                .terms("attrNameAgg")
                .field("attrs.attrName").size(1);
        TermsAggregationBuilder attrValueAgg = AggregationBuilders
                .terms("attrValueAgg")
                .field("attrs.attrValue").size(100);
        attrIdAgg.subAggregation(attrNameAgg);
        attrIdAgg.subAggregation(attrValueAgg);
        query.addAggregation(attrAgg);


        //=========================聚合分析结束=============================================
        return query;
    }

    private static void mustTermQuery(BoolQueryBuilder boolQuery, String name, Long value) {
        if (Objects.nonNull(value)) {
            TermQueryBuilder term = QueryBuilders.termQuery(name, value);
            boolQuery.must(term);
        }
    }

    @Override
    public void up(Goods goods) {
        goodsRepository.save(goods);
    }

    @Override
    public void down(Long skuId) {
        goodsRepository.deleteById(skuId);
    }

    @Override
    public void updateHotScore(Long skuId, Long score) {
        Document document = Document.create();
        document.put("hotScore", score);
        //增量更新
        UpdateQuery updateQuery = UpdateQuery.builder("" + skuId)
                .withDocAsUpsert(true).withDocument(document).build();
        elasticsearchRestTemplate.update(updateQuery, IndexCoordinates.of("goods"));
    }
}
