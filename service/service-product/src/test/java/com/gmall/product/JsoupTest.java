package com.gmall.product;

import lombok.extern.slf4j.Slf4j;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.junit.Test;
import org.springframework.util.StringUtils;

import java.io.IOException;

/**
 * @Auther: Administrator
 * @Date: 2023/5/28
 */
public class JsoupTest {

    @Test
    public void search() throws IOException {
        Document doc = Jsoup.connect("https://list.suning.com/0-20006-0.html?safp=d488778a.homepagev8.126605238631.2&safc=cate.0.0&safpn=10001").get();
        Elements elements = doc.getElementsByClass("product-box ");
        for (Element element : elements) {
            String href = element.getElementsByClass("img-block")
                    .get(0).child(0).attr("href");
            String image = getImage(href);
            //TODO 图片
            System.out.println(image);
        }
    }

    public String getImage(String href) throws IOException {
        String image = "";
        try {
            //1、连上某个地址获取页面内容
            Document doc = Jsoup.connect("https:" + href).get();

            //document.getElementById("labelPicture").parentNode.children[1].children[0].src
            String attr = doc.getElementById("labelPicture")
                    .parent()
                    .getElementsByTag("a")
                    .get(0).child(0).attr("src");
            if (!StringUtils.isEmpty(attr)) {
               image = attr;
            }
        } catch (Exception e) {
        }
        return image;
    }


    /**
     * 1、获取某个商品的具体图片
     * https://product.suning.com/0000000000/12391268180.html
     */
    @Test
    public void testImg() throws IOException {
        Long i = 10000000000L;
        while (true) {

            try {
                //1、连上某个地址获取页面内容
                Document doc = Jsoup.connect("https://product.suning.com/0000000000/" + ++i + ".html").get();

                //document.getElementById("labelPicture").parentNode.children[1].children[0].src
                String attr = doc.getElementById("labelPicture")
                        .parent()
                        .getElementsByTag("a")
                        .get(0).child(0).attr("src");
                if (!StringUtils.isEmpty(attr)) {
                    System.out.println("商品id：" + i + "图片：" + attr);
                }
            } catch (Exception e) {
            }
        }
    }
}
