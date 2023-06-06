package com.gmall.item.aspect;

import com.gmall.common.constant.RedisConst;
import com.gmall.item.aspect.annotaion.MallCache;
import com.gmall.item.service.CacheService;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.aspectj.lang.reflect.MethodSignature;
import org.jetbrains.annotations.NotNull;
import org.redisson.api.RLock;
import org.redisson.api.RedissonClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.expression.EvaluationContext;
import org.springframework.expression.Expression;
import org.springframework.expression.ParserContext;
import org.springframework.expression.spel.standard.SpelExpressionParser;
import org.springframework.expression.spel.support.StandardEvaluationContext;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;
import org.springframework.util.StringUtils;

import java.lang.annotation.Annotation;
import java.lang.reflect.Method;
import java.lang.reflect.Type;
import java.util.Arrays;
import java.util.concurrent.TimeUnit;

/**
 * @Auther: Administrator
 * @Description
 * @Date: 2023/6/4
 */
@Slf4j
@Component //加入容器中才能生效
@Aspect //声明这是一个切面。保证切面的通用性
public class CacheAspect {

    //    @Pointcut("execution(public * com.gmall.item.service.impl.SkuDetailServiceImpl.getSkuDetailData(java.lang.Long))")
    @Pointcut("@annotation(com.gmall.item.aspect.annotaion.MallCache)")
    public void pc() {

    }


    @Autowired
    CacheService cacheService;

    @Autowired
    RedissonClient redissonClient;

    //1、创建表达式解析器
    SpelExpressionParser parser = new SpelExpressionParser();

    //拦截目标方法的执行：
    //连接点：封装类 目标方法与目前切面信息
    //环绕通知
    @Around(value = "pc()")
    public Object around(ProceedingJoinPoint pjp) throws Throwable {
        boolean tryLock = false;
        RLock lock = null;
        try {
            log.info("缓存切面介入...");
            //拿到目标方法的所有参数
//            Object[] args = pjp.getArgs();
//            Long skuId = (Long) args[0];
            //【动态：缓存key，缓存value】1、先查缓存；动态的。查各种数据；数据缓存用的key都不一样
//            SkuDetailVo fromCache = cacheService.getFromCache(skuId);
            Type returnType = getMethodReturnType(pjp);
            //得到注解
            MallCache mallCache = getMethodAnnotation(pjp, MallCache.class);
//            String cacheKey = MallCache.cacheKey();
            String cacheEval = "";
            if (StringUtils.isEmpty(mallCache.cacheKey())) {
                cacheEval = getCacheKeyDefault(mallCache.cacheKey(), pjp);
            } else {
                //计算表达式的值
                cacheEval = evalExpression(mallCache.cacheKey(), pjp, String.class);
            }
//            String cacheKey = evealExpression(expr,pjp);
            //【动态：缓存中的数据】
            Object fromCache = cacheService.getCacheDatta(cacheEval, returnType);

            //2、缓存中有直接返回
            if (fromCache != null) {
                log.info("缓存命中");
                return fromCache;
            }
            //3、缓存中没有。先问bitmap
            log.info("缓存未命中，先问bitmap");
            //2、【动态：位图key，位图value】每种业务都有自己的bitmap。或者可以不用。动态开启的。
            //bitmap不一样，要判定的值也不一样
//            boolean contain = cacheService.mightContain(skuId);
            String bitMapName = mallCache.bitMapName(); //key可以自己指定，
            if (!StringUtils.isEmpty(bitMapName)) {
                //Assert断言类
                Assert.hasLength(mallCache.bitMapKey(), "bitmap索引位置必须给定");
                Long bitMapIndex = evalExpression(mallCache.bitMapKey(), pjp, Long.class);//value可以表达式计算
                boolean contain = cacheService.mightContain(bitMapName, bitMapIndex);
                //4、位图说没有，返回空
                if (!contain) {
                    log.info("bitmap未命中，疑似随机攻击");
                    return null;
                }
            } //为null 位图不用直接走下面流程
            //5、【动态：锁key】位图中说有，准备回源，回源前先上锁
            String lockKey = RedisConst.LOCK_DEFAULT;
            if (StringUtils.isEmpty(mallCache.lockKey())) {
                lockKey += cacheEval;
            } else {
                lockKey = evalExpression(mallCache.lockKey(), pjp, String.class);
            }
            lock = redissonClient.getLock(lockKey);
            tryLock = lock.tryLock();
            if (tryLock) {
                //执行目标方法
                //极端情况：
                //A：缓存？==位图？===得锁？===回源===放缓存===释放
                //B：缓存=====================================位图？===得锁？===回源===放缓存===释放
                log.info("获取分布式锁成功，准备回源.....");
                //【动态：缓存中的数据】缓存双检查
                fromCache = cacheService.getCacheDatta(cacheEval, returnType);
                if (fromCache != null) {
                    return fromCache;
                }
                log.info("正在回源....");
                Object proceed = pjp.proceed();//执行目标方法
                log.info("回源完成.....");
                //6、保存到缓存中
                //【动态：每个数据缓存时间不一样】 每种业务存的东西不一样，key也不一样，过期时间也可能不一样
                long ttl = mallCache.ttl();
                TimeUnit unit = mallCache.unit();
                cacheService.saveCatchData(cacheEval, proceed, ttl, unit);
                //7、返回
                return proceed;
            }
            //8、没抢到锁的人。等待一段时间直接查询缓存
            log.info("获取分布式锁失败，等待查询缓存.....");
            TimeUnit.MILLISECONDS.sleep(300);
            return cacheService.getCacheDatta(cacheEval, returnType);
        } finally {
            if (tryLock) {
                lock.unlock();
            }
        }
    }

