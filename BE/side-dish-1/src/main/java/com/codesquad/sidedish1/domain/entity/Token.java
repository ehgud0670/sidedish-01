package com.codesquad.sidedish1.domain.entity;

import org.springframework.data.annotation.Id;

public class Token {

    @Id
    private Long id;

    private String tokenType;

    private String token;

    public Token(Long id, String tokenType, String token) {
        this.id = id;
        this.tokenType = tokenType;
        this.token = token;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    @Override
    public String toString() {
        return "Token{" +
                "id=" + id +
                ", tokenType='" + tokenType + '\'' +
                ", token='" + token + '\'' +
                '}';
    }
}
