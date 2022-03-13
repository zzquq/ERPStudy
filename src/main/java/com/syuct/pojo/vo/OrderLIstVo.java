package com.syuct.pojo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigInteger;

/**
 * @Author Zsz
 * @Date 2022/2/23 11:38
 * @Version 1.0
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderLIstVo {

    private int id;
    private BigInteger orderId;
    private String goodsName;
    private int number;
    private double price;
    private double sumPrice;
    private String storeName;
}
