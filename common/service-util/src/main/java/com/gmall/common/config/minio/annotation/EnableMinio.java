package com.gmall.common.config.minio.annotation;


import com.gmall.common.config.minio.MinioAutoConfiguration;
import org.springframework.context.annotation.Import;

import java.lang.annotation.*;

@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Import({MinioAutoConfiguration.class})
public @interface EnableMinio {
}
