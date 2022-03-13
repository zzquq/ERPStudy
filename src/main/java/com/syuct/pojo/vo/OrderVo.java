package com.syuct.pojo.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import com.syuct.pojo.OrderList;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.Date;
import java.util.List;

/**
 * @Author Zsz
 * @Date 2022/2/23 11:33
 * 用来传输订单信息，重要程度：*****
 * @Version 1.0
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderVo {

    @JsonSerialize(using= ToStringSerializer.class)
    private BigInteger id;
    private int type;
    @JsonSerialize(using= ToStringSerializer.class)
    private BigInteger list;
    private List<OrderLIstVo> orderLIstVos;
    private String origin;
    private String account;
    private double moneyAmount;
    private String handsPerson;


    @JsonFormat(
            pattern = "yyyy-MM-dd HH:mm:ss",
            timezone = "GMT+8"
    )
    private Date createTime;
    @JsonFormat(
            pattern = "yyyy-MM-dd HH:mm:ss",
            timezone = "GMT+8"
    )
    private Date updateTime;
    private String status;
    private int deleteFlag;
    private String remark;

    private String allGoodsName;
}
