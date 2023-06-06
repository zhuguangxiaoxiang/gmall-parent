package com.gmall.item;

import lombok.Data;
import org.springframework.cglib.proxy.Enhancer;
import org.springframework.cglib.proxy.MethodInterceptor;
import org.springframework.cglib.proxy.MethodProxy;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

/**
 * @Auther: Administrator
 * @Description
 * @Date: 2023/6/3
 */
public class DynamicProxyTest {

    public static void main(String[] args) {
        BMW bmw = new BMW();
        bmw.go();

        //1、创建一个增强器
        Enhancer enhancer = new Enhancer();
        //2、设置父类
        enhancer.setSuperclass(BMW.class);
        //3、设置回调
        enhancer.setCallback(new MethodInterceptor() {
            /**
             * 调用每一个方法都会进入拦截器
             * @param o：当前创建好的的被代理对象
             * @param method：方法
             * @param args：参数
             * @param methodProxy：代理方法
             * @return
             * @throws Throwable
             */
            @Override
            public Object intercept(Object o,
                                    Method method,
                                    Object[] args,
                                    MethodProxy methodProxy) throws Throwable {
//                System.out.println(method);
//                method.invoke(bmw);//真正执行目标方法
//                System.out.println(args);
//                System.out.println(methodProxy);

                //执行父类方法才行
                System.out.println("加油");
                System.out.println("启动");
                Object invokeSuper = methodProxy.invokeSuper(o, args);//
                System.out.println("停车");
                System.out.println("熄火");
                return invokeSuper;
            }
        });

        System.out.println("====================================");

        //4、创建代理对象
        BMW m = (BMW) enhancer.create();
        m.go();
    }

    /**
     * 测试动态代理
     *
     * @param args
     */

    public static void jdk(String[] args) {
        //1、创建普通对象
        Wuling wuling1 = new Wuling();
        wuling1.setName("Mini EV1");

        Wuling wuling2 = new Wuling();
        wuling2.setName("Mini EV2");

        Wuling wuling3 = new Wuling();
        wuling3.setName("Mini EV3");

        wuling1.go();
//        wuling2.go();
//        wuling3.go();

        //代理对象
        Car proxy = (Car) Proxy.newProxyInstance(
                Wuling.class.getClassLoader(),
                Wuling.class.getInterfaces(),
                new InvocationHandler() {
                    /**
                     *
                     * 明星、经纪人
                     *
                     * @param proxy 代理方法：经纪人
                     *
                     * @param method 当前方法
                     *
                     * @param args 参数
                     * @return
                     * @throws Throwable
                     */
                    @Override
                    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
                        //1、利用反射执行方法
                        System.out.println("代理正在执行");

                        //执行真正的目标方法
                        //1、方法执行之前：前置通知
                        Object invoke = null;
                        try {
                            invoke = method.invoke(wuling1, args);
                            //2、目标方法正常执行完成：返回通知
                        } catch (Exception e) {
                            //3、异常完成：异常通知
                        } finally {
                            //4、最终都要做的事情：后置通知
                        }
                        return invoke;
                    }
                }
        );
        System.out.println("==================================");
        proxy.go();
    }
}

interface Car {
    void go();
}

class BMW {
    public void go() {
        System.out.println("BMW==汽车行驶中");
    }
}

@Data
class Wuling implements Car {

    private String name;

    @Override
    public void go() {
        System.out.println(name + "==汽车行驶中");
    }
}
