package com.syuct.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author Zsz
 * @Date 2022/1/13 16:06
 * @Version 1.0
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Goods {

    private int id;
    private String name;
    private int categoryId;
    private int measureId;
    private int safetyStock;
    private String remark;
    private int status;
    private int deleteFlag;
}
