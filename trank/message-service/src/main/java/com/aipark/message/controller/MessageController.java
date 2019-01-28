package com.aipark.message.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author: zhuxuanlin
 * @description: message controller
 * @create: 2019-01-26 19:52
 **/
@RestController
@RequestMapping("message")
public class MessageController {

	@GetMapping("send")
	public String sendMessage(@RequestParam("message") String message) {
		System.out.println("获取到的消息：" + message);
		return "call back message";
	}
}
