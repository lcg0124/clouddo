package com.bootdo.clouddozuul.filter;

import com.bootdo.clouddocommon.Constants.CommonConstants;
import com.bootdo.clouddocommon.dto.UserToken;
import com.bootdo.clouddocommon.utils.JwtUtils;
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


    private String ignorePath = "/public/login,/login,/js/,/css/,/img/,/fonts/";

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
        String accessToken = getCookieValueByName(request, "token");
        try {
            if (null == accessToken) {
                response.sendRedirect("/clouddo/public/login.html");
            } else {
                UserToken userToken = JwtUtils.getInfoFromToken(accessToken);
            }
        } catch (Exception e) {
            try {
                response.sendRedirect("/clouddo/public/login.html");
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        }
        ctx.addZuulRequestHeader(CommonConstants.CONTEXT_TOKEN, accessToken);
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
        requestUri =  requestUri.substring(requestUri.indexOf("/", 1));
        boolean flag = false;
        for (String s : ignorePath.split(",")) {

            if (requestUri.startsWith(s)) {
                return true;
            }
        }
        return flag;
    }

    private String getCookieValueByName(HttpServletRequest request, String name) {
        Cookie[] cookies = request.getCookies();
        if (null == cookies) {
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
