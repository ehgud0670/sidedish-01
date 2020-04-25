package com.codesquad.sidedish1.domain.value;

import com.codesquad.sidedish1.domain.entity.User;

public class ResponseUserDTO {

    private User user;

    public ResponseUserDTO(User user) {
        this.user = user;
    }

    public User getUser() {
        return user;
    }
}
