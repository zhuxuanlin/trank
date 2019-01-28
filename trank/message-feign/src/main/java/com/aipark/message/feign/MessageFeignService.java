package com.aipark.message.feign;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @author: zhuxuanlin
 * @description:
 * @create: 2019-01-26 19:49
 **/
@FeignClient(value = "message-center")
public interface MessageFeignService {

	/**
	 * 发送消息
	 * @param message
	 * @return
	 */
	@RequestMapping(value = "message/send", method = RequestMethod.GET)
	String sendMessage(@RequestParam("message") String message);
}
