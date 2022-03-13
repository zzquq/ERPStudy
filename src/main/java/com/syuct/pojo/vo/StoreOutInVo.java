package com.syuct.pojo.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @Author Zsz
 * @Date 2022/3/9 17:24
 * @Version 1.0
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class StoreOutInVo {

    private int id;
    private String storeOutName;
    private String  goodsName;
    private int number;
    private String storeInName;
    @JsonFormat(
            pattern = "yyyy-MM-dd HH:mm:ss",
            timezone = "GMT+8"
    )
    private Date creatTime;
    private String status;
    private String deleteFlag;
}
