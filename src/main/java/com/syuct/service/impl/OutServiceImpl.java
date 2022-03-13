package com.syuct.service.impl;

import com.alibaba.fastjson.JSON;
import com.syuct.mapper.OutMapper;
import com.syuct.mapper.PurchaseMapper;
import com.syuct.pojo.*;
import com.syuct.pojo.vo.AccountVo;
import com.syuct.pojo.vo.OrderLIstVo;
import com.syuct.pojo.vo.OrderVo;
import com.syuct.pojo.vo.searchParamsVo.InOrderSearchParamsVo;
import com.syuct.pojo.vo.searchParamsVo.OutOrderSearchParamsVo;
import com.syuct.service.AdminService;
import com.syuct.service.InfoService;
import com.syuct.service.OutService;
import com.syuct.utils.AssertUtil;
import com.syuct.utils.IdWorker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author Zsz
 * @Date 2022/3/7 15:07
 * @Version 1.0
 **/
@Service
public class OutServiceImpl implements OutService {

    @Autowired
    private OutMapper outMapper;

    @Autowired
    private InfoService infoService;

    @Autowired
    private PurchaseMapper purchaseMapper;

    @Autowired
    private AdminService adminService;
    @Override
    public Map<String, Object> getOutOrderInfoByPage(int page, int limit) {
        page = (page - 1) * limit;
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        int count = outMapper.getOutOrderCountByPage();
        map.put("count", count);
        List<OrderVo> orderList = outMapper.getOutOderInfoByPage(page, limit);
        String str = "";
        double sum = 0;
        for (OrderVo orderVo :
                orderList) {
            if ("5".equals(orderVo.getStatus())) {
                orderVo.setStatus("未审核");
            }else if("6".equals(orderVo.getStatus()) || "7".equals(orderVo.getStatus())) {
                orderVo.setStatus("已转售前");
            }
//            else if("2".equals(orderVo.getStatus())) {
//                orderVo.setStatus("已转采购");
//            }
            str = "";
            sum = 0;
            List<OrderLIstVo> orderLIstVos = orderVo.getOrderLIstVos();
            for (OrderLIstVo o :
                    orderLIstVos) {
                sum = sum + o.getPrice() * o.getNumber();
                str = str+ o.getGoodsName() + "，" ;
            }
            orderVo.setMoneyAmount(sum);
            str = str.substring(0, str.length() - 1);
            orderVo.setAllGoodsName(str);
        }
        map.put("goodsName", str);

        map.put("data", orderList);
        return map;
    }

    @Override
    public Map<String, Object> getOutOrderInfoByParams(String sertchParams, int page, int limit) {

        OutOrderSearchParamsVo outOrderSearchParamsVo = JSON.parseObject(sertchParams,OutOrderSearchParamsVo.class);
        BigInteger id = outOrderSearchParamsVo.getId();
        String member = outOrderSearchParamsVo.getMember();
        page = (page - 1) * limit;
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);

        Integer origin = infoService.getMemberIdByName(member);
        if (origin == null && !"".equals(member)) {
            origin = 0;
        }
        int count = outMapper.getOutOrderCountByParams(id, origin);
        map.put("count", count);
        List<OrderVo> orderList = outMapper.getOutOderInfoByParams(id, origin, page, limit);
        String str = "";
        double sum = 0;
        for (OrderVo orderVo :
                orderList) {
            if ("5".equals(orderVo.getStatus())) {
                orderVo.setStatus("未审核");
            }else if("6".equals(orderVo.getStatus()) || "7".equals(orderVo.getStatus())) {
                orderVo.setStatus("已转售前");
            }
//            else if("2".equals(orderVo.getStatus())) {
//                orderVo.setStatus("已转采购");
//            }
            str = "";
            sum = 0;
            List<OrderLIstVo> orderLIstVos = orderVo.getOrderLIstVos();
            for (OrderLIstVo o :
                    orderLIstVos) {
                sum = sum + o.getPrice() * o.getNumber();
                str = str+ o.getGoodsName() + "，" ;
            }
            orderVo.setMoneyAmount(sum);
            str = str.substring(0, str.length() - 1);
            orderVo.setAllGoodsName(str);
        }
        map.put("goodsName", str);

