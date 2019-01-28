package com.aipark.gateway.config;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;

/**
 * @author zhuxuanlin
 * Version:     1.0
 * Description: CORS配置
 */
@Configuration
public class ApiKeeperConfiguration {

/**
 * CORS配置
 *
 * @return
 */
@Bean
public CorsFilter corsFilter() {
	final UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
	final CorsConfiguration config = new CorsConfiguration();
	config.setAllowCredentials(true);
	config.addAllowedOrigin("*");
	config.addAllowedHeader("*");
	config.addAllowedMethod("OPTIONS");
	config.addAllowedMethod("HEAD");
	config.addAllowedMethod("GET");
	config.addAllowedMethod("PUT");
	config.addAllowedMethod("POST");
	config.addAllowedMethod("DELETE");
	config.addAllowedMethod("PATCH");
	source.registerCorsConfiguration("/**", config);
	return new CorsFilter(source);
}


//    @Bean
//    public AuthorizationFilter accessFilter() {
//        return new AuthorizationFilter();
//    }
//
//    @Bean
//    public FallbackProvider fallbackProvider() {
//        return new GlobalFallbackProvider();
//    }

}
