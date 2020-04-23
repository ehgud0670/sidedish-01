package com.codesquad.sidedish1.presentation;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.Map;

@Service
public class LoginService {
    private static final Logger log = LoggerFactory.getLogger(LoginController.class);

    private final String URL = "https://github.com/login/oauth/access_token";
    @Value("${github.client_id}")
    private String clientId;
    @Value("${github.client_secret}")
    private String clientSecret;

    public AccessTokenResponseSuccess getAccessToken(String code) {
        MultiValueMap<String, String> headers = new LinkedMultiValueMap<>();
        Map<String, String> header = new HashMap<>();
        header.put("Accept", "application/json");
        headers.setAll(header);

        MultiValueMap<String, String> bodies = new LinkedMultiValueMap<>();
        Map<String, String> body = new HashMap<>();
        body.put("client_id", clientId);
        body.put("client_secret", clientSecret);
        body.put("code", code);
        bodies.setAll(body);

        HttpEntity<?> request = new HttpEntity<>(bodies,headers);
        ResponseEntity<?> response = new RestTemplate().postForEntity(URL, request, AccessTokenResponseSuccess.class);
        log.info("##### response: {}", response);
        log.info("##### response: {}", response.getBody());
        return (AccessTokenResponseSuccess) response.getBody();
    }

}
