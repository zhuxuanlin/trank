package com.aipark.order.service.impl;

import com.aipark.order.dao.OrderInfoDao;
import com.aipark.order.service.OrderService;
import com.aipark.order.vo.OrderInfoVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author: zhuxuanlin
 * @description:
 * @create: 2019-01-26 17:08
 **/
@Service
public class OrderServiceImpl implements OrderService {

@Autowired
private OrderInfoDao orderInfoDao;

@Override
public List<OrderInfoVo> findAll() {
	return orderInfoDao.findAll();
}
}
