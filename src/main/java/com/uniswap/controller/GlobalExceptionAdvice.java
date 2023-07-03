package com.uniswap.controller;

import com.uniswap.entity.vo.JsonResult;
import com.uniswap.enums.ReturnMessageEnum;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author Dominick Li
 * @description 全局异常处理类
 **/
@ControllerAdvice
@Slf4j
public class GlobalExceptionAdvice {


    @ExceptionHandler(value = Exception.class)
    @ResponseBody
    public JsonResult exceptionHandler(Exception e) {
        log.error("globale exception  msg={}", e);
        return JsonResult.failureResult();
    }

    @ResponseBody
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public JsonResult handleValidException(MethodArgumentNotValidException e) {
        return JsonResult.failureResult(ReturnMessageEnum.PARAM_IS_NULL.getCode());
    }

}



