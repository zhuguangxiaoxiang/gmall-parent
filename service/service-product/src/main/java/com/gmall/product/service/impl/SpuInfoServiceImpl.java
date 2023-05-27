package com.gmall.product.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gmall.product.entity.SpuImage;
import com.gmall.product.entity.SpuInfo;
import com.gmall.product.entity.SpuSaleAttr;
import com.gmall.product.entity.SpuSaleAttrValue;
import com.gmall.product.service.SpuImageService;
import com.gmall.product.service.SpuInfoService;
import com.gmall.product.mapper.SpuInfoMapper;
import com.gmall.product.service.SpuSaleAttrService;
import com.gmall.product.service.SpuSaleAttrValueService;
import com.gmall.product.vo.SpuSaveInfoVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * @author Administrator
 * @description 针对表【spu_info(商品表)】的数据库操作Service实现
 * @createDate 2023-05-24 18:29:57
 */
@Slf4j
@Service
public class SpuInfoServiceImpl extends ServiceImpl<SpuInfoMapper, SpuInfo>
        implements SpuInfoService {

    @Autowired
    SpuImageService spuImageService;

    @Autowired
    SpuSaleAttrService spuSaleAttrService;

    @Autowired
    SpuSaleAttrValueService spuSaleAttrValueService;


    @Override
    public Page<SpuInfo> getSpuInfo(Page<SpuInfo> spuInfoPage, Long category3Id) {

//        return this.page(spuInfoPage, new LambdaQueryWrapper<SpuInfo>().eq(SpuInfo::getCategory3Id, category3Id));

//        Page<SpuInfo> page = this.lambdaQuery().eq(SpuInfo::getCategory3Id, category3Id).page(spuInfoPage);
//        return this.page(page); //调用了两次page方法 所以查了两次 第二次没有带条件查询
        return this.lambdaQuery().eq(SpuInfo::getCategory3Id, category3Id).page(spuInfoPage);
    }

    @Transactional
    @Override
    public void saveSpuInfo(SpuSaveInfoVo spuSaveInfoVo) {
        log.info("保存spu:{}", spuSaveInfoVo);
        //存spu_info
        SpuInfo spuInfo = new SpuInfo();
//        spuInfo.setSpuName(spuSaveInfoVo.getSpuName());
//        spuInfo.setDescription(spuSaveInfoVo.getDescription());
//        spuInfo.setCategory3Id(spuSaveInfoVo.getCategory3Id());
//        spuInfo.setTmId(spuSaveInfoVo.getTmId());
        BeanUtils.copyProperties(spuSaveInfoVo, spuInfo);
        this.save(spuInfo);
        Long spuInfoId = spuInfo.getId();
        //2、存图片
//        List<SpuImage> images = new ArrayList<>();

//        for (SpuSaveInfoVo.SpuImageListDTO spuImageListDTO : spuImageList) {
//            SpuImage spuImage = new SpuImage();
//            //先复制前端的数据
//            BeanUtils.copyProperties(spuImageListDTO, spuImage);
//            //回填spuInfoId
//            spuImage.setSpuId(spuInfoId);
//            images.add(spuImage);
//        }
        //stream api
        List<SpuImage> spuImages = spuSaveInfoVo.getSpuImageList()
                .stream().map(spuImageListDTO -> {
                    SpuImage spuImage = new SpuImage();
                    //先复制前端的数据
                    BeanUtils.copyProperties(spuImageListDTO, spuImage);
                    //回填spuInfoId
                    spuImage.setSpuId(spuInfoId);
                    return spuImage;
                }).collect(Collectors.toList());
//        spuImageList.forEach(spuImageListDTO -> {
//            spuImage.setImgName(spuImageListDTO.getImgName());
//            spuImage.setImgUrl(spuImageListDTO.getImgUrl());
//            spuImage.setSpuId(spuInfoId);
//            images.add(spuImage);
//        });
        spuImageService.saveBatch(spuImages);

        //3、保存销售属性名spu_sale_attr
        List<SpuSaleAttr> spuSaleAttrs = spuSaveInfoVo.getSpuSaleAttrList()
                .stream().map(spuSaleAttrListDTO -> {
                    SpuSaleAttr spuSaleAttr = new SpuSaleAttr();
                    BeanUtils.copyProperties(spuSaleAttrListDTO, spuSaleAttr);
                    spuSaleAttr.setSpuId(spuInfoId);
                    return spuSaleAttr;
                }).collect(Collectors.toList());
        spuSaleAttrService.saveBatch(spuSaleAttrs);

        //4、存销售属性值 spu_sale_attr_value
        List<SpuSaleAttrValue> collect = spuSaveInfoVo.getSpuSaleAttrList()
                .stream().flatMap(spuSaleAttrListDTO -> {
                    //spuSaleAttrListDTO是每个销售属性，带了很多销售属性值
                    Stream<SpuSaleAttrValue> stream = spuSaleAttrListDTO.getSpuSaleAttrValueList().stream().map(value -> {
                        SpuSaleAttrValue spuSaleAttrValue = new SpuSaleAttrValue();
                        spuSaleAttrValue.setBaseSaleAttrId(value.getBaseSaleAttrId());
                        spuSaleAttrValue.setSaleAttrValueName(value.getSaleAttrValueName());
                        spuSaleAttrValue.setSaleAttrName(spuSaleAttrListDTO.getSaleAttrName());
                        spuSaleAttrValue.setSpuId(spuInfoId);
                        return spuSaleAttrValue;
                    });
                    return stream;
                }).collect(Collectors.toList());
        spuSaleAttrValueService.saveBatch(collect);
    }

    @Override
    public List<SpuImage> getSpuImage(Long spuId) {
//        return spuImageService.list(new LambdaQueryWrapper<SpuImage>().eq(SpuImage::getSpuId,spuId));
        return spuImageService.lambdaQuery().eq(SpuImage::getSpuId,spuId).list();
    }
}




