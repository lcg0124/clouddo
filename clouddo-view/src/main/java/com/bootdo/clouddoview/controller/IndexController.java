package com.bootdo.clouddoview.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author bootdo 1992lcg@163.com
 * @version V1.0
 */
@RestController
public class IndexController {
    @RequestMapping("/index")
    ModelAndView index() {
        return new ModelAndView("index_v1");
    }

    @RequestMapping("/login")
    ModelAndView login() {
        return new ModelAndView("login");
    }

    @GetMapping("/main")
    ModelAndView main(){
        return new ModelAndView("main");
    }
}
