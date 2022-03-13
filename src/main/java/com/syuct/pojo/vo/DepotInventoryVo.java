package com.syuct.pojo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @Author Zsz
 * @Date 2022/3/9 11:26
 * @Version 1.0
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class DepotInventoryVo {

    private int id;
//    private int storeId;
    private String storeName;
//    private int goodsId;
    private String goodsName;
    private int inventory;
    private String measure;
}
