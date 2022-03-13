package com.syuct.pojo.vo.searchParamsVo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigInteger;

/**
 * @Author Zsz
 * @Date 2022/3/7 17:42
 * @Version 1.0
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class OutOrderSearchParamsVo {

    private BigInteger id;
    private String member;
}
