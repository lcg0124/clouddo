package com.bootdo.clouddoadmin.service;

import org.springframework.stereotype.Service;

/**
 * @author bootdo 1992lcg@163.com
 */
@Service
public interface TokenService {
    /**
     * 根据用户id生成token持久化
     */
    String createToken(Long userId);

    Long getUserIdByToken(String token);

    boolean removeToken(String token);
}
