package com.syuct.pojo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @Author Zsz
 * @Date 2022/1/6 16:43
 * @Version 1.0
 **/

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AddSupplierVo {


    private int id;
    private String name;
    private String phone;
    private String address;
    private String fax;
    private String email;
    private String accountId;
    private String remark;

}
