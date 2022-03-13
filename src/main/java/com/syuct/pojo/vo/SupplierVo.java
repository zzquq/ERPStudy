package com.syuct.pojo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.coyote.http11.upgrade.UpgradeProcessorInternal;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @Author Zsz
 * @Date 2021/11/22 21:05
 * @Version 1.0
 **/

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SupplierVo {

    private int id;
    private String name;
    private String phone;
    private String address;
    private String fax;
    private String email;
    private String accountName;
    private String remark;

}
