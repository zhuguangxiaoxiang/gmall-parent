package com.gmall.item.mybatis;

import com.gmall.item.mybatis.dao.PersonDao;
import com.gmall.item.sql.MySqlSession;

/**
 * @Auther: Administrator
 * @Description
 * @Date: 2023/6/4
 */
public class MyTest {
    public static void main(String[] args) {
        MySqlSession sqlSession = new MySqlSession();

        //1、得到代理对象
        PersonDao mapper = sqlSession.getMapper(PersonDao.class);
//        System.out.println(mapper);

        mapper.getAllPersonCount();
        System.out.println("========================");
        mapper.insertPerson(8,"aaa@qq.com");
    }
}