        map.put("data", orderList);
        return map;
    }

    @Override
    public int verifyOrderById(BigInteger id) {
        AssertUtil.isTrue(id.equals(1), "数据异常，请重新点击审核！");
        int orderStatusById = outMapper.getOrderStatusById(id);
        AssertUtil.isTrue(orderStatusById == 6 || orderStatusById == 7, "此订单已经完成审核转入售前处理！");
        outMapper.verifyOrderById(id);
        return 1;
    }

    @Override
    public void getOrderStatusById(BigInteger id) {
        int status = outMapper.getOrderStatusById(id);
        AssertUtil.isTrue(status == 6 || status == 7, "已转售前的订单无法编辑！");
    }

    @Override
    @Transactional
    public int addOrder(OrderVo orderVo) {
        Order order = new Order();
        order.setId(orderVo.getId());
        order.setList(IdWorker.getNextId(1,1,1));
        order.setStatus(5);
        order.setDeleteFlag(0);
        order.setType(1);
        order.setOrigin(Integer.parseInt(orderVo.getOrigin()));
        order.setCreateTime(new Date());
        order.setAccountId(Integer.parseInt(orderVo.getAccount()));
        order.setRemark(orderVo.getRemark());
        order.setHandsPersonId(Integer.parseInt(orderVo.getHandsPerson()));
        String[] split = orderVo.getAllGoodsName().split(",");
        for (String str :
                split) {
            String[] strings = str.replace(" ", "").split("-");
            purchaseMapper.addOrderList(order.getList(), Integer.parseInt(strings[0]));
        }
        int i = purchaseMapper.addOrder(order);
        return i;
    }

    @Override
    public Map<String, Object> getSaleInfoByPage(int page, int limit) {
        page = (page - 1) * limit;
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        int count = outMapper.getSaleCountByPage();
        map.put("count", count);
        List<OrderVo> orderList = outMapper.getSaleInfoByPage(page, limit);
        String str = "";
        double sum = 0;
        for (OrderVo orderVo :
                orderList) {
            if ("6".equals(orderVo.getStatus())) {
                orderVo.setStatus("售前审核中");
            } else if ("7".equals(orderVo.getStatus())) {
                orderVo.setStatus("已销售出库");
            } else {
                orderVo.setStatus("状态异常");
            }
//            else if("2".equals(orderVo.getStatus())) {
//                orderVo.setStatus("已转采购");
//            }
            str = "";
            sum = 0;
            List<OrderLIstVo> orderLIstVos = orderVo.getOrderLIstVos();
            for (OrderLIstVo o :
                    orderLIstVos) {
                sum = sum + o.getPrice() * o.getNumber();
                str = str+ o.getGoodsName() + "，" ;
            }
            orderVo.setMoneyAmount(sum);
            str = str.substring(0, str.length() - 1);
            orderVo.setAllGoodsName(str);
        }
        map.put("goodsName", str);

        map.put("data", orderList);
        return map;
    }

    @Override
    public Map<String, Object> getSaleInfoByParams(String sertchParams, int page, int limit) {
        OutOrderSearchParamsVo outOrderSearchParamsVo = JSON.parseObject(sertchParams,OutOrderSearchParamsVo.class);
        BigInteger id = outOrderSearchParamsVo.getId();
        String member = outOrderSearchParamsVo.getMember();
        page = (page - 1) * limit;
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);

        Integer origin = infoService.getMemberIdByName(member);
        if (origin == null && !"".equals(member)) {
            origin = 0;
        }

        int count = outMapper.getSaleCountByParams(id, origin);
        map.put("count", count);
        List<OrderVo> orderList = outMapper.getSaleInfoByParams(id, origin, page, limit);
        String str = "";
        double sum = 0;
        for (OrderVo orderVo :
                orderList) {
            if ("6".equals(orderVo.getStatus())) {
                orderVo.setStatus("售前审核中");
            } else if ("7".equals(orderVo.getStatus())) {
                orderVo.setStatus("已销售出库");
            } else {
                orderVo.setStatus("状态异常");
            }
//            else if("2".equals(orderVo.getStatus())) {
//                orderVo.setStatus("已转采购");
//            }
            str = "";
            sum = 0;
            List<OrderLIstVo> orderLIstVos = orderVo.getOrderLIstVos();
            for (OrderLIstVo o :
                    orderLIstVos) {
                sum = sum + o.getPrice() * o.getNumber();
                str = str+ o.getGoodsName() + "，" ;
            }
            orderVo.setMoneyAmount(sum);
            str = str.substring(0, str.length() - 1);
            orderVo.setAllGoodsName(str);
        }
        map.put("goodsName", str);

        map.put("data", orderList);
        return map;
    }

    @Override
    @Transactional
    public void completeOrderById(BigInteger id, Authentication authentication) {
        int orderStatus = purchaseMapper.getOrderStatusById(id);
        AssertUtil.isTrue(id == null, "数据异常，请重新操作！");
        AssertUtil.isTrue(orderStatus == 7, "此订单已完成销售并成功出库！");

        Order order = purchaseMapper.getOrderById(id);
        List<OrderList> orderLists = purchaseMapper.getOrderListById(order.getList());
        BigDecimal money = new BigDecimal("0");
        BigDecimal price = BigDecimal.valueOf(0);
        BigDecimal number = BigDecimal.valueOf(0);
        BigDecimal result = BigDecimal.valueOf(0);
        String name = authentication.getName();
        Admin admin = adminService.getAdminByusername(name);
        int adminId = admin.getId();
        StoreLog storeLog = new StoreLog();
        for (OrderList o :
                orderLists) {
            price = new BigDecimal(o.getPrice());
            number = new BigDecimal(o.getNumber());
            result = price.multiply(number);
            money = money.add(result);
            StoreInventory storeInventory = purchaseMapper.getStoreInventoryByGSId(o.getGoodsId(), o.getStoreId());

            AssertUtil.isTrue(storeInventory == null, o.getGoodsId() + "号仓库内" + o.getGoodsId() +
                    "号商品库存不足，剩余" + storeInventory.getInventory() + "件！"); // 说明此时指定仓库内没有该商品，直接提示指定仓库内该商品库存不足

            storeInventory.setInventory(storeInventory.getInventory() - o.getNumber());
            purchaseMapper.updStoreInventory(o.getGoodsId(), o.getStoreId(), storeInventory.getInventory());

            storeLog.setGoodsId(o.getGoodsId());
            storeLog.setNumber(o.getNumber());
            storeLog.setPerson(adminId);
            storeLog.setStoreId(o.getStoreId());
            storeLog.setType(1);
            storeLog.setDate(new Date());
            purchaseMapper.addStoreLog(storeLog);
        }
        OrderLog orderLog = new OrderLog();
        orderLog.setMoney(money);
        orderLog.setType(2);
        orderLog.setOrderId(id);
        orderLog.setOrigin(order.getOrigin());
        orderLog.setDate(new Date());
        orderLog.setAccount(order.getAccountId());
        purchaseMapper.addOrderLog(orderLog);

        AccountVo accountInfoById = infoService.getAccountInfoById(order.getAccountId());
        double nowMoney = Double.parseDouble(accountInfoById.getNowMoney());
//        BigDecimal bigDecimal = BigDecimal.valueOf(nowMoney);
        BigDecimal bigDecimal = new BigDecimal(nowMoney);
        money = bigDecimal.add(money);
        infoService.updAccountNowMoneyById(accountInfoById.getId(), money);
        outMapper.completeOrderById(id);
    }

    @Override
    public Map<String, Object> getReturnOutOrderInfoByPage(int page, int limit) {
        page = (page - 1) * limit;
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        int count = outMapper.getReturnOutOrderCountByPage();
        map.put("count", count);
        List<OrderVo> orderList = outMapper.getReturnInOderInfoByPage(page, limit);
        String str = "";
        double sum = 0;
        for (OrderVo orderVo :
                orderList) {
            if ("8".equals(orderVo.getStatus())) {
                orderVo.setStatus("未审核");
            }else if("9".equals(orderVo.getStatus())) {
                orderVo.setStatus("已退货入库");
            }
//            else if("2".equals(orderVo.getStatus())) {
//                orderVo.setStatus("已转采购");
//            }
            str = "";
            sum = 0;
            List<OrderLIstVo> orderLIstVos = orderVo.getOrderLIstVos();
            for (OrderLIstVo o :
                    orderLIstVos) {
                sum = sum + o.getPrice() * o.getNumber();
                str = str+ o.getGoodsName() + "，" ;
            }
            orderVo.setMoneyAmount(sum);
            str = str.substring(0, str.length() - 1);
            orderVo.setAllGoodsName(str);
        }
        map.put("goodsName", str);

        map.put("data", orderList);
        return map;
    }

    @Override
    public Map<String, Object> getReturnOutOrderInfoByParams(String sertchParams, int page, int limit) {
        OutOrderSearchParamsVo outOrderSearchParamsVo = JSON.parseObject(sertchParams,OutOrderSearchParamsVo.class);
        BigInteger id = outOrderSearchParamsVo.getId();
        String member = outOrderSearchParamsVo.getMember();
        page = (page - 1) * limit;
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);

        Integer origin = infoService.getMemberIdByName(member);
        if (origin == null && !"".equals(member)) {
            origin = 0;
        }

        int count = outMapper.getReturnOutOrderCountByParams(id, origin);
        map.put("count", count);
        List<OrderVo> orderList = outMapper.getReturnOutOderInfoByParams(id, origin, page, limit);
        String str = "";
        double sum = 0;
        for (OrderVo orderVo :
                orderList) {
            if ("8".equals(orderVo.getStatus())) {
                orderVo.setStatus("未审核");
            }else if("9".equals(orderVo.getStatus())) {
                orderVo.setStatus("已退货入库");
            }
//            else if("2".equals(orderVo.getStatus())) {
//                orderVo.setStatus("已转采购");
//            }
            str = "";
            sum = 0;
            List<OrderLIstVo> orderLIstVos = orderVo.getOrderLIstVos();
            for (OrderLIstVo o :
                    orderLIstVos) {
                sum = sum + o.getPrice() * o.getNumber();
                str = str+ o.getGoodsName() + "，" ;
            }
            orderVo.setMoneyAmount(sum);
            str = str.substring(0, str.length() - 1);
            orderVo.setAllGoodsName(str);
        }
        map.put("goodsName", str);

        map.put("data", orderList);
        return map;

    }

    @Override
    public int addReturnOutOrder(OrderVo orderVo) {
        Order order = new Order();
        order.setId(orderVo.getId());
        order.setList(IdWorker.getNextId(1,1,1));
        order.setStatus(8);
        order.setDeleteFlag(0);
        order.setType(1);
        order.setOrigin(Integer.parseInt(orderVo.getOrigin()));
        order.setCreateTime(new Date());
        order.setAccountId(Integer.parseInt(orderVo.getAccount()));
        order.setRemark(orderVo.getRemark());
        order.setHandsPersonId(Integer.parseInt(orderVo.getHandsPerson()));
        String[] split = orderVo.getAllGoodsName().split(",");
        for (String str :
                split) {
            String[] strings = str.replace(" ", "").split("-");
            purchaseMapper.addOrderList(order.getList(), Integer.parseInt(strings[0]));
        }
        int i = purchaseMapper.addOrder(order);
        return i;
    }

    @Override
    @Transactional
    public void delAllReturnOutOrder(List<OrderVo> orderVos) {
        AssertUtil.isTrue(orderVos.size() == 0, "请选择要删除的数据！");
        for (OrderVo o :
                orderVos) {
            AssertUtil.isTrue("已退货入库".equals(o.getStatus()), "要删除的数据包含已经退货出库的订单，批量删除失败！");
            purchaseMapper.delOrderById(o.getId());
        }
    }

    @Override
    public void getReturnOutOrderStatusById(BigInteger id) {
        int status = purchaseMapper.getOrderStatusById(id);
        AssertUtil.isTrue(status == 9, "已处理完成的退货订单无法编辑！");
    }

    @Override
    @Transactional
    public void verifyReturnOutOrder(BigInteger id, Authentication authentication) {
        int orderStatusById = purchaseMapper.getOrderStatusById(id);
        AssertUtil.isTrue(id == null,  "数据提交异常，请重试！");
        AssertUtil.isTrue(orderStatusById == 9, "该订单已经审核入库，完成退货！");
        AssertUtil.isTrue(orderStatusById != 8, "订单状态异常，请检查订单状态！");
//        OrderVo orderInfo = purchaseMapper.getOrderInfoById(id);
        Order order = purchaseMapper.getOrderById(id);
        List<OrderList> orderLists = purchaseMapper.getOrderListById(order.getList());
        BigDecimal money = new BigDecimal("0");
        BigDecimal price = BigDecimal.valueOf(0);
        BigDecimal number = BigDecimal.valueOf(0);
        BigDecimal result = BigDecimal.valueOf(0);
        String name = authentication.getName();
        Admin admin = adminService.getAdminByusername(name);
        int adminId = admin.getId();
        StoreLog storeLog = new StoreLog();
        for (OrderList o :
                orderLists) {
            price = new BigDecimal(o.getPrice());
            number = new BigDecimal(o.getNumber());
            AssertUtil.isTrue(number.compareTo(BigDecimal.valueOf(0)) <= 0,"订单内存在商品数量为0，审核失败！");
            AssertUtil.isTrue(price.compareTo(BigDecimal.valueOf(0)) <= 0,"订单内存在商品价格错误，审核失败！");
            result = price.multiply(number);
            money = money.add(result);
            StoreInventory storeInventory = purchaseMapper.getStoreInventoryByGSId(o.getGoodsId(), o.getStoreId());
            if (storeInventory == null) {//说明此时指定仓库内没有该商品，应该直接插入数据
                StoreInventory sInventory = new StoreInventory();
                sInventory.setGoodsId(o.getGoodsId());
                sInventory.setInventory(o.getNumber());
                sInventory.setStoreId(o.getStoreId());
                purchaseMapper.addStoreInventory(sInventory);
            } else {
            int nowInventory = storeInventory.getInventory() + o.getNumber();
            storeInventory.setInventory(nowInventory);
            purchaseMapper.updStoreInventory(o.getGoodsId(), o.getStoreId(), storeInventory.getInventory());
            }
            storeLog.setGoodsId(o.getGoodsId());
            storeLog.setNumber(o.getNumber());
            storeLog.setPerson(adminId);
            storeLog.setStoreId(o.getStoreId());
            storeLog.setType(7);//7代表销售退货入库
            storeLog.setDate(new Date());
            purchaseMapper.addStoreLog(storeLog);
        }
        OrderLog orderLog = new OrderLog();
        orderLog.setMoney(money);
        orderLog.setType(3); // 3代表销售退货
        orderLog.setOrderId(id);
        orderLog.setOrigin(order.getOrigin());
        orderLog.setDate(new Date());
        orderLog.setAccount(order.getAccountId());
        purchaseMapper.addOrderLog(orderLog);

        AccountVo accountInfoById = infoService.getAccountInfoById(order.getAccountId());
        double nowMoney = Double.parseDouble(accountInfoById.getNowMoney());
//        BigDecimal bigDecimal = BigDecimal.valueOf(nowMoney);
        BigDecimal bigDecimal = new BigDecimal(nowMoney);
        money = bigDecimal.subtract(money);
        AssertUtil.isTrue(money.compareTo(BigDecimal.valueOf(0)) < 0, accountInfoById.getName() + " 卡内余额不足！");
        infoService.updAccountNowMoneyById(accountInfoById.getId(), money);
        outMapper.verifyReturnOutOrder(id);
    }

}
