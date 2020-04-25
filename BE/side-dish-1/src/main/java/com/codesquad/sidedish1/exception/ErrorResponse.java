package com.codesquad.sidedish1.exception;

public class ErrorResponse {
    private String message;
    private String errorTrace;

    public ErrorResponse(String message, String errorTrace) {
        this.message = message;
        this.errorTrace = errorTrace;
    }

    public static ErrorResponse ok(String message, String errorTrace) {
        return new ErrorResponse(message, errorTrace);
    }

    public String getMessage() {
        return message;
    }

    public String getErrorTrace() {
        return errorTrace;
    }
}
