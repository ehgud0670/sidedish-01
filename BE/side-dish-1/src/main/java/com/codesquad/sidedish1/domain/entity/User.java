package com.codesquad.sidedish1.domain.entity;

import org.springframework.data.annotation.Id;

public class User {

    @Id
    private Long id;
    private String githubId;
    private String login;
    private String name;

    public User(String githubId, String login, String name) {
        this.githubId = githubId;
        this.login = login;
        this.name = name;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
