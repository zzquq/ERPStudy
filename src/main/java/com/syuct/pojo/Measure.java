package com.syuct.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @Author Zsz
 * @Date 2022/1/12 15:09
 * @Version 1.0
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Measure {

    private int id;
    private String name;
    private int status;
    private String remark;
}
