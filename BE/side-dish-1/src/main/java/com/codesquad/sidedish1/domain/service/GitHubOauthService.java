package com.codesquad.sidedish1.domain.service;

import com.codesquad.sidedish1.domain.value.ResponseUserDTO;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public interface GitHubOauthService {

    void login(String code, HttpServletResponse response) throws IOException;

    void callAPI(HttpServletResponse response);

    ResponseUserDTO profile(HttpServletResponse response);
}
