package com.bootdo.clouddoadmin.dao;

import com.bootdo.clouddoadmin.domain.TokenDO;
import org.apache.ibatis.annotations.*;

/**
 * @author bootdo 1992lcg@163.com
 * @version V1.0
 */
@Mapper
public interface TokenDao {
    /**
     * 根据用户id保存token
     * @param tokenDO
     * @return
     */
    @Insert("insert into  sys_user_token (user_id,token,expire_time,update_time) values (#{userId},#{token},#{expireTime},#{updateTime})")
    int save(TokenDO  tokenDO);

    @Select("select * from sys_user_token where token =#{token}")
    TokenDO getToken(String token);

    @Delete("delete from sys_user_token where token=#{token}")
    boolean removeToken(String token);

    @Select("select * from sys_user_token where user_id =#{userId}")
    TokenDO getTokenByUserId(Long userId);

    @Update("update sys_user_token set token=#{token},expire_time=#{expireTime},update_time=#{updateTime} where user_id=#{userId}")
    int update(TokenDO  tokenDO);
}
