package com.bootdo.clouddoview.controller.admin;

import com.bootdo.clouddoview.feignService.admin.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/admin/user")
@Controller
public class UserController {
    @Autowired
    RoleService roleService;

    @GetMapping("")
    String user() {
        return "admin/user/user";
    }

    @GetMapping("/add")
    String add(Model model) {
        model.addAttribute("roles", roleService.list());
        return "admin/user/add";
    }

    @GetMapping("edit")
    String edit(Model model){
        return  "admin/user/edit";
    }
}
