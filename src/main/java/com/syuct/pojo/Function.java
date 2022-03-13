package com.syuct.pojo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Function {

    private int id;
    private int pid;
    private String title;
    private String icon;
    private String href;
    private String target;
    private int sort;
    private int status;
    private String remark;
    private String createAt;
    private String updateAt;
    private String deleteAt;
    private int roleid;

}
