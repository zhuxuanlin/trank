package com.aipark.order.entity;

import lombok.Data;
import lombok.experimental.Accessors;
import lombok.extern.slf4j.Slf4j;

import java.io.Serializable;

/**
 * @author: zhuxuanlin
 * Description: OrderInfo实体
 */
@Data
@Accessors(chain = true)
public class OrderInfoEntity implements Serializable {

private static final long serialVersionUID = -9098668417024869999L;

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
