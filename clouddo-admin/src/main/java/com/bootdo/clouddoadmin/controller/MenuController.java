package com.bootdo.clouddoadmin.controller;

import com.bootdo.clouddoadmin.domain.MenuDO;
import com.bootdo.clouddoadmin.domain.Tree;
import com.bootdo.clouddoadmin.service.MenuService;
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

//    List<MenuDO> list(String userId) {
//        List<Tree<MenuDO>> menus = menuService.listMenuTree(userId);
//    }
}
