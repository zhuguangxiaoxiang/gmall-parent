package com.gmall.search;

import com.gmall.search.bean.Person;
import com.gmall.search.repo.PersonRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Arrays;
import java.util.List;

/**
 * @Auther: Administrator
 * @Description
 * @Date: 2023/6/7
 */
@SpringBootTest
public class EsCrudTest {
    @Autowired
    PersonRepository personRepository;

    @Test
    void testQuery() {
        List<Person> all = personRepository.findAllByAgeGreaterThanEqual(19);
        all.forEach(System.out::println);
    }

    @Test
    void testCrud() {
        List<Person> personList = Arrays.asList(
                new Person(1L, "张三", 18),
                new Person(2L, "李四", 19),
                new Person(3L, "王五", 20),
                new Person(4L, "赵六", 21)
        );
        personRepository.saveAll(personList);
        System.out.println("保存成功");


        Iterable<Person> all = personRepository.findAll();
        all.forEach(System.out::println);
    }
}
