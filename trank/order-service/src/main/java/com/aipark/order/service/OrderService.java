package com.aipark.order.service;

import com.aipark.order.vo.OrderInfoVo;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author: zhuxuanlin
 * @description:
 * @create: 2019-01-26 17:07
 **/
public interface OrderService {

    /**
     * @return
     */
    List<OrderInfoVo> findAll();
}
