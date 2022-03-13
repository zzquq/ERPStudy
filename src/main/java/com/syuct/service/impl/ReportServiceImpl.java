package com.syuct.service.impl;

import com.alibaba.fastjson.JSON;
import com.syuct.mapper.*;
import com.syuct.pojo.Account;
import com.syuct.pojo.Store;
import com.syuct.pojo.vo.*;
import com.syuct.pojo.vo.searchParamsVo.*;
import com.syuct.service.ReportService;
import com.syuct.utils.FormatConversion;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.*;

/**
 * @Author Zsz
 * @Date 2022/3/11 10:03
 * @Version 1.0
 **/
@Service
public class ReportServiceImpl implements ReportService {

    @Autowired
    private ReportMapper reportMapper;

    @Autowired
    private InfoMapper infoMapper;

    @Autowired
    private PurchaseMapper purchaseMapper;

    @Autowired
    private CommodityMapper commodityMapper;

    @Autowired
    private AccountMapper accountMapper;
    @Override
    public Map<String, Object> getAccountReportByPage(int page, int limit) {
        page = (page - 1) * limit;
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        int count = reportMapper.getAccountReportCounts();
        map.put("count", count);

        List<AccountReportVo> accountReportVos = reportMapper.getAccountReportByPage(page, limit);
        for (AccountReportVo a :
                accountReportVos) {
            String type = a.getType();
            if ("0".equals(type.trim()) || "1".equals(type.trim())) {
                a.setOrigin(infoMapper.getSupplierInfoById(Integer.parseInt(a.getOrigin())).getName());
            } else if ("2".equals(type.trim()) || "3".equals(type.trim())) {
                a.setOrigin(infoMapper.getMemberInfoById(Integer.parseInt(a.getOrigin())).getName());
            }
            if ("0".equals(a.getType())) {
                a.setType("采购入库");
            } else if ("1".equals(a.getType())) {
                a.setType("采购退货");
            } else if ("2".equals(a.getType())) {
                a.setType("销售出库");
            } else if ("3".equals(a.getType())) {
                a.setType("销售退货");
            }
        }

        map.put("data", accountReportVos);
        return map;
    }

    @Override
    public Map<String, Object> getAccountInfoByParams(int page, int limit, AccountSearchParamsVo accountSearchParamsVo) {
        String name = accountSearchParamsVo.getName();
        String type = accountSearchParamsVo.getFlag();
        page = (page - 1) * limit;
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        if ("".equals(type)) {
            type = null;
        }
        if (!"".equals(name)) {
            String accountId = accountMapper.getAccountIdByName(name);
            if (accountId == null) {
                name = null;
            } else {
                name = accountId;
            }
        } else {
            name = null;
        }
        int count = reportMapper.getAccountReportCountsByParams(name, type);
        map.put("count", count);
        List<AccountReportVo> accountReportVos = reportMapper.getAccountReportByParams(name, type, page, limit);
        for (AccountReportVo a :
                accountReportVos) {
            type = a.getType();
            if ("0".equals(type.trim()) || "1".equals(type.trim())) {
                a.setOrigin(infoMapper.getSupplierInfoById(Integer.parseInt(a.getOrigin())).getName());
            } else if ("2".equals(type.trim()) || "3".equals(type.trim())) {
                a.setOrigin(infoMapper.getMemberInfoById(Integer.parseInt(a.getOrigin())).getName());
            }
            if ("0".equals(a.getType())) {
                a.setType("采购入库");
            } else if ("1".equals(a.getType())) {
                a.setType("采购退货");
            } else if ("2".equals(a.getType())) {
                a.setType("销售出库");
            } else if ("3".equals(a.getType())) {
                a.setType("销售退货");
            }
        }
        map.put("data", accountReportVos);
        return map;
    }