    private String getCacheKeyDefault(String cacheKey, ProceedingJoinPoint pjp) {
        //没传表达式；默认使用方法名全签名+参数列表
        MethodSignature signature = (MethodSignature) pjp.getSignature();
        String methodName = signature.getMethod().getName();
        String className = signature.getMethod().getDeclaringClass().toString().replace("class ", "");
        Object params = Arrays.stream(pjp.getArgs()).reduce((o1, o2) -> o1.toString() + "_" + o2.toString()).get();
        //缓存的key = 类名：方法名：参数表
        return className + ":" + methodName + ":" + params.toString();
    }

    /**
     * 计算指定表达式的值
     *
     * @param expr
     * @param pjp
     * @return
     */
    private <T> T evalExpression(String expr, ProceedingJoinPoint pjp, Class<T> relType) {

        //2、解析表达式
        Expression expression = parser.parseExpression(expr, ParserContext.TEMPLATE_EXPRESSION);
        //3、得到表达式
        EvaluationContext evaluationContext = new StandardEvaluationContext();
        evaluationContext.setVariable("args", pjp.getArgs());
        T value = expression.getValue(evaluationContext, relType);
        return value;
    }

    /**
     * 获取方法上的指定注解
     *
     * @param pjp
     * @param tClass
     * @param <T>
     * @return
     */
    private <T extends Annotation> T getMethodAnnotation(ProceedingJoinPoint pjp, Class<T> tClass) {
        MethodSignature signature = (MethodSignature) pjp.getSignature();
        Method method = signature.getMethod();
        T annotation = method.getDeclaredAnnotation(tClass);
        return annotation;
    }

    /**
     * 获取目标方法的带泛型的返回值类型
     *
     * @param pjp
     * @return
     */

    @NotNull
    private static Type getMethodReturnType(ProceedingJoinPoint pjp) {
        MethodSignature signature = (MethodSignature) pjp.getSignature();
        Type returnType = signature.getMethod().getGenericReturnType();
        return returnType;
    }


    //最模糊   @Before(value = "execution(* *.*(..)")
    //最完整   @Before(value = "execution(public com.gmall.product.vo.SkuDetailVo com.gmall.item.service.impl.SkuDetailServiceImpl.getSkuDetailData(java.lang.Long))")
    //*：匹配任意字符。
    //..：匹配任意个数
    //前置通知：在目标方法之前执行
//    @Before(value = "pc()")
//    public void before() {
//
//    }

    //后置通知：在目标方法之后finally执行
//    @After(value = "pc()")
//    public void after() {
//
//    }

    //返回通知：方法正常完成
//    @AfterReturning(value = "pc()")
//    public void returning() {
//
//    }

    //异常通知：方法执行失败出现异常以后执行
//    @AfterThrowing(value = "pc()", throwing = "e")
//    public void throwing(Throwable e) {
//
//    }
}
