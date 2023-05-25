package com.gmall.product.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gmall.product.entity.BaseAttrInfo;
import com.gmall.product.entity.BaseAttrValue;
import com.gmall.product.service.BaseAttrInfoService;
import com.gmall.product.mapper.BaseAttrInfoMapper;
import com.gmall.product.service.BaseAttrValueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author Administrator
 * @description 针对表【base_attr_info(属性表)】的数据库操作Service实现
 * @createDate 2023-05-24 18:29:56
 */
@Service
public class BaseAttrInfoServiceImpl extends ServiceImpl<BaseAttrInfoMapper, BaseAttrInfo>
        implements BaseAttrInfoService {

    @Autowired
    BaseAttrValueService baseAttrValueService;

    @Override
    public List<BaseAttrInfo> getAttrValueAndName(Long category1Id, Long category2Id, Long category3Id) {
        List<BaseAttrInfo> baseAttrInfoList = baseMapper.getAttrValueAndName(category1Id, category2Id, category3Id);
        return baseAttrInfoList;
    }

    @Transactional
    @Override
    public void saveAttrInfo(BaseAttrInfo baseAttrInfo) {
        //修改-合并
        if (baseAttrInfo.getId() == null) {
            //base_attr_info在未保存之前id: null
            //  @TableId(type = IdType.AUTO)插入之后id自增
            baseMapper.insert(baseAttrInfo);
        } else {
            baseMapper.updateById(baseAttrInfo);
            // 根据平台属性id删除平台属性值的数据
//            LambdaQueryWrapper<BaseAttrValue> lambdaQueryWrapper = new LambdaQueryWrapper<>();
//            lambdaQueryWrapper.eq(BaseAttrValue::getAttrId,baseAttrInfo.getId());
//            baseAttrValueService.remove(lambdaQueryWrapper);
            baseAttrValueService.lambdaUpdate().eq(BaseAttrValue::getAttrId,baseAttrInfo.getId()).remove();
        }
        List<BaseAttrValue> attrValueList = baseAttrInfo.getAttrValueList();
        //判断是否是空值
        if (!CollectionUtils.isEmpty(attrValueList)) {
            //有参无返回，参数是attrValueList集合的泛型对象
            attrValueList.forEach(baseAttrValue -> {
                //attrId = baseAttrInfo.getId 平台属性的id
                //在保存之后，应该获取当前新增的id值，因为@TableId(type = IdType.AUTO)插入之后id自增
                baseAttrValue.setAttrId(baseAttrInfo.getId());
                //baseAttrValueService.save(baseAttrValue);
                //要修改为insert into base_attr_value values(?,?),(?,?);
            });
        }
        //批量插入数据
        baseAttrValueService.saveBatch(attrValueList);
    }


    @Override
    public List<BaseAttrValue> getAttrInfoListForId(Long attrId) {
        //select * from base_attr_value where attr_id = id and is_delete = 0
        LambdaQueryWrapper<BaseAttrValue> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(BaseAttrValue::getAttrId, attrId);
        return baseAttrValueService.list(lambdaQueryWrapper);
    }


    /**
     * 根据平台属性ID 获取平台属性
     * @param attrId
     * @return
     */
    @Override
    public BaseAttrInfo getAttrInfo(Long attrId) {
        BaseAttrInfo baseAttrInfo = this.getById(attrId);
        if (baseAttrInfo != null) {
            //查询平台属性值集合列表
            baseAttrInfo.setAttrValueList(this.getAttrInfoListForId(attrId));
        }
        return baseAttrInfo;
    }
}




