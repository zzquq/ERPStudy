package com.syuct.pojo.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @Author Zsz
 * @Date 2022/3/11 20:48
 * @Version 1.0
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class StoreLogVo {

    private int id;
    private String type;
    private String storeName;
    private String goodsName;
    private String number;
    private String person;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(
            pattern = "yyyy-MM-dd HH:mm:ss",
            timezone = "GMT+8"
    )
    private Date date;
}
