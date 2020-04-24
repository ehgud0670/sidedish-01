package com.codesquad.sidedish1.presentation;

import com.codesquad.sidedish1.domain.service.LoginService;
import com.codesquad.sidedish1.domain.value.ResponseUserDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import javax.websocket.server.PathParam;
import java.io.IOException;

@RestController
public class LoginController {
    private static final Logger log = LoggerFactory.getLogger(LoginController.class);
    private final LoginService loginService;

    public LoginController(LoginService loginService) {
        this.loginService = loginService;
    }

    @GetMapping("/login")
    public void githubLogin(@PathParam("code") @Valid String code, HttpServletResponse response) throws IOException {
        log.info("##### githubLogin: {}", code);
        loginService.githubLogin(code, response);
    }

    @GetMapping("/callAPI")
    public void callAPI(HttpServletResponse response) throws NullPointerException {
        loginService.callAPI(response);
    }

    @GetMapping("/logined")
    public ResponseUserDTO userData(HttpServletResponse response) throws IOException {
        return loginService.userData(response);
    }

}
