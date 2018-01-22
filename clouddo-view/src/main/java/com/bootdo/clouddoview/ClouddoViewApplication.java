package com.bootdo.clouddoview;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.feign.EnableFeignClients;
import org.springframework.cloud.netflix.feign.FeignClient;
@EnableEurekaClient
@EnableFeignClients
@SpringBootApplication
public class ClouddoViewApplication {

	public static void main(String[] args) {
		SpringApplication.run(ClouddoViewApplication.class, args);
	}
}
