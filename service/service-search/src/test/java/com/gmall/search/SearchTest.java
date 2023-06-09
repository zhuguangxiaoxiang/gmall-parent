package com.gmall.search;

import com.gmall.search.service.SearchService;
import com.gmall.search.vo.SearchParamVo;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

/**
 * @Auther: Administrator
 * @Description
 * @Date: 2023/6/9
 */
@SpringBootTest
public class SearchTest {

    @Autowired
    SearchService searchService;

    @Test
    void testSearch() {
        SearchParamVo searchParamVo = new SearchParamVo();
        searchParamVo.setCategory3Id(61L);
        searchParamVo.setKeyword("华为");
        searchParamVo.setTrademark("2:华为");
        searchParamVo.setProps(new String[]{"4:256GB:机身存储","3:8GB:运行内存"});
        searchParamVo.setOrder("2:desc");
        searchParamVo.setPageNo(1);


        //?category3Id=61&category1Id=2&trademark=3:华为&props=4:128G:机身存储&props=3:12GB:运行内存&order=1:desc&pageNo=1?keyword=华为
        //#分类条件、品牌条件、属性条件【多个】、排序、页码

        searchService.search(searchParamVo);
    }
}
