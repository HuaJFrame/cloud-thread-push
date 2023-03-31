package com.huajframe.push;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * @author Hua JFarmer
 */
@SpringBootApplication
@MapperScan(basePackages = "com.huajframe.push.dao")
@EnableDiscoveryClient
@EnableFeignClients(basePackages = "com.huajframe.push.feign")
@EnableTransactionManagement
public class PushApplication {

    public static void main(String[] args) {
        SpringApplication.run(PushApplication.class, args);
    }

}
