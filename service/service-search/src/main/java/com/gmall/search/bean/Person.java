package com.gmall.search.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.Id;
import org.springframework.data.elasticsearch.annotations.Document;
import org.springframework.data.elasticsearch.annotations.Field;
import org.springframework.data.elasticsearch.annotations.FieldType;

/**
 * @Auther: Administrator
 * @Description
 * @Date: 2023/6/7
 */
@Document(indexName = "person") //这是一个文档
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Person {

    @Id //主键
    private Long id;
    @Field(value = "name", type = FieldType.Text) //文本字段能全文检索
    private String name;

    @Field(value = "age", type = FieldType.Integer)
    private Integer age;
}