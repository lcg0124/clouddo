package com.bootdo.clouddoview.feignService.admin;

import com.bootdo.clouddocommon.intercepter.FeignIntercepter;
import com.bootdo.clouddoview.domain.RoleDO;
import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@FeignClient(name = "admin", configuration = FeignIntercepter.class)
public interface RoleService {
    @RequestMapping("/role/list")
    List<RoleDO> list();
}
