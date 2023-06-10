package com.gmall.product.controller;

import com.gmall.common.result.Result;
import com.gmall.product.service.FileService;
import io.minio.*;
import io.minio.errors.*;
import io.swagger.annotations.Api;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;

/**
 * @Auther: Administrator
 * @Date: 2023/5/26
 */
@Api(tags = "文件上传")
@Slf4j
@RequestMapping("/admin/product")
@RestController
public class FileUploadController {

    @Autowired
    FileService fileService;

    /**
     * 文件上传：
     * 多部件上传
     * web开发：
     * 请求：
     * 请求首行（请求方式、请求地址、协议）
     *
     * @return
     * @PathVariable：获取路径位置的变量
     * @RequestParam：查询字符串或请求体 请求头
     * @ReuestHeader：请求头
     * @CookieValue：获取cookie值 请求体
     * @RequestBody： 获取请求体中的所有数据
     * @RequestPart： 获取请求体中的文件项
     * 响应：
     * 响应首行（响应状态码）
     * 响应头
     * 响应体
     * 完整的请求地址：
     * http://api.gmall.com:80/admin/product/xxx?k=v&k=v
     * 【协议://主机:端口/路径?查询字符串
     * 请求体数据k=v】
     * 请求参数：带到url?后面，也可以带到请求体中。
     */

//    @PostMapping("/fileUpload")
//    public Result upload(@RequestPart("file") MultipartFile file) throws Exception {
//
//        String contentType = file.getContentType();
//        String filename = file.getOriginalFilename();
//        // <input name="haha" type="file">
////        String name = file.getName(); //文件上传框的名，不是文件名。
//        log.info("文件上传：文件名：{}，文件大小：{}，文件类型：{}", filename, file.getSize(), contentType);
//
//        String path = fileService.upload(file);
//        //把这个文件上传给Minio，并返回访问地址
//        return Result.ok(path);
//    }

    @Value("${app.minio.endpoint}")
    private String endPointUrl;

    @Value("${app.minio.access-key}")
    private String accessKey;

    @Value("${app.minio.secret-key}")
    private String secreKey;

    @Value("${app.minio.bucket-name}")
    private String bucketName;

    /**
     * 文件上传的坑：
     * 1、minion 8.5.2自带的 okhttp的版本太低为okhttp:3.14.9
     * 解决办法：1):在父工程中引入   <okhttp3.version>4.11.0</okhttp3.version>
     * 或排除okhttp依赖直接引入
     *         <dependency>
     *             <groupId>com.squareup.okhttp3</groupId>
     *             <artifactId>okhttp</artifactId>
     *             <version>4.11.0</version>
     *         </dependency>
     * 2、minio服务器与主机时差八个小时
     * 解决办法：
     * 1):确保安装 ntp
     * yum install ntp
     * 2):编辑 /etc/ntp.conf 文件以指定要同步的 NTP 服务器。在文件中找到 server 行
     * server time.windows.com
     * 3):保存并关闭 /etc/ntp.conf 文件
     * 4):启用和启动 ntpd 服务
     * systemctl enable ntpd.service
     * systemctl start ntpd.service
     * 5):使用以下命令检查 ntpd 服务是否正在运行
     * systemctl status ntpd.service
     * 一切正常，则应看到类似于以下内容的输出
     * systemctl status ntpd.service
     * ntpd.service - Network Time Service
     *    Loaded: loaded (/usr/lib/systemd/system/ntpd.service; enabled; vendor preset: disabled)
     *    Active: active (running) since 五 2023-05-26 08:33:57 CST; 14h ago
     *
     * [root@192 ~]# date
     * 2023年 05月 26日 星期五 23:15:17 CST
     * [root@192 ~]# timedatectl
     *       Local time: 五 2023-05-26 23:15:27 CST
     *   Universal time: 五 2023-05-26 15:15:27 UTC
     *         RTC time: 五 2023-05-26 15:15:26
     *        Time zone: Asia/Chongqing (CST, +0800)
     *      NTP enabled: yes
     * NTP synchronized: no
     *  RTC in local TZ: no
     *       DST active: n/a
     * @param file
     * @return
     */
    @PostMapping("/fileUpload")
    public Result fileUpload(MultipartFile file) {
        /**
         * minio:
         *   endpointUrl: http://192.168.200.123:9000
         *   accessKey: admin
         *   secreKey: admin123456
         *   bucketName: test
         */
        String url = "";

        try {
            // 声明一个URL对象
            MinioClient minioClient =
                    MinioClient.builder()
                            .endpoint(endPointUrl)
                            .credentials(accessKey, secreKey)
                            .build();

            // Make 'asiatrip' bucket if not exist.
            boolean found =
                    minioClient.bucketExists(BucketExistsArgs.builder().bucket(bucketName).build());
            if (!found) {
                // Make a new bucket called 'asiatrip'.
                minioClient.makeBucket(MakeBucketArgs.builder().bucket(bucketName).build());
            } else {
                System.out.println("Bucket " + bucketName + " already exists.");
            }
            //获取上传文件的名称。
            String originalFileName = file.getOriginalFilename();
            String fileName = UUID.randomUUID().toString().replace("-", "") + "." + FilenameUtils.getExtension(originalFileName);
            // Upload known sized input stream.
            minioClient.putObject(
                    PutObjectArgs.builder().bucket(bucketName).object(fileName).stream(
                                    file.getInputStream(), file.getSize(), -1)
                            .contentType("video/mp4")
                            .build());
            //url拼接
            //http://192.168.200.123:9000/test/dc3ef83d220a4d73945d70937f131cf7.jpg
            //为什么要拼接？
            url = endPointUrl + "/" + bucketName + "/" + fileName;
            log.info("文件上传的路径:{}", url);
        } catch (ErrorResponseException e) {
            throw new RuntimeException(e);
        } catch (InsufficientDataException e) {
            throw new RuntimeException(e);
        } catch (InternalException e) {
            throw new RuntimeException(e);
        } catch (InvalidKeyException e) {
            throw new RuntimeException(e);
        } catch (InvalidResponseException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        } catch (ServerException e) {
            throw new RuntimeException(e);
        } catch (XmlParserException e) {
            throw new RuntimeException(e);
        }

        //返回数据
        return Result.ok(url);
    }
}
