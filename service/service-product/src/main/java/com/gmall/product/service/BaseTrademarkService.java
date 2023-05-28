package com.gmall.product.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gmall.product.entity.BaseTrademark;
import com.baomidou.mybatisplus.extension.service.IService;
import com.gmall.product.vo.BaseTrademarkVo;

import java.util.List;

/**
* @author Administrator
* @description 针对表【base_trademark(品牌表)】的数据库操作Service
* @createDate 2023-05-24 18:29:57
*/
public interface BaseTrademarkService extends IService<BaseTrademark> {

    Page<BaseTrademark> getTrademarkPage(Page<BaseTrademark> baseTrademarkPage);

    List<BaseTrademark> getTrademarkList();

    BaseTrademarkVo getTrademarkById(Long id);
}
