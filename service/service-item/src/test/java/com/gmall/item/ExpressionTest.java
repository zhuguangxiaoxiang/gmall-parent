package com.gmall.item;

import org.junit.jupiter.api.Test;
import org.springframework.expression.EvaluationContext;
import org.springframework.expression.Expression;
import org.springframework.expression.ExpressionParser;
import org.springframework.expression.ParserContext;
import org.springframework.expression.spel.standard.SpelExpressionParser;
import org.springframework.expression.spel.support.StandardEvaluationContext;

import java.util.UUID;

/**
 * @Auther: Administrator
 * @Description
 * @Date: 2023/6/5
 */
public class ExpressionTest {


    @Test
    void test02() {
        //1、创建一个表达式解析器
        ExpressionParser parser = new SpelExpressionParser();
        //2、解析一个表达式；定界符 //sku:info:#{#args[1]}
        Expression expression = parser.parseExpression("sku:info:#{#args[1]}",
                ParserContext.TEMPLATE_EXPRESSION);
        //3、得到表达式计算出来的值
        EvaluationContext evaluationContext = new StandardEvaluationContext();
        evaluationContext.setVariable("args",new Long[] {88L,77L,45L});
        String value = expression.getValue(evaluationContext, String.class);
        System.out.println("最终的值为：" + value);
    }

    @Test
    void test01() {
        //1、创建一个表达式解析器
        ExpressionParser parser = new SpelExpressionParser();
        //2、解析一个表达式
//        Expression expression = parser.parseExpression("1+1"); //2
//        Expression expression = parser.parseExpression("'liujing'.toUpperCase()"); //LIUJING
//        Expression expression = parser.parseExpression("new com.gmall.item.ExpressionTest.Person().haha()");
        String string = UUID.randomUUID().toString();
        Expression expression = parser.parseExpression("T(java.util.UUID).randomUUID().toString()");
        //3、得到表达式计算出来的值
        Object value = expression.getValue();
        System.out.println("最终的值为：" + value);
    }

    public static class Person {
        public String haha() {
            System.out.println("haha.....");
            return "666";
        }
    }
}
