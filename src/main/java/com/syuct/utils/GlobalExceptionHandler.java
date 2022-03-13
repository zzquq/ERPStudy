package com.syuct.utils;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.syuct.exceptions.ParamsException;
import com.syuct.model.RespBean;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.session.SessionAuthenticationException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.naming.AuthenticationException;

/***
 * 全局controller异常处理
 * 只能用来处理Controller层捕获到的异常
 */
@ControllerAdvice
public class GlobalExceptionHandler {


    @ExceptionHandler(ParamsException.class)
    @ResponseBody
    public RespBean paramsExceptonHandler(ParamsException e) {
        System.out.println("ParamsException");
        return RespBean.err(e.getMsg());
    }

    @ExceptionHandler(JsonProcessingException.class)
    @ResponseBody
    public RespBean jsonProcessingExceptionHandler(JsonProcessingException e) {
        System.out.println("JsonProcessingException");
        return RespBean.err(e.getMessage());
    }

    @ExceptionHandler(Exception.class)
    @ResponseBody
    public RespBean ExceptonHandler(Exception e) {
        System.out.println("Exception异常处理");
        return RespBean.err(e.getMessage());
    }
}
