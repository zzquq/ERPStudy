package com.syuct.pojo.vo;

import jdk.jfr.DataAmount;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LogVo {

    private int id;
    private String username;
    private String name;
    private String module;
    private String operation;
    private String url;
    private String ip;
    private String date;
    private int status;
}
