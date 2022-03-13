package com.syuct.pojo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author Zsz
 * @Date 2022/3/12 10:18
 * @Version 1.0
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class WarningVo {

    private int id;
    private String storeName;
    private String goodsName;
    private String number;
    private String safety;
    private String warning;

}
