package com.gmall.search.repo;

import com.gmall.search.Goods;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

/**
 * @Auther: Administrator
 * @Description 先装好ik分词器
 * @Date: 2023/6/8
 */
@Repository
public interface GoodsRepository extends PagingAndSortingRepository<Goods, Long> {
}