    @Override
    public Map<String, Object> getPurchaseReportByPage(int page, int limit) {
        page = (page - 1) * limit;
        HashMap<String, Object> map = new HashMap<>();
        map.put("code", 0);

        //只要没有删除，就都要查出来
        int count = commodityMapper.getGoodsCountBypage();
        map.put("count", count);
        List<GoodsVo> goodsInfoByPage = commodityMapper.getGoodsInfoByPage(page, limit);

        List<PurchaseReportVo> purchaseReportVos = reportMapper.getPurchaseReportBypage(page, limit);
        List<PurchaseReportVo> data = new ArrayList<>();
        for (GoodsVo goods :
                goodsInfoByPage) {

            String name = goods.getName();
            PurchaseReportVo purchaseReportVo = new PurchaseReportVo();
            purchaseReportVo.setGoodsName(name);
            purchaseReportVo.setId(goods.getId());
            BigDecimal start = new BigDecimal(0);
            int sumNumber = 0;

            for (PurchaseReportVo purchase :
                    purchaseReportVos) {

                if (name.equals(purchase.getGoodsName())) {

                    BigDecimal m = purchase.getMoney();
                    int n = purchase.getNumber();
                    sumNumber = sumNumber + n;
                    BigDecimal multiply = m.multiply(BigDecimal.valueOf(n));
                    start = start.add(multiply);
                }
            }

            purchaseReportVo.setMoney(start);
            purchaseReportVo.setNumber(sumNumber);
            data.add(purchaseReportVo);
        }
        map.put("data", data);
        return map;
    }

    @Override
    public Map<String, Object> getPurchaseReportByParams(int page, int limit, PurchaseReportParamsVo purchaseReportParamsVo) {
//        SELECT * FROM customer WHERE UNIX_TIMESTAMP(lastlogintime)  >= UNIX_TIMESTAMP('2015-01-01 13:50:42')  AND  UNIX_TIMESTAMP(lastlogintime)  <= UNIX_TIMESTAMP('2015-02-06 00:00:00')  ORDER BY ID DESC
        page = (page - 1) * limit;
        HashMap<String, Object> map = new HashMap<>();
        map.put("code", 0);
        String goodsName = purchaseReportParamsVo.getGoodsName();

        //只要没有删除，就都要查出来
        int count = 0;
        Integer goodsIdByName = infoMapper.getGoodsIdByName(goodsName);
        //如果，输入的商品名称在数据库中没有，则查出来的goodsIdByName为空，并且goodsName不为空，则进入第一个if  将goodsIdbyName置为0，count为0
//        此时 ，查出的数据为无数据，因为商品不存在。查询为无数据，则应该是goodIdByName = 0查出来的 ，
//        因此commodityMapper.getGoodsInfoByName(goodsIdByName, page, limit); 条件应该是goodsIdByName ！= null时添加的
        if (goodsIdByName == null && !"".equals(goodsName)) {
            goodsIdByName = 0;
            count = 0;
        } else if (goodsIdByName != null) {
            count = 1;
        } else {
            count = commodityMapper.getGoodsCountBypage();
        }
        map.put("count", count);

        Date startDate = purchaseReportParamsVo.getStartDate();
        Date endDate = purchaseReportParamsVo.getEndDate();

        Calendar calendar = new GregorianCalendar();
        calendar.setTime(endDate);
        calendar.add(Calendar.DATE, 1);
        endDate = calendar.getTime();

        System.out.println(goodsIdByName);
        List<GoodsVo> goodsInfoByPage = commodityMapper.getGoodsInfoByName(goodsIdByName, page, limit);

        List<PurchaseReportVo> purchaseReportVos = reportMapper.getPurchaseReportByParams(goodsIdByName,startDate, endDate, page, limit);
        List<PurchaseReportVo> data = new ArrayList<>();
        for (GoodsVo goods :
                goodsInfoByPage) {

            String name = goods.getName();
            PurchaseReportVo purchaseReportVo = new PurchaseReportVo();
            purchaseReportVo.setGoodsName(name);
            purchaseReportVo.setId(goods.getId());
            BigDecimal start = new BigDecimal(0);
            int sumNumber = 0;

            for (PurchaseReportVo purchase :
                    purchaseReportVos) {

                if (name.equals(purchase.getGoodsName())) {

                    BigDecimal m = purchase.getMoney();
                    int n = purchase.getNumber();
                    sumNumber = sumNumber + n;
                    BigDecimal multiply = m.multiply(BigDecimal.valueOf(n));
                    start = start.add(multiply);
                }
            }

            purchaseReportVo.setMoney(start);
            purchaseReportVo.setNumber(sumNumber);
            data.add(purchaseReportVo);
        }
        map.put("data", data);
        return map;
    }

