package com.codesquad.sidedish1.presentation;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ApiResponseMessage {
    private String status;
    private Object data;

    public ApiResponseMessage(String status, Object data) {
        this.status = status;
        this.data = data;
    }
}

