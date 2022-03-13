package com.syuct.mapper;

import com.syuct.pojo.vo.AccountReportVo;
import com.syuct.pojo.vo.PurchaseReportVo;
import com.syuct.pojo.vo.StoreLogVo;
import com.syuct.pojo.vo.WarningVo;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

/**
 * @Author Zsz
 * @Date 2022/3/11 10:05
 * @Version 1.0
 **/
@Repository
public interface ReportMapper {
    int getAccountReportCounts();

    List<AccountReportVo> getAccountReportByPage(int page, int limit);

    int getAccountReportCountsByParams(String name, String type);

    List<AccountReportVo> getAccountReportByParams(String name, String type, int page, int limit);

    List<PurchaseReportVo> getPurchaseReportBypage(int page, int limit);

    List<PurchaseReportVo> getPurchaseReportByParams(Integer goodsIdByName, Date startDate, Date endDate, int page, int limit);

    List<PurchaseReportVo> getSaleReportBypage(int page, int limit);

    List<PurchaseReportVo> getSaleReportByParams(Integer goodsIdByName, Date startDate, Date endDate, int page, int limit);

    int getInStoreLogCount();

    List<StoreLogVo> getInStoreLogByPage(int page, int limit);

    int getInStoreLogCountByParams(Integer goodsId, Integer storeId, Date startDate, Date endDate);

    List<StoreLogVo> getInStoreLogByParams(Integer goodsId, Integer storeId, Date startDate, Date endDate, int page, int limit);

    int getOutStoreLogCount();

    List<StoreLogVo> getOutStoreLogByPage(int page, int limit);

    int getOutStoreLogCountByParams(Integer goodsId, Integer storeId, Date startDate, Date endDate);

    List<StoreLogVo> getOutStoreLogByParams(Integer goodsId, Integer storeId, Date startDate, Date endDate, int page, int limit);

    int getBackStoreLogCount();

    List<StoreLogVo> getBackStoreLogByPage(int page, int limit);

    int getBackStoreLogCountByParams(int type, Integer goodsId, Date startDate, Date endDate);

    List<StoreLogVo> getBackStoreLogByParams(int type, Integer goodsId, Date startDate, Date endDate, int page, int limit);

    int getWarningGoodsCount();

    List<WarningVo> getWarningGoodsInfoByPage(int page, int limit);

    int getWarningGoodsCountByParams(Integer goodsId, Integer storeId);


    List<WarningVo> getWarningGoodsInfoByParams(Integer goodsId, Integer storeId, int page, int limit);
}
