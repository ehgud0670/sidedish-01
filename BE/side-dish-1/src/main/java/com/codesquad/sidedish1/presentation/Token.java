package com.codesquad.sidedish1.presentation;

import org.springframework.data.annotation.Id;

public class Token {

    @Id
    private Long id;

    private String token;

    public Token(String token) {
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
}
