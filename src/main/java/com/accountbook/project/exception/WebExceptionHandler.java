package com.accountbook.project.exception;

import org.apache.ibatis.javassist.NotFoundException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice()
public class WebExceptionHandler {
    @ExceptionHandler(NullPointerException.class)
    public String errorNPE() {
        return "error/error-npe";
    }

    @ExceptionHandler(NotFoundException.class)
    public String errorNFE() {
        return "error/error-nfe";
    }

    @ExceptionHandler(QuestionException.class)
    public String errorQSTN() {
        return "error/error-qstn";
    }
}