package com.bootdo.clouddoview.feignService.admin;

import com.bootdo.clouddocommon.intercepter.FeignIntercepter;
import org.springframework.cloud.netflix.feign.FeignClient;

@FeignClient(name="admin",configuration= FeignIntercepter.class)
public interface UserService {

}
