package com.syuct.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author Zsz
 * @Date 2022/2/22 17:58
 * @Version 1.0
 **/

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Test01 {

    private int id;
    private Test02 test02;
}
