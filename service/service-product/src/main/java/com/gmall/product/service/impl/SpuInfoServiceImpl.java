package com.gmall.product.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gmall.product.entity.SpuInfo;
import com.gmall.product.service.SpuInfoService;
import com.gmall.product.mapper.SpuInfoMapper;
import org.springframework.stereotype.Service;

/**
 * @author Administrator
 * @description 针对表【spu_info(商品表)】的数据库操作Service实现
 * @createDate 2023-05-24 18:29:57
 */
@Service
public class SpuInfoServiceImpl extends ServiceImpl<SpuInfoMapper, SpuInfo>
        implements SpuInfoService {

    @Override
    public Page<SpuInfo> getSpuInfo(Page<SpuInfo> spuInfoPage, Long category3Id) {

//        return this.page(spuInfoPage, new LambdaQueryWrapper<SpuInfo>().eq(SpuInfo::getCategory3Id, category3Id));

//        Page<SpuInfo> page = this.lambdaQuery().eq(SpuInfo::getCategory3Id, category3Id).page(spuInfoPage);
//        return this.page(page); //调用了两次page方法 所以查了两次 第二次没有带条件查询
        return this.lambdaQuery().eq(SpuInfo::getCategory3Id, category3Id).page(spuInfoPage);
    }
}




