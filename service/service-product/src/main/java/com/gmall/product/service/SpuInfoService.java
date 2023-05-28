package com.gmall.product.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gmall.product.entity.SpuImage;
import com.gmall.product.entity.SpuInfo;
import com.baomidou.mybatisplus.extension.service.IService;
import com.gmall.product.vo.SpuSaveInfoVo;

import java.util.List;

/**
* @author Administrator
* @description 针对表【spu_info(商品表)】的数据库操作Service
* @createDate 2023-05-24 18:29:57
*/
public interface SpuInfoService extends IService<SpuInfo> {

    Page<SpuInfo> getSpuInfo(Page<SpuInfo> spuInfoPage, Long category3Id);

    void saveSpuInfo(SpuSaveInfoVo spuSaveInfoVo);

    List<SpuImage> getSpuImage(Long spuId);

}
