package com.aipark.order.dao;

import com.aipark.order.vo.OrderInfoVo;

import java.util.List;

/**
 * @author: zhuxuanlin
 * @description:
 * @create: 2019-01-26 17:09
 **/
public interface OrderInfoDao {

    /**
     * 查询所有订单
     *
     * @return
     */
    List<OrderInfoVo> findAll();
}
