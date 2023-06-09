package com.gmall.search;

import org.elasticsearch.index.query.BoolQueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.elasticsearch.core.ElasticsearchRestTemplate;
import org.springframework.data.elasticsearch.core.SearchHit;
import org.springframework.data.elasticsearch.core.SearchHits;
import org.springframework.data.elasticsearch.core.mapping.IndexCoordinates;
import org.springframework.data.elasticsearch.core.query.IndexQuery;
import org.springframework.data.elasticsearch.core.query.IndexQueryBuilder;
import org.springframework.data.elasticsearch.core.query.NativeSearchQuery;
import org.springframework.data.elasticsearch.core.query.Query;

import java.util.Objects;

/**
 * @Auther: Administrator
 * @Description
 * @Date: 2023/6/7
 */
@SpringBootTest
public class EsTest {

    @Autowired
    ElasticsearchRestTemplate restTemplate;


    @Test
    void testSearch() {
        //1、创建一个原生检索。代表能使用一个原生的DSL进行检索
        BoolQueryBuilder boolQuery = QueryBuilders.boolQuery();
        QueryBuilders.rangeQuery("age").gte(10L);
        boolQuery.must(QueryBuilders.rangeQuery("age").gte(10L));
        boolQuery.must(QueryBuilders.matchQuery("name", "张"));

        //==============原生检索：利用QueryBuilders创建一个检索条件=============
        Query query = new NativeSearchQuery(boolQuery);
        SearchHits<Person> hits = restTemplate.search(query, Person.class, IndexCoordinates.of("person"));
        for (SearchHit<Person> hit : hits.getSearchHits()) {
            Person person = hit.getContent();
            System.out.println(person);
        }
        System.out.println("检索结果：" + hits);
    }

    @Test
    void testDeleteIndex() {
        boolean person = restTemplate.indexOps(IndexCoordinates.of("person"))
                .delete();
        System.out.println(person);
    }

    @Test
    void testDelete() {
        String person = restTemplate.delete("1", IndexCoordinates.of("person"));
        System.out.println(person);
    }

    @Test
    void testQuery() {
        Person person = restTemplate.get("1", Person.class, IndexCoordinates.of("person"));
        System.out.println(person);
    }

    @Test
    void testPost() {
        IndexQuery query = new IndexQueryBuilder()
                .withId("3")
                .withObject(new Person(3L, "王五", 21)).build();
        restTemplate.index(query, IndexCoordinates.of("person"));
        System.out.println("保存成功");
    }

    @Test
    void createIndex() {
        boolean person = restTemplate.indexOps(IndexCoordinates.of("person"))
                .create();
        System.out.println(person);
    }

    @Test
    void test01() {
        System.out.println(restTemplate);
//        restTemplate.createIndex("hello");
//        System.out.println("创建hello索引完成");

        restTemplate.deleteIndex("hello");
        System.out.println("删除索引成功");
    }

}
