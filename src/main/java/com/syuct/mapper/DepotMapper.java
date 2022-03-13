package com.syuct.mapper;

import com.syuct.pojo.StoreOutIn;
import com.syuct.pojo.vo.DepotInventoryVo;
import com.syuct.pojo.vo.StoreOutInVo;
import org.springframework.stereotype.Repository;

import java.math.BigInteger;
import java.util.List;

/**
 * @Author Zsz
 * @Date 2022/3/9 11:49
 * @Version 1.0
 **/
@Repository
public interface DepotMapper {
    int getDepotInventoryCount();

    List<DepotInventoryVo> getDepotInventoryByPage(int page, int limit);

    int getDepotInventoryCountByparams(String goodsName, String storeName);

    List<DepotInventoryVo> getDepotInventoryByParams(String goodsName, String storeName, int page, int limit);

    int getStoreOutInInfoCount();

    List<StoreOutInVo> getStoreOutInInfoByPage(int page, int limit);

    int getStoreOutInInfoCountByParams(Integer storeId, Integer goodsId);

    List<StoreOutInVo> getStoreOutInInfoByParams(Integer storeId, Integer goodsId, int page, int limit);

    void addStoreOutIn(StoreOutIn storeOutIn);

    void delOutIn(int id);

    int getStoreOutInStatusById(int id);

    StoreOutIn getStoreOutInInfoById(int id);

    void verifyOutIn(int id);
}
