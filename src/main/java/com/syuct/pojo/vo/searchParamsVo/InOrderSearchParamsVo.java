package com.syuct.pojo.vo.searchParamsVo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigInteger;

/**
 * @Author Zsz
 * @Date 2022/3/1 13:18
 * @Version 1.0
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class InOrderSearchParamsVo {

    private BigInteger id;
    private String supplier;
}
