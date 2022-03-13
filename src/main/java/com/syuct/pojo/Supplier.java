package com.syuct.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author Zsz
 * @Date 2021/11/22 21:19
 * @Version 1.0
 **/

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Supplier {

    private int id;
    private String name;
    private String phone;
    private String address;
    private String fax;
    private String email;
    private int accountId;
    private String remark;
    private int status;

}
