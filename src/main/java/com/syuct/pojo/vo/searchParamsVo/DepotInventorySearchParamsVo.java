package com.syuct.pojo.vo.searchParamsVo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @Author Zsz
 * @Date 2022/3/9 12:20
 * @Version 1.0
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class DepotInventorySearchParamsVo {

    private String goodsName;
    private String storeName;
}
