package com.syuct.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigInteger;

/**
 * @Author Zsz
 * @Date 2022/2/23 11:34
 * @Version 1.0
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderList {

    private int id;
    private BigInteger orderId;
    private int goodsId;
    private int number;
    private double price;
    private int storeId;
}
