package com.bootdo.clouddoadmin.controller;

import com.bootdo.clouddoadmin.domain.MenuDO;
import com.bootdo.clouddoadmin.domain.Tree;
import com.bootdo.clouddoadmin.service.MenuService;
import com.bootdo.clouddocommon.context.FilterContextHandler;
import com.bootdo.clouddocommon.utils.R;
import org.apache.ibatis.annotations.Delete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * @author bootdo 1992lcg@163.com
 * @version V1.0
 */
@RequestMapping("/menu")
@RestController()
public class MenuController {
    @Autowired
    MenuService menuService;

    @GetMapping("list")
    List<MenuDO> list(@RequestParam Map<String, Object> params) {
        List<MenuDO> menus = menuService.list(params);
        return menus;
    }

    @DeleteMapping("remove/{id}")
    R remove(@PathVariable("id") Long id){
        if(menuService.remove(id)>0){
            return R.ok();
        }
        return R.error();
    }

    @RequestMapping("/currentUserMenus")
    List<Tree<MenuDO>> currentUserMenus() {
        String id = FilterContextHandler.getUserID();
        List<Tree<MenuDO>> menus = menuService.listMenuTree(Long.parseLong(FilterContextHandler.getUserID()));
        return menus;
    }
}
