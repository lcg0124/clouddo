package com.bootdo.clouddoadmin.config;

import com.bootdo.clouddoadmin.dao.TokenPrinciple;
import com.bootdo.clouddocommon.utils.JwtUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.messaging.Message;
import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.config.ChannelRegistration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.messaging.simp.stomp.StompCommand;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.messaging.support.ChannelInterceptorAdapter;
import org.springframework.messaging.support.MessageHeaderAccessor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.csrf.CsrfToken;
import org.springframework.security.web.csrf.DefaultCsrfToken;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.AbstractWebSocketMessageBrokerConfigurer;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.server.HandshakeInterceptor;
import org.springframework.web.socket.server.support.DefaultHandshakeHandler;

import java.security.Principal;
import java.util.Map;

@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig extends AbstractWebSocketMessageBrokerConfigurer {

    //    @Override
//    public void registerStompEndpoints(StompEndpointRegistry registry) { //endPoint 注册协议节点,并映射指定的URl
//        registry.addEndpoint("/endpointChat").addInterceptors(new HandshakeInterceptor() {
//            /**
//             * websocket握手
//             */
//            @Override
//            public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler, Map<String, Object> attributes) throws Exception {
//                ServletServerHttpRequest req = (ServletServerHttpRequest) request;
//                //获取token认证
//               String token = req.getServletRequest().getParameter("passcode");
//              System.out.println(token);
//                //解析token获取用户信息
//                Principal user = parseToken("aaa");
////                if(token == null){   //如果token认证失败user为null，返回false拒绝握手
////                    return false;
////                }
//                //保存认证用户
//                attributes.put("user", user);
//                return true;
//            }
//
//            @Override
//            public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler, Exception exception) {
//
//            }
//        }).setHandshakeHandler(new DefaultHandshakeHandler() {
//            @Override
//            protected Principal determineUser(ServerHttpRequest request, WebSocketHandler wsHandler, Map<String, Object> attributes) {
//                //设置认证用户
//                Principal current = (Principal) attributes.get("user");
//                System.out.println(null==current);
//                return current;
//            }
//        })
//
//                .setAllowedOrigins("*") //允许跨域
//                .withSockJS();  //指定使用SockJS协议
//    }
//注册STOMP协议节点并映射url
    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        //添加连接节点
        registry.addEndpoint("/endpoint").addInterceptors(new HandshakeInterceptor() {
            /**
             * websocket握手
             */
            @Override
            public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler, Map<String, Object> attributes) throws Exception {
                ServletServerHttpRequest req = (ServletServerHttpRequest) request;
                //获取token认证
                String token = req.getServletRequest().getParameter("passcode");
                //解析token获取用户信息
                Principal user = parseToken("aaa");
                if (user == null) {   //如果token认证失败user为null，返回false拒绝握手
                    return false;
                }
                //保存认证用户
                attributes.put("user", user);
                return true;
            }

            @Override
            public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler, Exception exception) {

            }
        }).setHandshakeHandler(new DefaultHandshakeHandler() {
            @Override
            protected Principal determineUser(ServerHttpRequest request, WebSocketHandler wsHandler, Map<String, Object> attributes) {
                //设置认证用户
                return (Principal) attributes.get("user");
            }
        })

                .setAllowedOrigins("*") //允许跨域
                .withSockJS();  //指定使用SockJS协议
    }

    Principal parseToken(String token) {
        return new TokenPrinciple(token);
    }

    @Override
    public void configureMessageBroker(MessageBrokerRegistry registry) {//配置消息代理(message broker)
        //点对点式增加一个/queue 消息代理
        registry.enableSimpleBroker("/queue", "/topic");

    }
}