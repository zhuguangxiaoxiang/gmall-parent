package com.gmall.product;


import io.minio.BucketExistsArgs;
import io.minio.MakeBucketArgs;
import io.minio.MinioClient;
import io.minio.UploadObjectArgs;
import io.minio.errors.MinioException;
import org.apache.commons.io.FilenameUtils;
import org.junit.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.io.FileInputStream;
import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;

/**
 * @Auther: Administrator
 * @Date: 2023/5/26
 */
@SpringBootTest
public class UploadTest {
    @Test
    public void testString() {
        //字符串截取：subString();
        String fileName = "13.23.txt";
        //包前，不包后
//        System.out.println(fileName.substring(fileName.lastIndexOf(".")));   fileName.lastIndexOf(".")//截取最后一个.
        System.out.println(fileName.lastIndexOf("."));
        System.out.println(UUID.randomUUID().toString().replaceAll("-", "") + fileName.substring(fileName.lastIndexOf(".")));
        System.out.println(FilenameUtils.getExtension(fileName));
        System.out.println(UUID.randomUUID().toString().replaceAll("-", "") + "." + FilenameUtils.getExtension(fileName));
    }

    @Test
    public void uploadTest() throws Exception {
//        // 1、创建MinioClient
//        MinioClient minioClient =
//                new MinioClient("http://192.168.200.100:9000",
//                        "admin",
//                        "admin123456");
//
//        //2、判断 bucket是否存在
//        boolean isExist = minioClient.bucketExists("mall-oss");
//        if(isExist) {
//            System.out.println("Bucket 已经存在,可以直接上传...");
//        } else {
//            // 3、创建一个名为 mall-oss 的存储桶
//            minioClient.makeBucket("mall-oss");
//        }
//
//        String path = "C:\\Users\\Administrator\\Desktop\\尚品汇\\资料\\03 商品图片\\4.png";
//        //3、使用putObject上传一个文件到存储桶中。
//
//        /**
//         * long objectSize,  对象大小
//         * long partSize,    部分大小(分片上传) -1L
//         */
//        FileInputStream stream = new FileInputStream(path);
//
//        PutObjectOptions options = new PutObjectOptions(stream.available(),-1L); //PutObjectOptions //上传参数项
//        options.setContentType("image/png"); //指定内容类型
//        minioClient.putObject("mall-oss",
//                "7.png",
//                new FileInputStream(path),
//                options);
//        System.out.println("上传成功...");
    }

    @Test
    public void fileUploadTest() {
        try {
            // Create a minioClient with the MinIO server playground, its access key and secret key.
            MinioClient minioClient =
                    MinioClient.builder()
                            .endpoint("http://192.168.200.123:9000")
                            .credentials("admin", "admin123456")
                            .build();

            // Make 'asiatrip' bucket if not exist.
            boolean found =
                    minioClient.bucketExists(BucketExistsArgs.builder().bucket("test").build());
            if (!found) {
                // Make a new bucket called 'asiatrip'.
                minioClient.makeBucket(MakeBucketArgs.builder().bucket("test").build());
            } else {
                System.out.println("Bucket 'asiatrip' already exists.");
            }

            // Upload '/home/user/Photos/asiaphotos.zip' as object name 'asiaphotos-2015.zip' to bucket
            // 'asiatrip'.
            minioClient.uploadObject(
                    UploadObjectArgs.builder()
                            .bucket("test")
                            .object("1603560891agWg.jpg")
                            .filename("F:\\Administrator\\图片\\__www.2meinv.com\\2020好看的美女福利妹子图片集每日更新第34期\\1603560891agWg.jpg")
                            .build());
            System.out.println(
                    "'F:\\Administrator\\图片\\__www.2meinv.com\\2020好看的美女福利妹子图片集每日更新第34期\\1603560891agWg.jpg' is successfully uploaded as "
                            + "object '1603560891agWg.jpg' to bucket 'test'.");
        } catch (MinioException e) {
            System.out.println("Error occurred: " + e);
            System.out.println("HTTP trace: " + e.httpTrace());
        } catch (IOException e) {
            throw new RuntimeException(e);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        } catch (InvalidKeyException e) {
            throw new RuntimeException(e);
        }
    }
}
