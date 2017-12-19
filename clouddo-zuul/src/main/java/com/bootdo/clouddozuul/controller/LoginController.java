package com.bootdo.clouddozuul.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @version V1.0
 */
@RestController
public class LoginController {
    @GetMapping("/login")
    String login(){
        return "login";
    }
}
