package com.aipark.message;

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
@MapperScan("com.aipark.message.dao")
@EnableDiscoveryClient
@SpringBootApplication
public class MessageCenterApplication {

	public static void main(String[] args) {
		SpringApplication.run(MessageCenterApplication.class, args);
	}

}

