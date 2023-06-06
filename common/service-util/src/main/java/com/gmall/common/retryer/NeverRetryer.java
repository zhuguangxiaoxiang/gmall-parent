package com.gmall.common.retryer;

import feign.RetryableException;
import feign.Retryer;

/**
 * @Auther: Administrator
 * @Description
 * @Date: 2023/6/7
 *
 * 幂等性：
 * 一个请求发一次和2^N  多次得到的结果都是一样的
 * 1)、查询：幂等的
 * 2)、修改：
 *          update sku_info set price=888 where id = 1;    幂等的
 *          update sku_info set price+=888 where id = 1;    非幂等的
 * 3)、删除：
 *          delete from sku_info where id=20
 * 4)、新增：
 *          insert into sku_image(aa,bb) values (1,1);      非幂等
 */
public class NeverRetryer implements Retryer {
    @Override
    public void continueOrPropagate(RetryableException e) {
        throw e;
    }

    @Override
    public Retryer clone() {
        return new NeverRetryer();
    }
}
