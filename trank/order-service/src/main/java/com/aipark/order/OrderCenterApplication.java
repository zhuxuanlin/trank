package com.aipark.order;


import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;


/**
 * @author zhuxuanlin
 */
@EnableFeignClients("com.aipark")
@ComponentScan(basePackages = "com.aipark")
@MapperScan("com.aipark.order.dao")
@EnableDiscoveryClient
@SpringBootApplication
public class OrderCenterApplication {


public static void main(String[] args) {
	SpringApplication.run(OrderCenterApplication.class, args);
}
}
