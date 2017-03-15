package com.ym.er.model;

/**
 * Created by YM on 3/9/2017.
 * 结果封装
 */
public class Result<T> {

    private int status;
    private String msg;
    private T data;

    public Result(){}

    private Result(int status, String msg) {
        this.status = status;
        this.msg = msg;
    }

    private Result(int status, String msg, T data) {
        this.status = status;
        this.msg = msg;
        this.data = data;
    }

    public static <T> Result<T> build(int status, String msg, T data) {
        return new Result<T>(status, msg, data);
    }

    public static <T> Result<T> build(int status, String msg) {
        return new Result<T>(status, msg);
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
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
