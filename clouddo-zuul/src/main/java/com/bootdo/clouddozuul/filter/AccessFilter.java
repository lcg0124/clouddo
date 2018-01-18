package com.bootdo.clouddozuul.filter;

import com.bootdo.clouddozuul.feignClient.AdminService;
import com.bootdo.clouddozuul.utils.JwtUtils;
import com.bootdo.clouddozuul.vo.UserToken;
import com.netflix.zuul.ZuulFilter;
import com.netflix.zuul.context.RequestContext;
import org.apache.commons.lang.StringUtils;
import org.apache.http.HttpStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @version V1.0
 * @Author bootdo 1992lcg@163.com
 */
public class AccessFilter extends ZuulFilter {

    @Autowired
    AdminService adminService;

    private String startWith = "/clouddo/login,/clouddo/js,/clouddo/css,/admin/login";

    @Override
    public String filterType() {
        return "pre";
    }

    @Override
    public int filterOrder() {
        return 1;
    }

    @Override
    public boolean shouldFilter() {
        return true;
    }


    @Override
    public Object run() {
        RequestContext ctx = RequestContext.getCurrentContext();
        HttpServletRequest request = ctx.getRequest();
        HttpServletResponse response = ctx.getResponse();
        final String requestUri = request.getRequestURI();
        if (isStartWith(requestUri)) {
            return null;
        }
        String accessToken = getCookieValueByName(request,"token");
        if (null == accessToken ) {
            try {
                response.sendRedirect("/clouddo/login");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else {
            try {
                UserToken userToken = JwtUtils.getInfoFromToken(accessToken);
            } catch (Exception e) {
                try {
                    response.sendRedirect("/clouddo/login");
                } catch (IOException e1) {
                    e1.printStackTrace();
                }
                e.printStackTrace();
            }
        }
        ctx.addZuulRequestHeader("Authorization", accessToken);
        return null;
    }

    private void setFailedRequest(String body, int code) {
        RequestContext ctx = RequestContext.getCurrentContext();
        ctx.setResponseStatusCode(code);
        if (ctx.getResponseBody() == null) {
            ctx.setResponseBody(body);
            ctx.setSendZuulResponse(false);
        }
    }

    private boolean isStartWith(String requestUri) {
        boolean flag = false;
        for (String s : startWith.split(",")) {
            if (requestUri.startsWith(s)) {
                return true;
            }
        }
        return flag;
    }

    private String getCookieValueByName(HttpServletRequest request, String name) {
        Cookie[] cookies = request.getCookies();
        if(null==cookies){
            return null;
        }
        for (Cookie cookie : cookies) {
            if (name.equals(cookie.getName())) {
                return cookie.getValue();
            }
        }
        return null;
    }


}
