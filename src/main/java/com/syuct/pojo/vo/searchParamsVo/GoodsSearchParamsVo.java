package com.syuct.pojo.vo.searchParamsVo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author Zsz
 * @Date 2022/1/13 16:29
 * @Version 1.0
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class GoodsSearchParamsVo {

    private int id;
    private String name;
    private String supplier;
}
