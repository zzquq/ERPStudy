package com.syuct.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @Author Zsz
 * @Date 2022/3/9 17:22
 * @Version 1.0
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class StoreOutIn {

    private int id;
    private int storeOut;
    private int goodsId;
    private int number;
    private int storeIn;
    @JsonFormat(
            pattern = "yyyy-MM-dd HH:mm:ss",
            timezone = "GMT+8"
    )
    private Date creatTime;
    private int status;
    private int deleteFlag;
}
