package com.syuct.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigInteger;
import java.util.Date;

/**
 * @Author Zsz
 * @Date 2022/2/23 11:30
 * @Version 1.0
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Order {

    @JsonSerialize(using= ToStringSerializer.class)
    private BigInteger id;
    private int type;
    @JsonSerialize(using= ToStringSerializer.class)
    private BigInteger list;
    private int origin;
    private int accountId;
    private double moneyAmount;
    private int handsPersonId;
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
    private int status;
    private int deleteFlag;
    private String remark;


}
