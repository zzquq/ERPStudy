package com.syuct.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class Log implements Serializable {

    private int id;
    private String username;
    private String name;
    private String module;
    private String operation;
    private String url;
    private String ip;
    private Date date;
    private int status;

}

