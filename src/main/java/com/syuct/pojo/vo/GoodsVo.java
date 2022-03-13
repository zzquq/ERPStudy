package com.syuct.pojo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @Author Zsz
 * @Date 2022/1/13 16:38
 * @Version 1.0
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class GoodsVo {

    private int id;
    private String name;
    private String category;
    private String measure;
    private String supplier;
    private int safetyStock;
    private String remark;
    private String status;
    private int deleteFlag;
}
