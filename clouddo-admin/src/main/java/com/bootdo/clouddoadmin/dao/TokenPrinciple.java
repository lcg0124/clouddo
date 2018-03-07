package com.bootdo.clouddoadmin.dao;

import java.security.Principal;

public class TokenPrinciple implements Principal {
    private String name;

    public TokenPrinciple(String name) {
        setName(name);
    }

    @Override
    public String getName() {
        return null;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "TokenPrinciple{" +
                "name='" + name + '\'' +
                '}';
    }
}
