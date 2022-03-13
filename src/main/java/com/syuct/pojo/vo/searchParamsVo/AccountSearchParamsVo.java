package com.syuct.pojo.vo.searchParamsVo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @Author Zsz
 * @Date 2021/11/23 13:41
 * @Version 1.0
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class AccountSearchParamsVo {
    private int id;
    private String name;
    private String flag;
}
