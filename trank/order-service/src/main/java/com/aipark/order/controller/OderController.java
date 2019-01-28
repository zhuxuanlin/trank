package com.aipark.order.controller;

import com.aipark.message.feign.MessageFeignService;
import com.aipark.order.service.OrderService;
import com.aipark.order.vo.OrderInfoVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author: zhuxuanlin
 * @description: order controller
 * @create: 2019-01-26 16:11
 **/
@RestController
@RequestMapping("order")
public class OderController {

	@Autowired
	private OrderService orderService;

	@Autowired
	private MessageFeignService messageFeignService;

	@GetMapping("hello")
	public String test() {
		return messageFeignService.sendMessage("hello feign");
	}

	@GetMapping("list")
	public List<OrderInfoVo> findAll() {
		return orderService.findAll();
	}
}
