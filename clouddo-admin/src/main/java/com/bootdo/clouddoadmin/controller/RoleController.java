package com.bootdo.clouddoadmin.controller;

import com.bootdo.clouddoadmin.domain.RoleDO;
import com.bootdo.clouddoadmin.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RequestMapping("/role")
@RestController
public class RoleController {
    @Autowired
    RoleService roleService;

    @GetMapping("/list")
    List<RoleDO> list() {
        return roleService.list();
    }
}
