package com.syuct.pojo;


import lombok.Data;
import org.springframework.data.annotation.CreatedDate;

import java.io.Serializable;
import java.util.Date;

@Data
public class SysMenu implements Serializable {
    private Long id;
    private String title;
    private String href;
    private Long pid;
    private String icon;
    private String target;
    private Integer sort;
    private Boolean status;
    private String remark;
    @CreatedDate
    private Date create_at;
    @CreatedDate
    private Date update_at;
    private Date delete_at;
}