package com.syuct.service;

import com.syuct.pojo.StoreInVo;
import com.syuct.pojo.vo.StoreOutInVo;
import org.springframework.security.core.Authentication;

import java.util.List;
import java.util.Map;

/**
 * @Author Zsz
 * @Date 2022/3/9 11:48
 * @Version 1.0
 **/
public interface DepotService {
    Map<String, Object> getDepotInventoryByPage(int page, int limit);

    Map<String, Object> getDepotInventoryByParams(int page, int limit, String searchParams);

    void addStoreIn(StoreInVo storeInVo, Authentication authentication);

    void addstoreOut(StoreInVo storeInVo, Authentication authentication);

    Map<String, Object> getStoreOutInInfoByPage(int page, int limit);

    Map<String, Object> getStoreOutInInfoByParams(String searchParams, int page, int limit);

    void addStoreOutIn(StoreOutInVo storeOutInVo);

    void delOutIn(int id);

    void delAllOutIn(List<StoreOutInVo> storeOutInVos);

    void verifyOutIn(int id, Authentication authentication);
}
