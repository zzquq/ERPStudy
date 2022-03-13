package com.syuct.pojo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author Zsz
 * @Date 2021/11/23 13:49
 * @Version 1.0
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class AccountVo {

    private int id;
    private String name;
    private String accountNumber;
    private String nowMoney;
    private String remark;
    private int flag;

}
