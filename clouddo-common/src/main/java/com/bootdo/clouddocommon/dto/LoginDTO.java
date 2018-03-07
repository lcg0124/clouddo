package com.bootdo.clouddocommon.dto;

import javax.validation.constraints.NotNull;

public class LoginDTO {
    @NotNull
    private String username;
    @NotNull
    private String pwd;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String password) {
        this.pwd = password;
    }
}
