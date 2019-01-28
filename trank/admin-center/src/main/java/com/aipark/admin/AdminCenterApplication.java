package com.aipark.admin;

import de.codecentric.boot.admin.server.config.EnableAdminServer;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

/**
 * @author admin
 * spring boot admin 监控界面
 */
@EnableAdminServer
@EnableDiscoveryClient
@SpringBootApplication
public class AdminCenterApplication {

public static void main(String[] args) {
	SpringApplication.run(AdminCenterApplication.class, args);
}

}

