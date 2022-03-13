package com.syuct.mapper;

import com.syuct.pojo.vo.OrderVo;
import org.springframework.stereotype.Repository;

import java.math.BigInteger;
import java.util.List;

/**
 * @Author Zsz
 * @Date 2022/3/7 15:08
 * @Version 1.0
 **/
@Repository
public interface OutMapper {
    int getOutOrderCountByPage();

    List<OrderVo> getOutOderInfoByPage(int page, int limit);

    int getOutOrderCountByParams(BigInteger id, Integer origin);

    List<OrderVo> getOutOderInfoByParams(BigInteger id, Integer origin, int page, int limit);

    int getOrderStatusById(BigInteger id);

    void verifyOrderById(BigInteger id);

    int getSaleCountByPage();

    List<OrderVo> getSaleInfoByPage(int page, int limit);

    int getSaleCountByParams(BigInteger id, Integer origin);

    List<OrderVo> getSaleInfoByParams(BigInteger id, Integer origin, int page, int limit);

    void completeOrderById(BigInteger id);

    int getReturnOutOrderCountByPage();

    List<OrderVo> getReturnInOderInfoByPage(int page, int limit);

    int getReturnOutOrderCountByParams(BigInteger id, Integer origin);

    List<OrderVo> getReturnOutOderInfoByParams(BigInteger id, Integer origin, int page, int limit);

    void verifyReturnOutOrder(BigInteger id);
}
