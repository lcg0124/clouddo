package com.bootdo.clouddoadmin.service.impl;

import com.bootdo.clouddoadmin.dao.TokenDao;
import com.bootdo.clouddoadmin.domain.TokenDO;
import com.bootdo.clouddoadmin.service.TokenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.UUID;

/**
 * @author bootdo 1992lcg@163.com
 * @version V1.0
 */
@Service
public class TokenServiceImpl implements TokenService {
    @Autowired
    TokenDao tokenDao;
    //过期时间，单位s
    private final static int EXPIRE = 60*30;
    @Override
    public String createToken(Long userId) {
        //当前时间
        Date now = new Date();
        //过期时间
        Date expireTime = new Date(now.getTime()+EXPIRE*1000);
        TokenDO tokenDO = new TokenDO();
        tokenDO.setUserId(userId);
        tokenDO.setUpdateTime(now);
        tokenDO.setToken(UUID.randomUUID().toString());
        tokenDO.setExpireTime(expireTime);
        if(tokenDao.getTokenByUserId(userId)!=null){
            tokenDao.update(tokenDO);
        }else{
            tokenDao.save(tokenDO);
        }

        return tokenDO.getToken();
    }

    @Override
    public Long getUserIdByToken(String token) {
        TokenDO tokenDO = tokenDao.getToken(token);
        if (tokenDO==null){
            return -1L;
        }else {
            if (tokenDO.getExpireTime().getTime()<System.currentTimeMillis()){
                tokenDao.removeToken(token);
                return -1L;
            }
            return tokenDO.getUserId();
        }
    }

    @Override
    public boolean removeToken(String token) {
        return tokenDao.removeToken(token);
    }
}
