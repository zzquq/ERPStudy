package com.syuct.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @Author Zsz
 * @Date 2022/3/4 20:37
 * @Version 1.0
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class StoreLog {

    private int id;
    private int type;
    private int storeId;
    private int goodsId;
    private int number;
    private int person;
    private Date date;

}
