package com.gmall.search.repo;

import com.gmall.search.bean.Person;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Auther: Administrator
 * @Description
 * @Date: 2023/6/7
 */
@Repository
public interface PersonRepository extends CrudRepository<Person, Long> {

    /**
     * 普通的crud用接口提供的或者自定义方法即可
     * 复杂的crud用restTemplate定义dsl进行查询
     * @param age
     * @return
     */

    List<Person> findAllByAgeGreaterThanEqual(Integer age);



}
