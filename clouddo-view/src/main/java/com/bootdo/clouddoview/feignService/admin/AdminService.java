package com.bootdo.clouddoview.feignService.admin;

import com.bootdo.clouddocommon.intercepter.FeignIntercepter;
import com.bootdo.clouddoview.domain.MenuDO;
import com.bootdo.clouddoview.domain.Tree;
import com.bootdo.clouddoview.domain.UserDO;
import feign.Headers;
import feign.RequestLine;
import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Headers("Content-Type:application/json")
@FeignClient(name="admin",configuration= FeignIntercepter.class)
public interface AdminService {
    @RequestMapping("menu/currentUserMenus")
    Object currenUserMenus();
}
