package com.aipark.common.advise;

import com.aipark.common.api.ApiResponse;
import com.aipark.common.exception.BaseException;
import com.aipark.common.exception.BaseOpenPlatformException;
import com.netflix.hystrix.exception.HystrixBadRequestException;
import com.netflix.hystrix.exception.HystrixRuntimeException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

/**
 * Author:      zhuxuanlin
 * Version:     1.0
 * Description:
 */
@Slf4j
@RestControllerAdvice
public class GlobalExceptionControllerAdvice {

    @ExceptionHandler(Exception.class)
    @ResponseStatus(HttpStatus.OK)
    public ApiResponse handleException(Exception e, HttpServletRequest request, HttpServletResponse response) {

        response.setContentType(MediaType.APPLICATION_JSON_UTF8.toString());
        response.setCharacterEncoding(StandardCharsets.UTF_8.name());

        writeHeader(response);
        if (e instanceof HystrixRuntimeException) {
            HystrixRuntimeException exception = (HystrixRuntimeException) e;
            Throwable fallbackException = exception.getFallbackException();

            Throwable ex = fallbackException.getCause();
            if (ex != null) {
                e = (Exception) ex;
            }

        } else if (e instanceof HystrixBadRequestException) {
            e = (Exception) e.getCause();
        }

        handleCommon(e, request);
        // 如果是系统自定义常规异常
        if (e instanceof BaseException) {
            if (e instanceof BaseOpenPlatformException) {
                Map<String,Object> bStatus = new HashMap<>();
                bStatus.put("code",((BaseOpenPlatformException) e).getStatus());
                bStatus.put("msg", e.getMessage());
                Map<String,Object> bStatusMap =  new HashMap<>();
                bStatusMap.put("bStatus",bStatus);
                return ApiResponse.builder().code(HttpStatus.OK.value()).message(HttpStatus.OK.getReasonPhrase()).data(bStatusMap).build();
            }else{
                return ApiResponse.builder().code(((BaseException) e).getCode()).message(e.getMessage()).data(new Object()).build();
            }
        }

        return ApiResponse.builder()
                .code(HttpStatus.INTERNAL_SERVER_ERROR.value())
                .message(HttpStatus.INTERNAL_SERVER_ERROR.getReasonPhrase())
                .data(new Object()).build();

    }

    private void handleCommon(Throwable e, HttpServletRequest request) {
        if (e != null) {
            log.error("host:" + request.getRemoteHost() + ", uri:" + request.getRequestURI() + ", referrer:" + request.getHeader(HttpHeaders.REFERER), e);
        }
    }

    private void writeHeader(HttpServletResponse response) {
        response.setHeader(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE);
    }

    @ExceptionHandler(ConstraintViolationException.class)
    @ResponseStatus(HttpStatus.OK)
    public ApiResponse handleConstraintViolationException(ConstraintViolationException e, HttpServletRequest request, HttpServletResponse response) {
        writeHeader(response);
        //handleCommon(e, request);
        String                           message  = null;
        Optional<ConstraintViolation<?>> optional = e.getConstraintViolations().stream().findFirst();
        if (optional.isPresent()) {
            ConstraintViolation<?> constraintViolation = optional.get();
            message = constraintViolation.getPropertyPath() + ": " + constraintViolation.getMessage();
        }
        return ApiResponse.builder().code(HttpStatus.BAD_REQUEST.value()).message(message).data(new Object()).build();
    }

    @ExceptionHandler
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public ApiResponse handleMethodArgumentNotValidException(MethodArgumentNotValidException exs){
        BindingResult bindingResult = exs.getBindingResult();
        String message = null;
        if(bindingResult.hasErrors()){
            FieldError fieldError = bindingResult.getFieldError();
            message = fieldError.getObjectName() + "." + fieldError.getField() + ":" + fieldError.getDefaultMessage();
        }
        return ApiResponse.builder().code(HttpStatus.BAD_REQUEST.value()).message(message).data(new Object()).build();
    }

}
