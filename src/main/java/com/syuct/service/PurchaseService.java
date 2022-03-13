package com.syuct.service;

import com.syuct.pojo.vo.OrderLIstVo;
import com.syuct.pojo.vo.OrderVo;
import org.springframework.security.core.Authentication;

import java.math.BigInteger;
import java.util.List;
import java.util.Map;

/**
 * @Author Zsz
 * @Date 2022/2/23 11:43
 * @Version 1.0
 **/
public interface PurchaseService {
    Map<String, Object> getOrderInfoByPage(int page, int limit);

    Map<String, Object> getOrderListInfo(BigInteger listId);

    BigInteger getOrderListIdByOrderId(BigInteger id);

    int verifyOrderById(BigInteger id);

    int addOrder(OrderVo orderVo);

    Map<String, Object> getOrderListInfoByPage(BigInteger orderId, int page, int limit);

    OrderLIstVo getOrderListInfoById(int id);

    int editOrderListItem(OrderLIstVo orderLIstVo);

    void getOrderStatusById(BigInteger id);

    void getReturnInOrderStatusById(BigInteger id);

    void delAllOrder(List<OrderVo> orderVos);

    Map<String, Object> getOrderInfoByParams(String sertchParams, int page, int limit);

    Map<String, Object> getEnterInfoByPage(int page, int limit);

    Map<String, Object> getEnterInfoByParams(String sertchParams, int page, int limit);

    void completeOrderById(BigInteger id, Authentication authentication);

    int addReturnInOrder(OrderVo orderVo);

    Map<String, Object> getReturnInOrderInfoByPage(int page, int limit);

    Map<String, Object> getReturnInOrderInfoByParams(String sertchParams, int page, int limit);

    int editReturnInOrderListItem(OrderLIstVo orderLIstVo);

    void verifyReturnInOrder(BigInteger id, Authentication authentication);

    void delAllReturnInOrder(List<OrderVo> orderVos);

}
