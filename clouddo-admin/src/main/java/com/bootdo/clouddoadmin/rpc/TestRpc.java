package com.bootdo.clouddoadmin.rpc;

import com.bootdo.clouddocommon.dto.MenuDTO;
import com.bootdo.clouddocommon.intercepter.FeignIntercepter;
import feign.Headers;
import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@FeignClient(name = "course", configuration = FeignIntercepter.class)
public interface TestRpc {
    @GetMapping("/test/testRpc/test")
    String test();
}
