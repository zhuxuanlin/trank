package com.aipark.common.configuration;

import com.aipark.common.api.ApiResponse;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.alibaba.fastjson.support.config.FastJsonConfig;
import com.alibaba.fastjson.support.spring.FastJsonHttpMessageConverter;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;
import feign.Util;
import feign.codec.Decoder;
import org.springframework.boot.autoconfigure.http.HttpMessageConverters;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.MediaType;
import org.springframework.http.converter.StringHttpMessageConverter;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

/**
 * Author:      zhuxuanlin
 * Version:     1.0
 * Description:
 */
@Configuration
public class CustomConfiguration {

    @Bean
    public Decoder decoder() {
        return (response, type) -> {
            String body = Util.toString(response.body().asReader());
            ObjectMapper mapper = new ObjectMapper();
            JavaType javaType = mapper.getTypeFactory()
                    .constructParametricType(ApiResponse.class, mapper.getTypeFactory().constructType(type));
            ApiResponse<?> apiResponse = mapper.readValue(body, javaType);
            return apiResponse.getData();
        };
    }

    @Bean
    public HttpMessageConverters fastjsonHttpMessageConverter() {

        FastJsonHttpMessageConverter fastConverter  = new FastJsonHttpMessageConverter();

        List<MediaType> supportedMediaTypes = new ArrayList<>();
        supportedMediaTypes.add(MediaType.TEXT_HTML);
        supportedMediaTypes.add(MediaType.APPLICATION_JSON_UTF8);

        fastConverter.setSupportedMediaTypes(supportedMediaTypes);
        FastJsonConfig fastJsonConfig = new FastJsonConfig();
        fastJsonConfig.setSerializerFeatures(SerializerFeature.PrettyFormat);
        fastJsonConfig.setSerializerFeatures(SerializerFeature.DisableCircularReferenceDetect);
        fastJsonConfig.setSerializerFeatures(SerializerFeature.WriteMapNullValue);
        fastJsonConfig.setSerializerFeatures(SerializerFeature.WriteNullStringAsEmpty);

        fastConverter.setFastJsonConfig(fastJsonConfig);

        StringHttpMessageConverter stringHttpMessageConverter = new StringHttpMessageConverter(StandardCharsets.UTF_8);

        return new HttpMessageConverters(stringHttpMessageConverter, fastConverter);
    }

}