package com.bootdo.clouddoadmin.controller;

import com.bootdo.clouddoadmin.domain.TokenDO;
import com.bootdo.clouddoadmin.domain.UserDO;
import com.bootdo.clouddoadmin.service.TokenService;
import com.bootdo.clouddoadmin.service.UserService;
import com.bootdo.clouddoadmin.utils.MD5Utils;
import com.bootdo.clouddoadmin.utils.R;
import com.bootdo.clouddocommon.dto.UserToken;
import com.bootdo.clouddocommon.utils.JwtUtils;
import com.sun.org.apache.xpath.internal.SourceTree;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * @author bootdo 1992lcg@163.com
 * @version V1.0
 */
@RestController
public class LoginController {
    @Autowired
    UserService userService;
    @Autowired
    TokenService tokenService;

    @PostMapping("/login")
    R login(String username, String password, HttpServletRequest request, HttpServletResponse response) {
        password = MD5Utils.encrypt(username, password);
        Map<String, Object> param = new HashMap<>();
        param.put("username", username);
        UserDO userDO = userService.list(param).get(0);
        if (null == userDO || !userDO.getPassword().equals(password)) {
            return R.error("用户或密码错误");
        }
        UserToken userToken = new UserToken(userDO.getUsername(), userDO.getUserId().toString(), userDO.getName());
        String token="";
        try {
            token = JwtUtils.generateToken(userToken, 30*60*1000);
        } catch (Exception e) {
            e.printStackTrace();
        }
        // String token = tokenService.createToken(userDO.getUserId());
        return R.ok("登录成功").put("token", token);
    }

//    @RequestMapping("/checkToken")
//    boolean getToken(String token) {
//        return tokenService.checkToken(token);
//    }

    @RequestMapping("/logout")
    R logout(HttpServletRequest request, HttpServletResponse response) {
        String token = request.getHeader("Authorization");
        tokenService.removeToken(token);
        return R.ok();

    }

    private String removeCookie(HttpServletRequest request, String name) {
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {
            if (name.equals(cookie.getName())) {
                cookie.setMaxAge(0);
            }
        }
        return null;
    }

    private String getCookieValueByName(HttpServletRequest request, String name) {
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {
            if (name.equals(cookie.getName())) {
                return cookie.getValue();
            }
        }
        return null;
    }
}
