package com.bootdo.clouddoview.controller;

import com.bootdo.clouddocommon.context.FilterContextHandler;
import com.bootdo.clouddoview.domain.MenuDO;
import com.bootdo.clouddoview.domain.Tree;
import com.bootdo.clouddoview.feignService.admin.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @author bootdo 1992lcg@163.com
 * @version V1.0
 */
@RestController
public class IndexController {
    @Autowired
    AdminService adminService;

    @RequestMapping("/index")
    ModelAndView index() {
        ModelAndView mv = new ModelAndView("index_v1");
        mv.addObject("menus",adminService.currenUserMenus());
        mv.addObject("username", FilterContextHandler.getName());
        return mv;
    }

    @RequestMapping("/login")
    ModelAndView login() {
        return new ModelAndView("login");
    }

    @GetMapping("/main")
    ModelAndView main() {
        return new ModelAndView("main");
    }

    @GetMapping("/test")
    Object currenUserMenus() {
        Object object = adminService.currenUserMenus();
        List<Tree<MenuDO>> menus = ( List<Tree<MenuDO>>)object;
        return menus;
    }
}
