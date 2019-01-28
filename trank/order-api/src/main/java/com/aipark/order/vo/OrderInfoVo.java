package com.aipark.order.vo;

import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * @author: zhuxuanlin
 * Description: OrderInfo实体
 */
@Data
@Accessors(chain = true)
public class OrderInfoVo implements Serializable {

private static final long serialVersionUID = 4970206865266586002L;

/**
 *
 */
private Long id;

/**
 * 订单号
 */
private String orderNo;

/**
 * 运单号
 */
private String expressNo;

/**
 * 订单状态 1-已接单 2-已签收
 */
private Integer status;

/**
 * 收件人
 */
private String receiverName;

/**
 * 收件人手机号
 */
private String receiverTel;

}
