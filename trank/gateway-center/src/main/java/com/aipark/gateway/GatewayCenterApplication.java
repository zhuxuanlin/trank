package com.aipark.gateway;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.zuul.EnableZuulProxy;

/**
 * @author zhuxuanlin
 */
@EnableZuulProxy
@EnableDiscoveryClient
@SpringBootApplication
public class GatewayCenterApplication {

public static void main(String[] args) {
	SpringApplication.run(GatewayCenterApplication.class, args);
}

}

