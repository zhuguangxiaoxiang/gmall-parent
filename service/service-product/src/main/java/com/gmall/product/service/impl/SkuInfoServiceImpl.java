package com.gmall.product.service.impl;

import com.gmall.product.vo.CategoryTreeVo;
import com.gmall.search.SearchAttr;
import com.google.common.collect.Lists;

import java.util.ArrayList;
import java.util.Date;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gmall.common.constant.RedisConst;
import com.gmall.feign.search.SearchFeignClient;
import com.gmall.product.entity.*;
import com.gmall.product.service.*;
import com.gmall.product.mapper.SkuInfoMapper;
import com.gmall.product.vo.SkuSaveInfoVo;
import com.gmall.search.Goods;
import lombok.extern.slf4j.Slf4j;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @author Administrator
 * @description 针对表【sku_info(库存单元表)】的数据库操作Service实现
 * @createDate 2023-05-24 18:29:57
 */
@Slf4j
@Service
public class SkuInfoServiceImpl extends ServiceImpl<SkuInfoMapper, SkuInfo>
        implements SkuInfoService {

    @Autowired
    SkuImageService skuImageService;

    @Autowired
    SkuAttrValueService skuAttrValueService;

    @Autowired
    SkuSaleAttrValueService skuSaleAttrValueService;

    @Autowired
    StringRedisTemplate redisTemplate;

    @Autowired
    BaseTrademarkService baseTrademarkService;

    @Override
    public Page<SkuInfo> getSkuInfoList(Page<SkuInfo> skuInfoPage) {
        return this.page(skuInfoPage);
    }

    @Transactional
    @Override
    public void saveSkuInfo(SkuSaveInfoVo skuSaveInfoVo) {
        log.info("sku保存：{}", skuSaveInfoVo);
        //1、数据存到sku_info
        SkuInfo skuInfo = new SkuInfo();
        BeanUtils.copyProperties(skuSaveInfoVo, skuInfo);
        this.save(skuInfo);

        //提取到刚保存的sku自增id
        Long skuId = skuInfo.getId();
        //2、图片信息：sku_image
        List<SkuSaveInfoVo.SkuImageListDTO> skuImageList = skuSaveInfoVo.getSkuImageList();
        List<SkuImage> skuImages = skuImageList.stream()
                .map(skuImageListDTO -> {
                    SkuImage skuImage = new SkuImage();
                    BeanUtils.copyProperties(skuImageListDTO, skuImage);
                    //回填sku_id
                    skuImage.setSkuId(skuId);
                    return skuImage;
                }).collect(Collectors.toList());
        skuImageService.saveBatch(skuImages);

        //3、平台属性sku_attr_value
        List<SkuSaveInfoVo.SkuAttrValueListDTO> skuAttrValueList = skuSaveInfoVo.getSkuAttrValueList();
        List<SkuAttrValue> skuAttrValues = skuAttrValueList.stream().map(skuAttrValueListDTO -> {
            SkuAttrValue skuAttrValue = new SkuAttrValue();
            BeanUtils.copyProperties(skuAttrValueListDTO, skuAttrValue);
            skuAttrValue.setSkuId(skuId);
            return skuAttrValue;
        }).collect(Collectors.toList());
        skuAttrValueService.saveBatch(skuAttrValues);

        //4、销售属性sku_sale_attr_value
        List<SkuSaveInfoVo.SkuSaleAttrValueListDTO> skuSaleAttrValueList = skuSaveInfoVo.getSkuSaleAttrValueList();
        List<SkuSaleAttrValue> skuSaleAttrValues = skuSaleAttrValueList.stream().map(skuSaleAttrValueListDTO -> {
            SkuSaleAttrValue skuSaleAttrValue = new SkuSaleAttrValue();
            skuSaleAttrValue.setSpuId(skuInfo.getSpuId());
            skuSaleAttrValue.setSaleAttrValueId(skuSaleAttrValueListDTO.getSaleAttrValueId());
            skuSaleAttrValue.setSkuId(skuId);
            return skuSaleAttrValue;
        }).collect(Collectors.toList());
        skuSaleAttrValueService.saveBatch(skuSaleAttrValues);

        //同步bitmap
        redisTemplate.opsForValue().setBit(RedisConst.SKUID_BIT_MAP, skuId, true);
    }

    @Autowired
    SearchFeignClient searchFeignClient;

    @Autowired
    BaseCategory1Service baseCategory1Service;


    @Override
    public void onSale(Long skuId) {
//        LambdaUpdateWrapper<SkuInfo> lambdaUpdateWrapper = new LambdaUpdateWrapper<>();
//        lambdaUpdateWrapper.eq(SkuInfo::getId, skuId).set(SkuInfo::getIsSale, 1);
//        this.update(lambdaUpdateWrapper);
//        baseMapper.updateIsOnSale(skuId);
        boolean update = lambdaUpdate()
                .eq(SkuInfo::getId, skuId)
                .set(SkuInfo::getIsSale, 1).update();
        if (update) {
            Goods goods = pepareGoods(skuId);
            searchFeignClient.up(goods);
            log.info("商品【{}】上架完成", skuId);
        }

    }

    @NotNull
    private Goods pepareGoods(Long skuId) {
        //保存到es中
        SkuInfo skuInfo = this.getById(skuId);
        Goods goods = new Goods();
        goods.setId(skuInfo.getId());
        goods.setDefaultImg(skuInfo.getSkuDefaultImg());
        goods.setTitle(skuInfo.getSkuName());
        goods.setPrice(skuInfo.getPrice().doubleValue());
        goods.setCreateTime(new Date());
        //查询品牌
        BaseTrademark baseTrademark = baseTrademarkService.getById(skuInfo.getTmId());
        goods.setTmId(skuInfo.getTmId());
        goods.setTmName(baseTrademark.getTmName());
        goods.setTmLogoUrl(baseTrademark.getLogoUrl());
        //三级分类信息
        CategoryTreeVo tree = baseCategory1Service.getCategoryTreeWithC3Id(skuInfo.getCategory3Id());
        goods.setCategory1Id(tree.getCategoryId());
        goods.setCategory1Name(tree.getCategoryName());

        CategoryTreeVo child = tree.getCategoryChild().get(0);
        goods.setCategory2Id(child.getCategoryId());
        goods.setCategory2Name(child.getCategoryName());

        CategoryTreeVo child2 = child.getCategoryChild().get(0);
        goods.setCategory3Id(child2.getCategoryId());
        goods.setCategory3Name(child2.getCategoryName());

        //热度
        goods.setHotScore(0L);

        //所有的平台属性
        List<SearchAttr> attrs = skuAttrValueService.getSkuAttrsAndValues(skuId);
        goods.setAttrs(attrs);
        return goods;
    }

    @Override
    public void cancelSale(Long skuId) {
//        LambdaUpdateWrapper<SkuInfo> lambdaUpdateWrapper = new LambdaUpdateWrapper<>();
//        lambdaUpdateWrapper.eq(SkuInfo::getId, skuId).set(SkuInfo::getIsSale, 0);
//        this.update(lambdaUpdateWrapper);
//        baseMapper.updateCancelSale(skuId);

        boolean update = lambdaUpdate()
                .eq(SkuInfo::getId, skuId)
                .set(SkuInfo::getIsSale, 0).update();

        //2、远程下架
        if (update) {
            searchFeignClient.down(skuId);
            //上下架的细节：缓存、bitmap都要同步
            log.info("商品【{}】下架完成", skuId);
        }
    }

}




