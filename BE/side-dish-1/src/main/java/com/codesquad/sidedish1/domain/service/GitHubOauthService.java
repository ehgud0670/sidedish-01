package com.codesquad.sidedish1.domain.service;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public interface GitHubOauthService {

    void login(String code, HttpServletResponse response) throws IOException;

    void callAPI(HttpServletResponse response);

    void profile(HttpServletResponse response) throws IOException;
}
