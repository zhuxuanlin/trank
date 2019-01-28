package com.aipark.common.exception;

import lombok.Data;

/**
 * Author:      zhuxuanlin
 * Version:     1.0
 * Description: 基础异常类
 */
@Data
public class BaseException extends RuntimeException {

    private static final long serialVersionUID = 205586473341078914L;

    /**
     * 错误码
     */
    private int code;

    /**
     * 错误信息
     */
    private String message;


    public BaseException(int code, String message) {
        super();
        this.code = code;
        this.message = message;
    }
}