    @Override
    public Map<String, Object> getSaleReportByPage(int page, int limit) {
        page = (page - 1) * limit;
        HashMap<String, Object> map = new HashMap<>();
        map.put("code", 0);

        //只要没有删除，就都要查出来
        int count = commodityMapper.getGoodsCountBypage();
        map.put("count", count);
        List<GoodsVo> goodsInfoByPage = commodityMapper.getGoodsInfoByPage(page, limit);

        List<PurchaseReportVo> purchaseReportVos = reportMapper.getSaleReportBypage(page, limit);
        List<PurchaseReportVo> data = new ArrayList<>();
        for (GoodsVo goods :
                goodsInfoByPage) {

            String name = goods.getName();
            PurchaseReportVo purchaseReportVo = new PurchaseReportVo();
            purchaseReportVo.setGoodsName(name);
            purchaseReportVo.setId(goods.getId());
            BigDecimal start = new BigDecimal(0);
            int sumNumber = 0;

            for (PurchaseReportVo purchase :
                    purchaseReportVos) {

                if (name.equals(purchase.getGoodsName())) {

                    BigDecimal m = purchase.getMoney();
                    int n = purchase.getNumber();
                    sumNumber = sumNumber + n;
                    BigDecimal multiply = m.multiply(BigDecimal.valueOf(n));
                    start = start.add(multiply);
                }
            }

            purchaseReportVo.setMoney(start);
            purchaseReportVo.setNumber(sumNumber);
            data.add(purchaseReportVo);
        }
        map.put("data", data);
        return map;

    }

    @Override
    public Map<String, Object> getSaleReportByParams(int page, int limit, PurchaseReportParamsVo purchaseReportParamsVo) {
        page = (page - 1) * limit;
        HashMap<String, Object> map = new HashMap<>();
        map.put("code", 0);
        String goodsName = purchaseReportParamsVo.getGoodsName();

        //只要没有删除，就都要查出来
        int count = 0;
        Integer goodsIdByName = infoMapper.getGoodsIdByName(goodsName);
        //如果，输入的商品名称在数据库中没有，则查出来的goodsIdByName为空，并且goodsName不为空，则进入第一个if  将goodsIdbyName置为0，count为0
//        此时 ，查出的数据为无数据，因为商品不存在。查询为无数据，则应该是goodIdByName = 0查出来的 ，
//        因此commodityMapper.getGoodsInfoByName(goodsIdByName, page, limit); 条件应该是goodsIdByName ！= null时添加的
        if (goodsIdByName == null && !"".equals(goodsName)) {
            goodsIdByName = 0;
            count = 0;
        } else if (goodsIdByName != null) {
            count = 1;
        } else {
            count = commodityMapper.getGoodsCountBypage();
        }
        map.put("count", count);

        Date startDate = purchaseReportParamsVo.getStartDate();
        Date endDate = purchaseReportParamsVo.getEndDate();

        Calendar calendar = new GregorianCalendar();
        calendar.setTime(endDate);
        calendar.add(Calendar.DATE, 1);
        endDate = calendar.getTime();

        List<GoodsVo> goodsInfoByPage = commodityMapper.getGoodsInfoByName(goodsIdByName, page, limit);

        List<PurchaseReportVo> purchaseReportVos = reportMapper.getSaleReportByParams(goodsIdByName,startDate, endDate, page, limit);
        List<PurchaseReportVo> data = new ArrayList<>();
        for (GoodsVo goods :
                goodsInfoByPage) {

            String name = goods.getName();
            PurchaseReportVo purchaseReportVo = new PurchaseReportVo();
            purchaseReportVo.setGoodsName(name);
            purchaseReportVo.setId(goods.getId());
            BigDecimal start = new BigDecimal(0);
            int sumNumber = 0;

            for (PurchaseReportVo purchase :
                    purchaseReportVos) {

                if (name.equals(purchase.getGoodsName())) {

                    BigDecimal m = purchase.getMoney();
                    int n = purchase.getNumber();
                    sumNumber = sumNumber + n;
                    BigDecimal multiply = m.multiply(BigDecimal.valueOf(n));
                    start = start.add(multiply);
                }
            }

            purchaseReportVo.setMoney(start);
            purchaseReportVo.setNumber(sumNumber);
            data.add(purchaseReportVo);
        }
        map.put("data", data);
        return map;

    }

