package com.aipark.registry;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

/**
 * @author admin
 * @description 注册中心
 */
@EnableEurekaServer
@SpringBootApplication
public class RegistryCenterApplication {

public static void main(String[] args) {
	SpringApplication.run(RegistryCenterApplication.class, args);
}

}

