package com.uniswap.entity.vo;

import com.fasterxml.jackson.annotation.JsonInclude;
import org.apache.commons.lang.StringUtils;
import org.springframework.http.HttpStatus;

import java.io.Serializable;

/**
 * @author Dominick Li
 * @CreateTime 2021/10/9 14:05
 * @description 返回数据封装
 **/
public class JsonResult<T> implements Serializable {

    /**
     * 成功标识 200成功，其它异常
     */
    private int code = 200;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String msg;

    /**
     * 提示信息
     */
    private static String errorMsg = "error";

    /**
     * 数据
     */
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private T data;

    private static final long serialVersionUID = -7268040542410707954L;

    public JsonResult() {
    }

    public JsonResult(int code) {
        this.setCode(code);
    }

    public JsonResult(int code, String msg) {
        this(code);
        this.setMsg(msg);
    }

    public JsonResult(int code, T data) {
        this(code);
        this.setData(data);
    }

    public static JsonResult successResult() {
        return new JsonResult(HttpStatus.OK.value());
    }

    public static <T> JsonResult<T> successResult(T obj) {
        return new JsonResult(HttpStatus.OK.value(), obj);
    }


    public static <T> JsonResult<T> successResult(String msg, T obj) {
        return new JsonResult(HttpStatus.OK.value(), obj);
    }


    public static JsonResult failureResult() {
        return new JsonResult(HttpStatus.INTERNAL_SERVER_ERROR.value(), errorMsg);
    }

    public static JsonResult failureResult(Integer code, String msg) {
        return new JsonResult(code, defaultMsg(msg));
    }

    public static JsonResult failureResult(String msg) {
        return new JsonResult(HttpStatus.INTERNAL_SERVER_ERROR.value(), defaultMsg(msg));
    }

    protected static String defaultMsg(String msg) {
        return StringUtils.isNotEmpty(msg) ? msg : errorMsg;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }


}
