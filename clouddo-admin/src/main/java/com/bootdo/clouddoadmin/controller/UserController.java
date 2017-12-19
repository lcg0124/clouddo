package com.bootdo.clouddoadmin.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @version V1.0
 */
@RestController
public class UserController {
    @GetMapping
    String index(){
        return "user";
    }
}