    @Override
    public Map<String, Object> getInReportByPage(int page, int limit) {
        page = (page - 1) * limit;

        HashMap<String, Object> map = new HashMap<>();
        map.put("code", 0);

        int count = reportMapper.getInStoreLogCount();
        map.put("count", count);

        List<StoreLogVo> storeLogVos = reportMapper.getInStoreLogByPage(page, limit);

        for (StoreLogVo s :
               storeLogVos ) {
            if ("0".equals(s.getType())) {
                s.setType("采购入库");
            } else if ("3".equals(s.getType())) {
                s.setType("其他入库");
            }else if ("5".equals(s.getType())) {
                s.setType("调拨入库");
            }else if ("7".equals(s.getType())) {
                s.setType("销售退货入库");
            }
        }
        map.put("data", storeLogVos);
        return map;
    }

    @Override
    public Map<String, Object> getInReportByParams(int page, int limit, InReportParamsVo inReportParamsVo) {
        String storeName = inReportParamsVo.getStoreName();
        String goodsName = inReportParamsVo.getGoodsName();
        Date startDate = inReportParamsVo.getStartDate();
        Date endDate = inReportParamsVo.getEndDate();
        Calendar calendar = new GregorianCalendar();
        calendar.setTime(endDate);
        calendar.add(Calendar.DATE, 1);
        endDate = calendar.getTime();

        page = (page - 1) * limit;
        Map<String, Object> map = new HashMap<>();
        Integer goodsId = infoMapper.getGoodsIdByName(goodsName);
        if (goodsId == null && !"".equals(goodsName)) {
            goodsId = 0;
        }

        Integer storeId= infoMapper.getStoreIdByName(storeName);
        if (storeId == null && !"".equals(storeName)) {
            storeId = 0;
        }
        map.put("code", 0);
        System.out.println(goodsId);
        System.out.println(storeId);
        int count = reportMapper.getInStoreLogCountByParams(goodsId, storeId, startDate, endDate);
        map.put("count", count);

        List<StoreLogVo> storeLogVos = reportMapper.getInStoreLogByParams(goodsId, storeId, startDate, endDate, page, limit);
        for (StoreLogVo s :
                storeLogVos ) {
            if ("0".equals(s.getType())) {
                s.setType("采购入库");
            } else if ("3".equals(s.getType())) {
                s.setType("其他入库");
            }else if ("5".equals(s.getType())) {
                s.setType("调拨入库");
            }else if ("7".equals(s.getType())) {
                s.setType("销售退货入库");
            }
        }
        map.put("data", storeLogVos);
        return map;
    }

    @Override
    public Map<String, Object> getOutReportByPage(int page, int limit) {
        page = (page - 1) * limit;

        HashMap<String, Object> map = new HashMap<>();
        map.put("code", 0);

        int count = reportMapper.getOutStoreLogCount();
        map.put("count", count);

        List<StoreLogVo> storeLogVos = reportMapper.getOutStoreLogByPage(page, limit);

        for (StoreLogVo s :
                storeLogVos ) {
            if ("1".equals(s.getType())) {
                s.setType("销售出库");
            } else if ("4".equals(s.getType())) {
                s.setType("其他出库");
            }else if ("6".equals(s.getType())) {
                s.setType("调拨出库");
            }else if ("8".equals(s.getType())) {
                s.setType("采购退货出库");
            }
        }
        map.put("data", storeLogVos);
        return map;
    }

    @Override
    public Map<String, Object> getOutReportByParams(int page, int limit, InReportParamsVo inReportParamsVo) {

        String storeName = inReportParamsVo.getStoreName();
        String goodsName = inReportParamsVo.getGoodsName();
        Date startDate = inReportParamsVo.getStartDate();
        Date endDate = inReportParamsVo.getEndDate();
        Calendar calendar = new GregorianCalendar();
        calendar.setTime(endDate);
        calendar.add(Calendar.DATE, 1);
        endDate = calendar.getTime();

        page = (page - 1) * limit;
        Map<String, Object> map = new HashMap<>();
        Integer goodsId = infoMapper.getGoodsIdByName(goodsName);
        if (goodsId == null && !"".equals(goodsName)) {
            goodsId = 0;
        }

        Integer storeId= infoMapper.getStoreIdByName(storeName);
        if (storeId == null && !"".equals(storeName)) {
            storeId = 0;
        }
        map.put("code", 0);
        int count = reportMapper.getOutStoreLogCountByParams(goodsId, storeId, startDate, endDate);
        map.put("count", count);

        List<StoreLogVo> storeLogVos = reportMapper.getOutStoreLogByParams(goodsId, storeId, startDate, endDate, page, limit);
        for (StoreLogVo s :
                storeLogVos ) {
            if ("1".equals(s.getType())) {
                s.setType("销售出库");
            } else if ("4".equals(s.getType())) {
                s.setType("其他出库");
            }else if ("6".equals(s.getType())) {
                s.setType("调拨出库");
            }else if ("8".equals(s.getType())) {
                s.setType("采购退货出库");
            }
        }
        map.put("data", storeLogVos);
        return map;
    }

