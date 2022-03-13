package com.syuct.controller;

import com.alibaba.fastjson.JSON;
import com.syuct.pojo.vo.searchParamsVo.*;
import com.syuct.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 * @Author Zsz
 * @Date 2022/3/11 9:34
 * @Version 1.0
 **/
@Controller
@RequestMapping("/report")
public class ReportController {

    @Autowired
    private ReportService reportService;


    @RequestMapping("stock")
    public String getStockPage() {
        return "/page/report/stock/table";
    }

    @RequestMapping("account")
    public String getAccountPage() {
        return "/page/report/account/table";
    }

    @RequestMapping("/acountInfo")
    @ResponseBody
    public Map<String, Object> acountInfo(@RequestParam int page,
                                          @RequestParam int limit,
                                          @RequestParam(value = "searchParams", required = false) String searchParams) {
        AccountSearchParamsVo accountSearchParamsVo = JSON.parseObject(searchParams, AccountSearchParamsVo.class);
        if (accountSearchParamsVo == null) {
            Map<String, Object> map = reportService.getAccountReportByPage(page, limit);
            return map;
        } else {
            Map<String, Object> map = reportService.getAccountInfoByParams(page, limit, accountSearchParamsVo);
            return map;
        }
    }


    @RequestMapping("purchase")
    public String getPurchasePage() {
        return "/page/report/purchase/table";
    }

    @RequestMapping("/purchaseInfo")
    @ResponseBody
    public Map<String, Object> purchaseInfo(@RequestParam int page,
                                          @RequestParam int limit,
                                          @RequestParam(value = "searchParams", required = false) String searchParams) {
        System.out.println(searchParams);
        PurchaseReportParamsVo purchaseReportParamsVo = JSON.parseObject(searchParams, PurchaseReportParamsVo.class);
        if (purchaseReportParamsVo == null) {
            Map<String, Object> map = reportService.getPurchaseReportByPage(page, limit);
            return map;
        } else {
            System.out.println(purchaseReportParamsVo);
            Map<String, Object> map = reportService.getPurchaseReportByParams(page, limit, purchaseReportParamsVo);
            return map;
        }
    }

    @RequestMapping("sale")
    public String getSalePage() {
        return "/page/report/sale/table";
    }


    @RequestMapping("/saleInfo")
    @ResponseBody
    public Map<String, Object> saleInfo(@RequestParam int page,
                                          @RequestParam int limit,
                                          @RequestParam(value = "searchParams", required = false) String searchParams) {
        PurchaseReportParamsVo purchaseReportParamsVo = JSON.parseObject(searchParams, PurchaseReportParamsVo.class);
        if (purchaseReportParamsVo == null) {
            Map<String, Object> map = reportService.getSaleReportByPage(page, limit);
            return map;
        } else {
            Map<String, Object> map = reportService.getSaleReportByParams(page, limit, purchaseReportParamsVo);
            return map;
        }
    }

    @RequestMapping("in")
    public String getInPage() {
        return "/page/report/in/table";
    }

    @RequestMapping("inInfo")
    @ResponseBody
    public Map<String, Object> inInfo(@RequestParam int page,
                                        @RequestParam int limit,
                                        @RequestParam(value = "searchParams", required = false) String searchParams) {
        InReportParamsVo inReportParamsVo = JSON.parseObject(searchParams, InReportParamsVo.class);
        if (inReportParamsVo == null) {
            Map<String, Object> map = reportService.getInReportByPage(page, limit);
            return map;
        } else {
            Map<String, Object> map = reportService.getInReportByParams(page, limit, inReportParamsVo);
            return map;
        }
    }


    @RequestMapping("out")
    public String getOutPage() {
        return "/page/report/out/table";
    }

    @RequestMapping("outInfo")
    @ResponseBody
    public Map<String, Object> outInfo(@RequestParam int page,
                                      @RequestParam int limit,
                                      @RequestParam(value = "searchParams", required = false) String searchParams) {
        InReportParamsVo inReportParamsVo = JSON.parseObject(searchParams, InReportParamsVo.class);
        if (inReportParamsVo == null) {
            Map<String, Object> map = reportService.getOutReportByPage(page, limit);
            return map;
        } else {
            Map<String, Object> map = reportService.getOutReportByParams(page, limit, inReportParamsVo);
            return map;
        }
    }


    @RequestMapping("back")
    public String getBackPage() {
        return "/page/report/back/table";
    }

    @RequestMapping("backInfo")
    @ResponseBody
    public Map<String, Object> backInfo(@RequestParam int page,
                                      @RequestParam int limit,
                                      @RequestParam(value = "searchParams", required = false) String searchParams) {
        BackReportSearchParamsVo backReportSearchParamsVo = JSON.parseObject(searchParams, BackReportSearchParamsVo.class);
        if (backReportSearchParamsVo == null) {
            Map<String, Object> map = reportService.getBackReportByPage(page, limit);
            return map;
        } else {
            Map<String, Object> map = reportService.getBackReportByParams(page, limit, backReportSearchParamsVo);
            return map;
        }
    }

    @RequestMapping("warning")
    public String getWarningPage() {
        return "/page/report/warning/table";
    }

    @RequestMapping("warningInfo")
    @ResponseBody
    public Map<String, Object> warningInfo(@RequestParam int page,
                                      @RequestParam int limit,
                                      @RequestParam(value = "searchParams", required = false) String searchParams) {
        WarningReportSearchParamsVo warningReportSearchParamsVo = JSON.parseObject(searchParams, WarningReportSearchParamsVo.class);
        if (warningReportSearchParamsVo == null) {
            Map<String, Object> map = reportService.getWarningReportByPage(page, limit);
            return map;
        } else {
            Map<String, Object> map = reportService.getWarningReportByParams(page, limit, warningReportSearchParamsVo);
            return map;
        }
    }








}
