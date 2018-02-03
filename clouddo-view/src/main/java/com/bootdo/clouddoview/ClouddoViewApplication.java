package com.bootdo.clouddoview;

import com.bootdo.clouddocommon.filter.ContextFilter;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.feign.EnableFeignClients;
import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;

@EnableEurekaClient
@EnableFeignClients
@SpringBootApplication
@ComponentScan(basePackages = {"com.bootdo.clouddoview","com.bootdo.clouddocommon"})
public class ClouddoViewApplication {

	public static void main(String[] args) {
		SpringApplication.run(ClouddoViewApplication.class, args);
	}

	@Bean
	public FilterRegistrationBean filterRegistrationBean(){
		FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean(new ContextFilter());
		filterRegistrationBean.addUrlPatterns("/page/*");
		return filterRegistrationBean;
	}
}
