package com.gmall.item.sql;

import com.gmall.item.mybatis.annotation.MySQL;
import com.gmall.item.mybatis.dao.PersonDao;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Parameter;
import java.lang.reflect.Proxy;
import java.util.Arrays;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @Auther: Administrator
 * @Description
 * @Date: 2023/6/4
 */
public class MySqlSession {

    public <T> T getMapper(Class<T> dao) {
        //返回mapper实例操作数据库
        T instance = (T) Proxy.newProxyInstance(
                dao.getClassLoader(),
                new Class<?>[]{dao},
                new InvocationHandler() {
                    @Override
                    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
                        System.out.println("获取链接....");

                        final int[] index = {0};
                        Map<String, Object> collect = Arrays.stream(method.getParameters())
                                .collect(Collectors.
                                        toMap(item -> item.getName(), item -> args[index[0]++]));

                        System.out.println("参数的map：" + collect);

                        for (Parameter parameter : method.getParameters()) {
                            System.out.println(parameter);
                        }

                        //拿到注解
                        MySQL mySQL = method.getDeclaredAnnotation(MySQL.class);
                        //获取注解上的sql
                        String value = mySQL.value();
                        System.out.println("准备SQL：" + value);
                        String sqlType = "";
                        if (value.startsWith("select")) {
                            sqlType = "select";
                        }
                        if (value.startsWith("insert")) {
                            sqlType = "insert";
                        }
                        System.out.println("执行SQL；这是一次：" + sqlType);

                        if (sqlType.equals("insert")) {
                            for (Parameter parameter : method.getParameters()) {
                                String x = "{" + parameter.getName() + "}";
                                value = value.replace(x,collect.get(parameter.getName()).toString());
                            }
//                            int index = 0;
//                            while (true) {
//                                if (value.indexOf("?") <= 0) {
//                                    break;
//                                }
//                                value = value.replaceFirst("\\?", args[index++].toString()); //Java中正则需要用\\?匹配问号
//                            }
                        }

                        System.out.println("最终需要执行的SQL是：" + value);
                        System.out.println("获取返回结果...");
                        Class<?> returnType = method.getReturnType();
                        System.out.println("分析 ResultSet，并封装为:" + returnType);
                        return null;
                    }
                });
        return instance;
    }
}
