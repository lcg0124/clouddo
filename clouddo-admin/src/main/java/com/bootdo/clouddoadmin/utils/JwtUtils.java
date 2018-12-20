//package com.bootdo.clouddoadmin.utils;
//
//import com.bootdo.clouddoadmin.constants.constants;
//import com.bootdo.clouddoadmin.vo.UserToken;
//import com.netflix.discovery.CommonConstants;
//import io.jsonwebtoken.Claims;
//import io.jsonwebtoken.Jws;
//import io.jsonwebtoken.Jwts;
//import io.jsonwebtoken.SignatureAlgorithm;
//
//import java.util.Date;
//
///**
// * @author bootdo 1992lcg@163.com
// * @version V1.0
// */
//public class JwtUtils {
//    public static String generateToken(UserToken userToken, int expire) throws Exception {
//        String token = Jwts.builder()
//                .setSubject(userToken.getUsername())
//                .claim(constants.USER_TOKEN_ID, userToken.getUserId())
//                .claim(constants.USER_TOKEN_NAME, userToken.getName())
//                .setExpiration(new Date(System.currentTimeMillis()+expire))
//                .signWith(SignatureAlgorithm.HS256, constants.JWT_PRIVATE_KEY)
//                .compact();
//        return token;
//    }
//
//
//    public static UserToken getInfoFromToken(String token) throws Exception {
//        Claims claims = Jwts.parser()
//                .setSigningKey(constants.JWT_PRIVATE_KEY).parseClaimsJws(token)
//                .getBody();
//        return new UserToken(claims.getSubject(), ((Integer)claims.get(constants.USER_TOKEN_ID)).longValue() ,claims.get(constants.USER_TOKEN_NAME).toString());
//    }
//}
