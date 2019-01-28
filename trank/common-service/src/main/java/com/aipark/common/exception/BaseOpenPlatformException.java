package com.aipark.common.exception;

import lombok.Data;


/**
 * Author:      zhuxuanlin
 * Version:     1.0
 * Description: 消息返回
 */
@Data
public class BaseOpenPlatformException extends BaseException {

    private static final long serialVersionUID = -1478491022269711243L;

    private String status;
    private String message;

    public BaseOpenPlatformException(String status, String msg){
        super(Integer.valueOf(status),msg);
        this.status = status;
        this.message = msg;
    }
}
