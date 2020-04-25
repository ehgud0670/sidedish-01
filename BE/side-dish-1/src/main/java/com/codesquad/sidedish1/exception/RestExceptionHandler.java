package com.codesquad.sidedish1.exception;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.NoSuchElementException;

@RestControllerAdvice
public class RestExceptionHandler {

    @ExceptionHandler(Exception.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public ErrorResponse handleException(Exception e) {
        return ErrorResponse.ok(ErrorMessages.ERROR, e.getMessage());
    }

    // @Valid 혹은 정의한 Validation을 어길 경우 발생
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ErrorResponse handleMethodArgumentNotValidException(MethodArgumentNotValidException e) {
        return ErrorResponse.ok(ErrorMessages.METHOD_ARGUMENT_NOT_VALID_EXCEPTION, e.getMessage());
    }

    // 지원하지 않은 HTTP Method 호출할 경우 발생 (ex : POST)
    @ExceptionHandler(HttpRequestMethodNotSupportedException.class)
    public ErrorResponse handleHttpRequestMethodNotSupportedException(HttpRequestMethodNotSupportedException e) {
        return ErrorResponse.ok(ErrorMessages.HTPP_REQUEST_METHOD_NOT_SUPPORTED_EXCEPTION, e.getMessage());
    }
}
