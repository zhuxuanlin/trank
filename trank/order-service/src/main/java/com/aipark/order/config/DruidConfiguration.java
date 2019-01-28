package com.aipark.order.config;

import com.alibaba.druid.support.http.StatViewServlet;
import com.alibaba.druid.support.http.WebStatFilter;
import com.alibaba.druid.support.spring.stat.DruidStatInterceptor;
import org.springframework.aop.support.DefaultPointcutAdvisor;
import org.springframework.aop.support.JdkRegexpMethodPointcut;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * Author:      zhuxuanlin
 * Date:        2019-01-26 16:11
 * Version:     1.0
 * Description: 数据库监控
 */
@Configuration
public class DruidConfiguration {

@Bean
public ServletRegistrationBean<StatViewServlet> registrationBean() {
	ServletRegistrationBean<StatViewServlet> bean = new ServletRegistrationBean<>(new StatViewServlet(), "/druid/*");
	//bean.addInitParameter("loginUsername", "admin");
	//bean.addInitParameter("loginPassword", "admin");
	bean.addInitParameter("resetEnable", "false");
	return bean;
}

@Bean
public FilterRegistrationBean<WebStatFilter> druidStatFilter() {
	FilterRegistrationBean<WebStatFilter> bean = new FilterRegistrationBean<>((new WebStatFilter()));
	bean.addUrlPatterns("/*");
	bean.addInitParameter("exclusions", "*.js,*.gif,*.jpg,*.png,*.css,*.ico,/druid/*");
	bean.addInitParameter("profileEnable", "true");
	return bean;
}

@Bean
public DruidStatInterceptor druidStatInterceptor() {
	return new DruidStatInterceptor();
}

@Bean
public JdkRegexpMethodPointcut jdkRegexpMethodPointcut() {
	JdkRegexpMethodPointcut pointcut = new JdkRegexpMethodPointcut();
	pointcut.setPatterns("com.aipark.order.controller.*",
			"com.aipark.order.dao.*",
			"com.aipark.order.service.*");
	return pointcut;
}

@Bean
public DefaultPointcutAdvisor defaultPointcutAdvisor(DruidStatInterceptor druidStatInterceptor, JdkRegexpMethodPointcut jdkRegexpMethodPointcut) {
	DefaultPointcutAdvisor defaultPointcutAdvisor = new DefaultPointcutAdvisor();
	defaultPointcutAdvisor.setPointcut(jdkRegexpMethodPointcut);
	defaultPointcutAdvisor.setAdvice(druidStatInterceptor);
	return defaultPointcutAdvisor;
}
}
