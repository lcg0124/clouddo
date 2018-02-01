package com.bootdo.clouddoadmin.controller;

import com.bootdo.clouddoadmin.domain.MenuDO;
import com.bootdo.clouddoadmin.domain.Tree;
import com.bootdo.clouddoadmin.service.MenuService;
import com.bootdo.clouddocommon.context.FilterContextHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author bootdo 1992lcg@163.com
 * @version V1.0
 */
@RequestMapping("/menu")
@RestController()
public class MenuController {
    @Autowired
    MenuService menuService;



    @RequestMapping("/currentUserMenus")
    List<Tree<MenuDO>> list() {
        String id = FilterContextHandler.getUserID();
        List<Tree<MenuDO>> menus = menuService.listMenuTree(Long.parseLong(FilterContextHandler.getUserID()));
        return menus;
    }
}
