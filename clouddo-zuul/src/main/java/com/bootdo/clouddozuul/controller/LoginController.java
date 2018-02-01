package com.bootdo.clouddozuul.controller;

import com.netflix.ribbon.proxy.annotation.Http;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @version V1.0
 */
@RestController
public class LoginController {
    @GetMapping({"/",""})
    void login(HttpServletResponse response) throws IOException {
        response.sendRedirect("/clouddo/page/index.html");
    }
}
