package com.bootdo.clouddozuul.feignClient;

import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @author bootdo 1992lcg@163.com
 * @version V1.0
 */
@Component
@FeignClient(value = "admin")
public interface AdminService {
    @RequestMapping(value = "/checkToken")
    boolean checkToken(@RequestParam("token") String token);
}
