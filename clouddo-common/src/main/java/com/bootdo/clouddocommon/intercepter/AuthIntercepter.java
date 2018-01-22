package com.bootdo.clouddocommon.intercepter;

import com.bootdo.clouddocommon.Constants.CommonConstants;
import com.bootdo.clouddocommon.context.FilterContextHandler;
import com.bootdo.clouddocommon.dto.UserToken;
import com.bootdo.clouddocommon.utils.JwtUtils;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AuthIntercepter extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HandlerMethod handlerMethod = (HandlerMethod) handler;
        String token = request.getHeader(CommonConstants.CONTEXT_TOKEN);
        UserToken userToken = JwtUtils.getInfoFromToken(token);
        FilterContextHandler.setToken(token);
        FilterContextHandler.setUsername(userToken.getUsername());
        FilterContextHandler.setName(userToken.getName());
        FilterContextHandler.setUserID(userToken.getUserId());
        return super.preHandle(request, response, handler);
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        FilterContextHandler.remove();
        super.afterCompletion(request, response, handler, ex);
    }
}
