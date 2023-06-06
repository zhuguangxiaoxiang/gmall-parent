package com.gmall.item;
import java.lang.reflect.Type;
import java.util.*;

import com.alibaba.fastjson.JSON;
import com.gmall.product.entity.SkuImage;
import org.junit.jupiter.api.Test;


import java.lang.reflect.Method;

/**
 * @Auther: Administrator
 * @Description
 * @Date: 2023/6/5
 */
public class GenericTest {


    @Test
    void test02() {
        List<SkuImage> images = new ArrayList<>();
        SkuImage skuImage = new SkuImage();
        skuImage.setId(0L);
        skuImage.setSkuId(0L);
        skuImage.setImgName("");
        skuImage.setImgUrl("");
        skuImage.setSpuImgId(0L);
        skuImage.setIsDefault("0");
        images.add(skuImage);


        SkuImage skuImage2 = new SkuImage();
        skuImage2.setId(1L);
        skuImage2.setSkuId(1L);
        skuImage2.setImgName("1");
        skuImage2.setImgUrl("1");
        skuImage2.setSpuImgId(1L);
        skuImage2.setIsDefault("1");
        images.add(skuImage2);

        String json = JSON.toJSONString(images);
        System.out.println(json);
        Type type = null;
//        for (Method method : GenericTest.class.getDeclaredMethods()) {
//            if (method.getName().equals("getHaHa")) {
//                type = method.getGenericReturnType();
//            }
//        }
        type = Arrays.stream(GenericTest.class.getDeclaredMethods())
                .filter(method -> method.getName().equals("getHaHa"))
                .map(Method::getGenericReturnType).findFirst() .orElse(null);
        Object o = JSON.parseObject(json, type);
        System.out.println("逆转后的对象：" + o );
    }
    @Test
    void test01() {
//        Arrays.stream(GenericTest.class.getDeclaredMethods())
//                .forEach(method -> System.out.println(method.getName() + "===>" + method.getGenericReturnType()));
        for (Method method : GenericTest.class.getDeclaredMethods()) {
            System.out.println(method.getName() + "===>" + method.getGenericReturnType() + "===>" + method.getDeclaringClass());
        }
    }

    List<String> getHaHa() {
        return null;
    }

    String getHeHe() {
        return "";
    }

    Map<String, List<SkuImage>> getHeiHei() {
        return null;
    }
}
