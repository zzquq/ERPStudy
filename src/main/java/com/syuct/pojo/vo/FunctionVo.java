package com.syuct.pojo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FunctionVo {

    private int id;
    private int pid;
    private String title;
    private String href;
    private String status;
    private String role;
    private int isMenu;

}
