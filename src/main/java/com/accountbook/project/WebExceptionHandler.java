package com.accountbook.project;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice()
public class WebExceptionHandler {
    @ExceptionHandler(NullPointerException.class)
    public String errorNPE() {
        return "error/error";
    }
}