package com.codesquad.sidedish1.presentation;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.HttpServerErrorException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import javax.servlet.http.HttpServletResponse;
import javax.websocket.server.PathParam;
import java.io.IOException;
import java.util.*;

@RestController
public class LoginController {
    private static final Logger log = LoggerFactory.getLogger(LoginController.class);
    private LoginService loginService;

    public LoginController(LoginService loginService) {
        this.loginService = loginService;
    }

    @Autowired
    TokenRepository tokenRepository;

    @Autowired
    UserRepository userRepository;

    @GetMapping("/githublogin")
    public String githubLogin(@PathParam("code") String code, HttpServletResponse response) throws IOException {
        log.info("##### code: {}", code);
        AccessTokenResponseSuccess accessTokenResponseSuccess = loginService.getAccessToken(code);
        response.setHeader("Authorization", accessTokenResponseSuccess.getAuthorization());
        response.sendRedirect("http://localhost:8080/GetGithubUserInfo");

        Token token = new Token(accessTokenResponseSuccess.getTokenType(), accessTokenResponseSuccess.getAccessToken());
        tokenRepository.save(token);
        return "OK";
    }

    @GetMapping("/GetGithubUserInfo")
    public String callAPI(HttpServletResponse response) throws NullPointerException{
        Token token = tokenRepository.findById(1L).orElseThrow(NoSuchElementException::new);
        String jsonInString = "";

        try {
            RestTemplate restTemplate = new RestTemplate();

            HttpHeaders header = new HttpHeaders();
            HttpEntity<?> entity = new HttpEntity<>(header);

            String url = "https://api.github.com/user";

            UriComponents uri = UriComponentsBuilder.fromHttpUrl(url + "?access_token=" + token.getToken()).build();

            // 이 한줄의 코드로 API를 호출해 MAP 타입으로 전달 받는다
            ResponseEntity<Map> resultMap = restTemplate.exchange(uri.toString(), HttpMethod.GET, entity, Map.class);

            User user = new User(
                    resultMap.getBody().get("id").toString(),
                    resultMap.getBody().get("login").toString(),
                    resultMap.getBody().get("name").toString());
            userRepository.save(user);

            // 데이터를 제대로 전달 받았느지 확인 (String 형태로 파싱)
//            ObjectMapper mapper = new ObjectMapper();
//            jsonInString = mapper.writeValueAsString(resultMap.getBody());
            response.sendRedirect("http://localhost:8080/final");

        } catch (HttpClientErrorException | HttpServerErrorException e) {
            log.info("##### HttpErrorException: {}", e.getMessage());
        } catch (Exception e) {
            log.info("##### Exception: {}", e.getMessage());
        }

        return jsonInString;
    }

    @GetMapping("/final")
    public User userData() {
        return userRepository.findById(1L).orElseThrow(NoSuchElementException::new);
    }

}
