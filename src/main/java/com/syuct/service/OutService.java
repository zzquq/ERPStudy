package com.syuct.service;

import com.syuct.pojo.vo.OrderVo;
import org.springframework.security.core.Authentication;

import java.math.BigInteger;
import java.util.List;
import java.util.Map;

/**
 * @Author Zsz
 * @Date 2022/3/7 15:07
 * @Version 1.0
 **/

public interface OutService {
    Map<String, Object> getOutOrderInfoByPage(int page, int limit);

    Map<String, Object> getOutOrderInfoByParams(String sertchParams, int page, int limit);

    int verifyOrderById(BigInteger id);

    void getOrderStatusById(BigInteger id);

    int addOrder(OrderVo orderVo);

    Map<String, Object> getSaleInfoByPage(int page, int limit);

    Map<String, Object> getSaleInfoByParams(String sertchParams, int page, int limit);

    void completeOrderById(BigInteger id, Authentication authentication);

    Map<String, Object> getReturnOutOrderInfoByPage(int page, int limit);

    Map<String, Object> getReturnOutOrderInfoByParams(String sertchParams, int page, int limit);

    int addReturnOutOrder(OrderVo orderVo);

    void delAllReturnOutOrder(List<OrderVo> orderVos);

    void getReturnOutOrderStatusById(BigInteger id);

    void verifyReturnOutOrder(BigInteger id, Authentication authentication);
}
