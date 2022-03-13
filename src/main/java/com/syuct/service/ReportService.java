package com.syuct.service;

import com.syuct.pojo.vo.searchParamsVo.*;

import java.util.Map;

/**
 * @Author Zsz
 * @Date 2022/3/11 10:03
 * @Version 1.0
 **/
public interface ReportService {
    Map<String, Object> getAccountReportByPage(int page, int limit);

    Map<String, Object> getAccountInfoByParams(int page, int limit, AccountSearchParamsVo accountSearchParamsVo);

    Map<String, Object> getPurchaseReportByPage(int page, int limit);

    Map<String, Object> getPurchaseReportByParams(int page, int limit, PurchaseReportParamsVo purchaseReportParamsVo);

    Map<String, Object> getSaleReportByPage(int page, int limit);

    Map<String, Object> getSaleReportByParams(int page, int limit, PurchaseReportParamsVo purchaseReportParamsVo);

    Map<String, Object> getInReportByPage(int page, int limit);

    Map<String, Object> getInReportByParams(int page, int limit, InReportParamsVo inReportParamsVo);

    Map<String, Object> getOutReportByPage(int page, int limit);

    Map<String, Object> getOutReportByParams(int page, int limit, InReportParamsVo inReportParamsVo);

    Map<String, Object> getBackReportByPage(int page, int limit);

    Map<String, Object> getBackReportByParams(int page, int limit, BackReportSearchParamsVo backReportSearchParamsVo);

    Map<String, Object> getWarningReportByPage(int page, int limit);

    Map<String, Object> getWarningReportByParams(int page, int limit, WarningReportSearchParamsVo warningReportSearchParamsVo);
}
