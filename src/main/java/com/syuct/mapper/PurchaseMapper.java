package com.syuct.mapper;

import com.syuct.pojo.*;
import com.syuct.pojo.vo.OrderLIstVo;
import com.syuct.pojo.vo.OrderVo;
import org.springframework.stereotype.Repository;

import java.math.BigInteger;
import java.util.List;

/**
 * @Author Zsz
 * @Date 2022/2/23 11:45
 * @Version 1.0
 **/
@Repository
public interface PurchaseMapper {
    int getInOrderCountByPage();

    List<OrderVo> getInOderInfoByPage(int page, int limit);

    int getOrderListInfoCount(BigInteger listId);

    List<OrderLIstVo> getOrderListInfoById(BigInteger listId);

    BigInteger getOrderListIdByOrderId(BigInteger id);

    int getOrderStatusById(BigInteger id);

    void verifyOrderById(BigInteger id);

    int addOrder(Order order);

    void addOrderList(BigInteger orderId, int goodsId);

    OrderLIstVo getOrderListIdById(int id);

    int editOrderListItem(OrderList orderList);

    void delOrderById(BigInteger id);

    void delOrderListByOrderId(BigInteger list);

    int getInOrderCountByParams(BigInteger id, Integer origin);

    List<OrderVo> getInOderInfoByParams(BigInteger id, Integer origin, int page, int limit);

    int getEnterCountByPage();

    List<OrderVo> getEnterInfoByPage(int page, int limit);

    int getEnterCountByParams(BigInteger id, Integer origin);

    List<OrderVo> getEnterInfoByParams(BigInteger id, Integer origin, int page, int limit);

    OrderVo getOrderInfoById(BigInteger id);

    Order getOrderById(BigInteger id);

    List<OrderList> getOrderListById(BigInteger list);

    void addOrderLog(OrderLog orderLog);

    StoreInventory getStoreInventoryByGSId(int goodsId, int storeId);

    void addStoreInventory(StoreInventory storeInventory);

    void updStoreInventory(int goodsId, int storeId, int inventory);

    void addStoreLog(StoreLog storeLog);

    void completeOrderById(BigInteger id);

    int getReturnInOrderCountByPage();

    List<OrderVo> getReturnInOderInfoByPage(int page, int limit);

    int getReturnInOrderCountByParams(BigInteger id, Integer origin);

    List<OrderVo> getReturnInOderInfoByParams(BigInteger id, Integer origin, int page, int limit);

    int getOrderListGoodsIdById(int id);

    void verifyReturnInOrder(BigInteger id);
}
