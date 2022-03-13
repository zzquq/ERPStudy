package com.syuct.pojo.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AdminVo {

    private String username;
    private String name;
    private String phone;
    private String email;
    private String remark;


}