    @Override
    public Map<String, Object> getBackReportByPage(int page, int limit) {
        page = (page - 1) * limit;

        HashMap<String, Object> map = new HashMap<>();
        map.put("code", 0);

        int count = reportMapper.getBackStoreLogCount();
        map.put("count", count);

        List<StoreLogVo> storeLogVos = reportMapper.getBackStoreLogByPage(page, limit);

        for (StoreLogVo s :
                storeLogVos ) {
            if ("7".equals(s.getType())) {
                s.setType("销售退货");
            }else if ("8".equals(s.getType())) {
                s.setType("采购退货");
            }
        }
        map.put("data", storeLogVos);
        return map;

    }

    @Override
    public Map<String, Object> getBackReportByParams(int page, int limit, BackReportSearchParamsVo backReportSearchParamsVo) {

        int type = backReportSearchParamsVo.getType();
        String goodsName = backReportSearchParamsVo.getGoodsName();
        Date startDate = backReportSearchParamsVo.getStartDate();
        Date endDate = backReportSearchParamsVo.getEndDate();

        Calendar calendar = new GregorianCalendar();
        calendar.setTime(endDate);
        calendar.add(Calendar.DATE, 1);
        endDate = calendar.getTime();

        page = (page - 1) * limit;
        Map<String, Object> map = new HashMap<>();
        Integer goodsId = infoMapper.getGoodsIdByName(goodsName);
        if (goodsId == null && !"".equals(goodsName)) {
            goodsId = 0;
        }

        map.put("code", 0);
        int count = reportMapper.getBackStoreLogCountByParams(type, goodsId, startDate, endDate);
        map.put("count", count);

        List<StoreLogVo> storeLogVos = reportMapper.getBackStoreLogByParams(type, goodsId, startDate, endDate, page, limit);
        for (StoreLogVo s :
                storeLogVos ) {
            if ("7".equals(s.getType())) {
                s.setType("销售退货");
            }else if ("8".equals(s.getType())) {
                s.setType("采购退货");
            }
        }
        map.put("data", storeLogVos);
        return map;
    }

    @Override
    public Map<String, Object> getWarningReportByPage(int page, int limit) {
        page = (page - 1) * limit;
        Map<String, Object> map = new HashMap();
        map.put("code", 0);

        int count = reportMapper.getWarningGoodsCount();
        map.put("count", count);
        List<WarningVo> warningVos = reportMapper.getWarningGoodsInfoByPage(page, limit);
        for (WarningVo w :
                warningVos) {
            int warning = Integer.parseInt(w.getSafety()) - Integer.parseInt(w.getNumber());
            w.setWarning(String.valueOf(warning));
        }
        map.put("data", warningVos);
        return map;
    }

    @Override
    public Map<String, Object> getWarningReportByParams(int page, int limit, WarningReportSearchParamsVo warningReportSearchParamsVo) {
        String storeName = warningReportSearchParamsVo.getStoreName();
        String goodsName = warningReportSearchParamsVo.getGoodsName();
        page = (page - 1) * limit;
        Map<String, Object> map = new HashMap<>();
        Integer goodsId = infoMapper.getGoodsIdByName(goodsName);
        if (goodsId == null && !"".equals(goodsName)) {
            goodsId = 0;
        }
        Integer storeId= infoMapper.getStoreIdByName(storeName);
        if (storeId == null && !"".equals(storeName)) {
            storeId = 0;
        }
        map.put("code", 0);
        System.out.println(goodsId);
        System.out.println(storeId);
        int count = reportMapper.getWarningGoodsCountByParams(goodsId, storeId);
        map.put("count", count);

        List<WarningVo> warningVos = reportMapper.getWarningGoodsInfoByParams(goodsId, storeId, page, limit);
        for (WarningVo w :
                warningVos) {
            int warning = Integer.parseInt(w.getSafety()) - Integer.parseInt(w.getNumber());
            w.setWarning(String.valueOf(warning));
        }
        map.put("data", warningVos);
        return map;
    }
}
