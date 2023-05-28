package com.gmall.product.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gmall.product.entity.BaseTrademark;
import com.gmall.product.service.BaseTrademarkService;
import com.gmall.product.mapper.BaseTrademarkMapper;
import com.gmall.product.vo.BaseTrademarkVo;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author Administrator
 * @description 针对表【base_trademark(品牌表)】的数据库操作Service实现
 * @createDate 2023-05-24 18:29:57
 */
@Service
public class BaseTrademarkServiceImpl extends ServiceImpl<BaseTrademarkMapper, BaseTrademark>
        implements BaseTrademarkService {

    @Override
    public Page<BaseTrademark> getTrademarkPage(Page<BaseTrademark> baseTrademarkPage) {
        LambdaQueryWrapper<BaseTrademark> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.orderByAsc(BaseTrademark::getId);
        return this.page(baseTrademarkPage, lambdaQueryWrapper);
    }

    @Override
    public List<BaseTrademark> getTrademarkList() {
        return this.list();
    }

    @Override
    public BaseTrademarkVo getTrademarkById(Long id) {
        BaseTrademark baseTrademark = baseMapper.selectById(id);
        BaseTrademarkVo baseTrademarkVo = new BaseTrademarkVo();
        BeanUtils.copyProperties(baseTrademark,baseTrademarkVo);
        return baseTrademarkVo;
    }
}




