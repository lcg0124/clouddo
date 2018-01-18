package com.bootdo.clouddozuul;

import com.bootdo.clouddozuul.filter.AccessFilter;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.feign.EnableFeignClients;
import org.springframework.cloud.netflix.zuul.EnableZuulProxy;
import org.springframework.context.annotation.Bean;

@EnableFeignClients
@EnableZuulProxy
@EnableEurekaClient
@SpringBootApplication
public class ClouddoZuulApplication {

	public static void main(String[] args) {
		SpringApplication.run(ClouddoZuulApplication.class, args);
	}

	@Bean
	public AccessFilter accessFilter(){
		return new AccessFilter();
	}
}
