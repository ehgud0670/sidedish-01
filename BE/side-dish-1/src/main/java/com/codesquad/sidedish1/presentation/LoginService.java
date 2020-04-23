package com.codesquad.sidedish1.presentation;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletResponse;
import javax.websocket.server.PathParam;

@Service
public class LoginService {
    private static final Logger log = LoggerFactory.getLogger(LoginController.class);

    private String URL = "https://github.com/login/oauth/access_token";
    @Value("${github.client_id}")
    private String clientId;
    @Value("${github.client_secret")
    private String clientSecret;

//    public AccessTokenResponseSuccess getAccessToken(@PathParam("code") String code, HttpServletResponse response) {
//
//    }

}
