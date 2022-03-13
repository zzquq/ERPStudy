package com.syuct.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author Zsz
 * @Date 2022/1/7 19:27
 * @Version 1.0
 **/

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member {

    private int id;
    private String name;
    private String phone;
    private String email;
    private String discount;
    private int status;
    private String remark;

}
