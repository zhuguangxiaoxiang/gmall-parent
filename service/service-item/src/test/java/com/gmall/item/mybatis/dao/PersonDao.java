package com.gmall.item.mybatis.dao;

import com.gmall.item.mybatis.annotation.MySQL;

/**
 * @Auther: Administrator
 * @Description
 * @Date: 2023/6/4
 */
public interface PersonDao {


    @MySQL("select count(*) from person")
    Integer getAllPersonCount();

//    @MySQL("insert into person('age','email') values(?,?)")
    @MySQL("insert into person('age','email') values({age},{email})")
    void insertPerson(Integer age,String email);
}
