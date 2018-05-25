//package com.bootdo.clouddocommon.filter;
//
//import com.bootdo.clouddocommon.constants.CommonConstants;
//import com.bootdo.clouddocommon.context.FilterContextHandler;
//import com.bootdo.clouddocommon.dto.UserToken;
//import com.bootdo.clouddocommon.utils.JSONUtils;
//import com.bootdo.clouddocommon.utils.JwtUtils;
//import com.bootdo.clouddocommon.utils.R;
//import com.bootdo.clouddocommon.utils.StringUtils;
//
//import javax.servlet.*;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.io.PrintWriter;
//
//public class ContextFilter implements Filter {
//    @Override
//    public void init(FilterConfig filterConfig) throws ServletException {
//
//    }
//
//    @Override
//    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
//        HttpServletRequest request = (HttpServletRequest) servletRequest;
//        HttpServletResponse response = (HttpServletResponse) servletResponse;
//        response.setCharacterEncoding("utf-8");
//        response.setContentType("application/json;charset=UTF-8");
//        if (request.getRequestURI().startsWith("/test")) {
//            filterChain.doFilter(request, response);
//            return;
//        }
//        String token = request.getHeader(CommonConstants.CONTEXT_TOKEN);
//        if(StringUtils.isBlank(token)){
//            token = request.getParameter(CommonConstants.TOKEN);
//        }
//        UserToken userToken = null;
//        try {
//            userToken = JwtUtils.getInfoFromToken(token);
//        } catch (Exception e) {
//            PrintWriter printWriter = response.getWriter();
//            printWriter.write(JSONUtils.beanToJson(R.error401()));
//            return;
//        }
//        FilterContextHandler.setToken(token);
//        FilterContextHandler.setUsername(userToken.getUsername());
//        FilterContextHandler.setName(userToken.getName());
//        FilterContextHandler.setUserID(userToken.getUserId());
//        filterChain.doFilter(request, response);
//    }
//
//    @Override
//    public void destroy() {
//
//    }
//}
