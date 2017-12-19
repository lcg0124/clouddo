package com.bootdo.clouddoserver;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@EnableEurekaServer
@SpringBootApplication
public class ClouddoServerApplication {

	public static void main(String[] args) {
		SpringApplication.run(ClouddoServerApplication.class, args);
	}
}
