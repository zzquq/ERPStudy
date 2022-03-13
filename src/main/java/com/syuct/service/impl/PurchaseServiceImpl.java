package com.syuct.service.impl;

import com.alibaba.fastjson.JSON;
import com.syuct.mapper.PurchaseMapper;
import com.syuct.pojo.*;
import com.syuct.pojo.vo.AccountVo;
import com.syuct.pojo.vo.OrderLIstVo;
import com.syuct.pojo.vo.OrderVo;
import com.syuct.pojo.vo.searchParamsVo.InOrderSearchParamsVo;
import com.syuct.service.AdminService;
import com.syuct.service.CommodityService;
import com.syuct.service.InfoService;
import com.syuct.service.PurchaseService;
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
 * @Date 2022/2/23 11:45
 * @Version 1.0
 **/
@Service
public class PurchaseServiceImpl implements PurchaseService {

    @Autowired
    private PurchaseMapper purchaseMapper;

    @Autowired
    private CommodityService commodityService;

    @Autowired
    private InfoService infoService;

    @Autowired
    private AdminService adminService;

    @Override
    public Map<String, Object> getOrderInfoByPage(int page, int limit) {
        page = (page - 1) * limit;
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        int count = purchaseMapper.getInOrderCountByPage();
        map.put("count", count);
        List<OrderVo> orderList = purchaseMapper.getInOderInfoByPage(page, limit);
        String str = "";
        double sum = 0;
        for (OrderVo orderVo :
                orderList) {
            if ("0".equals(orderVo.getStatus())) {
                orderVo.setStatus("未审核");
            }else if("1".equals(orderVo.getStatus()) || "2".equals(orderVo.getStatus())) {
                orderVo.setStatus("已转采购");
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
    public Map<String, Object> getOrderInfoByParams(String sertchParams, int page, int limit) {
        InOrderSearchParamsVo inOrderSearchParamsVo = JSON.parseObject(sertchParams,InOrderSearchParamsVo.class);
        BigInteger id = inOrderSearchParamsVo.getId();
        String supplier = inOrderSearchParamsVo.getSupplier();
        page = (page - 1) * limit;
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
//        int origin = 0;
//        if (supplier != null) {
//            origin = infoService.getSupplierIdByName(supplier);
//        }
        Integer origin = infoService.getSupplierIdByName(supplier);
//        AssertUtil.isTrue(origin == null,  "请输入正确的供应商名称！");
        if (origin == null && !"".equals(supplier)) {
            origin = 0;
        }
        int count = purchaseMapper.getInOrderCountByParams(id, origin);
        map.put("count", count);
        List<OrderVo> orderList = purchaseMapper.getInOderInfoByParams(id, origin, page, limit);
        String str = "";
        double sum = 0;
        for (OrderVo orderVo :
                orderList) {
            if ("0".equals(orderVo.getStatus())) {
                orderVo.setStatus("未审核");
            }else if("1".equals(orderVo.getStatus()) || "2".equals(orderVo.getStatus())) {
                orderVo.setStatus("已转采购");
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
    public Map<String, Object> getOrderListInfo(BigInteger listId) {
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        int count = purchaseMapper.getOrderListInfoCount(listId);
        map.put("count", count);
        List<OrderLIstVo> orderLIstVos = purchaseMapper.getOrderListInfoById(listId);
        int i = 1;
        for (OrderLIstVo orderList :
                orderLIstVos) {
            orderList.setId(i++);
            orderList.setSumPrice(orderList.getPrice() * orderList.getNumber());
        }
        map.put("data", orderLIstVos);
        return map;
    }

    @Override
    public BigInteger getOrderListIdByOrderId(BigInteger id) {
        BigInteger listId = purchaseMapper.getOrderListIdByOrderId(id);
        return listId;
    }

    @Override
    @Transactional
    public int verifyOrderById(BigInteger id) {
        AssertUtil.isTrue(id.equals(1), "数据异常，请重新点击审核！");
        int orderStatusById = purchaseMapper.getOrderStatusById(id);
        AssertUtil.isTrue(orderStatusById == 1 || orderStatusById == 2, "此订单已经完成审核转入采购！");
        purchaseMapper.verifyOrderById(id);
        return 1;
    }

    @Override
    @Transactional
    public int addOrder(OrderVo orderVo) {
        Order order = new Order();
        order.setId(orderVo.getId());
        order.setList(IdWorker.getNextId(1,1,1));
        order.setStatus(0);
        order.setDeleteFlag(0);
        order.setType(0);
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
    public Map<String, Object> getOrderListInfoByPage(BigInteger orderId, int page, int limit) {
//        purchaseMapper.getOrderListInfoByPage()
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        BigInteger orderListId = purchaseMapper.getOrderListIdByOrderId(orderId);
        int count = purchaseMapper.getOrderListInfoCount(orderListId);
        map.put("count", count);
        List<OrderLIstVo> orderListInfo = purchaseMapper.getOrderListInfoById(orderListId);
        for (OrderLIstVo o :
                orderListInfo) {
            o.setSumPrice(o.getPrice() * o.getNumber());
        }
        map.put("data", orderListInfo);
        return map;
    }

    @Override
    public OrderLIstVo getOrderListInfoById(int id) {
        OrderLIstVo orderLIstVo = purchaseMapper.getOrderListIdById(id);
        return orderLIstVo;
    }

    @Override
    public int editOrderListItem(OrderLIstVo orderLIstVo) {
        OrderList orderList = new OrderList();
        orderList.setId(orderLIstVo.getId());
        orderList.setOrderId(orderLIstVo.getOrderId());
        orderList.setNumber(orderLIstVo.getNumber());
        orderList.setPrice(orderLIstVo.getPrice());

        try {
            orderList.setStoreId(Integer.parseInt(orderLIstVo.getStoreName()));
        } catch (NumberFormatException e) {
            Store store = infoService.getStoreInfoByName(orderLIstVo.getStoreName());
            orderList.setStoreId(store.getId());
        }
        int i = purchaseMapper.editOrderListItem(orderList);
        return i;

    }

    @Override
    public void getOrderStatusById(BigInteger id) {
        int status = purchaseMapper.getOrderStatusById(id);
        AssertUtil.isTrue(status == 1 || status == 2, "已转采购的订单无法编辑！");
    }

    @Override
    public void getReturnInOrderStatusById(BigInteger id) {
        int status = purchaseMapper.getOrderStatusById(id);
        AssertUtil.isTrue(status == 4, "已处理完成的退货订单无法编辑！");
    }

    @Override
    @Transactional
    public void delAllOrder(List<OrderVo> orderVos) {
        AssertUtil.isTrue(orderVos.size() == 0, "请先选择数据！");
        for (OrderVo orderVo :
                orderVos) {
            AssertUtil.isTrue("已转售前".equals(orderVo.getStatus() ) || "已转销售".equals(orderVo.getStatus()), "数据异常，删除时只能选择未审核审核订单！");
            purchaseMapper.delOrderById(orderVo.getId());
            purchaseMapper.delOrderListByOrderId(orderVo.getList());

        }
    }


    @Override
    public Map<String, Object> getEnterInfoByPage(int page, int limit) {
        page = (page - 1) * limit;
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        int count = purchaseMapper.getEnterCountByPage();
        map.put("count", count);
        List<OrderVo> orderList = purchaseMapper.getEnterInfoByPage(page, limit);
        String str = "";
        double sum = 0;
        for (OrderVo orderVo :
                orderList) {
            if ("1".equals(orderVo.getStatus())) {
                orderVo.setStatus("采购中");
            } else if ("2".equals(orderVo.getStatus())) {
                orderVo.setStatus("已入库");
            } else {
                orderVo.setStatus("异常");
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
    public Map<String, Object> getEnterInfoByParams(String sertchParams, int page, int limit) {
        InOrderSearchParamsVo inOrderSearchParamsVo = JSON.parseObject(sertchParams,InOrderSearchParamsVo.class);
        BigInteger id = inOrderSearchParamsVo.getId();
        String supplier = inOrderSearchParamsVo.getSupplier();
        page = (page - 1) * limit;
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
//        int origin = 0;
//        if (supplier != null) {
//            origin = infoService.getSupplierIdByName(supplier);
//        }
        Integer origin = infoService.getSupplierIdByName(supplier);
//        AssertUtil.isTrue(origin == null,  "请输入正确的供应商名称！");
        if (origin == null && !"".equals(supplier)) {
            origin = 0;
        }
        int count = purchaseMapper.getEnterCountByParams(id, origin);
        map.put("count", count);
        List<OrderVo> orderList = purchaseMapper.getEnterInfoByParams(id, origin, page, limit);
        String str = "";
        double sum = 0;
        for (OrderVo orderVo :
                orderList) {
            if ("1".equals(orderVo.getStatus())) {
                orderVo.setStatus("采购中");
            }else if("2".equals(orderVo.getStatus())) {
                orderVo.setStatus("已入库");
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
        AssertUtil.isTrue(orderStatus == 2, "此订单已完成采购并成功入库！");

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
            if (storeInventory == null) {//说明此时指定仓库内没有该商品，应该直接插入数据
                StoreInventory sInventory = new StoreInventory();
                sInventory.setGoodsId(o.getGoodsId());
                sInventory.setInventory(o.getNumber());
                sInventory.setStoreId(o.getStoreId());
                purchaseMapper.addStoreInventory(sInventory);
            } else {
                storeInventory.setInventory(storeInventory.getInventory() + o.getNumber());
                purchaseMapper.updStoreInventory(o.getGoodsId(), o.getStoreId(), storeInventory.getInventory());
            }
            storeLog.setGoodsId(o.getGoodsId());
            storeLog.setNumber(o.getNumber());
            storeLog.setPerson(adminId);
            storeLog.setStoreId(o.getStoreId());
            storeLog.setType(0);
            storeLog.setDate(new Date());
            purchaseMapper.addStoreLog(storeLog);
        }
        OrderLog orderLog = new OrderLog();
        orderLog.setMoney(money);
        orderLog.setType(0);
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
        purchaseMapper.completeOrderById(id);
    }


    /***
     * 采购退货
     * @param orderVo
     * @return
     */
    @Override
    @Transactional
    public int addReturnInOrder(OrderVo orderVo) {
        Order order = new Order();
        order.setId(orderVo.getId());
        order.setList(IdWorker.getNextId(1,1,1));
        order.setStatus(3);
        order.setDeleteFlag(0);
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
    public Map<String, Object> getReturnInOrderInfoByPage(int page, int limit) {
        page = (page - 1) * limit;
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        int count = purchaseMapper.getReturnInOrderCountByPage();
        map.put("count", count);
        List<OrderVo> orderList = purchaseMapper.getReturnInOderInfoByPage(page, limit);
        String str = "";
        double sum = 0;
        for (OrderVo orderVo :
                orderList) {
            if ("3".equals(orderVo.getStatus())) {
                orderVo.setStatus("未审核");
            }else if("4".equals(orderVo.getStatus())) {
                orderVo.setStatus("已退货出库");
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
    public Map<String, Object> getReturnInOrderInfoByParams(String sertchParams, int page, int limit) {
        InOrderSearchParamsVo inOrderSearchParamsVo = JSON.parseObject(sertchParams,InOrderSearchParamsVo.class);
        BigInteger id = inOrderSearchParamsVo.getId();
        String supplier = inOrderSearchParamsVo.getSupplier();
        page = (page - 1) * limit;
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
//        int origin = 0;
//        if (supplier != null) {
//            origin = infoService.getSupplierIdByName(supplier);
//        }
        Integer origin = infoService.getSupplierIdByName(supplier);
//        AssertUtil.isTrue(origin == null,  "请输入正确的供应商名称！");
        if (origin == null && !"".equals(supplier)) {
            origin = 0;
        }
        int count = purchaseMapper.getReturnInOrderCountByParams(id, origin);
        map.put("count", count);
        List<OrderVo> orderList = purchaseMapper.getReturnInOderInfoByParams(id, origin, page, limit);
        String str = "";
        double sum = 0;
        for (OrderVo orderVo :
                orderList) {
            if ("3".equals(orderVo.getStatus())) {
                orderVo.setStatus("未审核");
            }else if("4".equals(orderVo.getStatus())) {
                orderVo.setStatus("已退货出库");
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
    public int editReturnInOrderListItem(OrderLIstVo orderLIstVo) {

        OrderList orderList = new OrderList();
        orderList.setId(orderLIstVo.getId());
        orderList.setOrderId(orderLIstVo.getOrderId());
        orderList.setNumber(orderLIstVo.getNumber());
        orderList.setPrice(orderLIstVo.getPrice());
        int storeId = 0;
        try {
            storeId = Integer.parseInt(orderLIstVo.getStoreName());
            orderList.setStoreId(storeId);
        } catch (NumberFormatException e) {
            Store store = infoService.getStoreInfoByName(orderLIstVo.getStoreName());
            storeId = store.getId();
            orderList.setStoreId(storeId);
        }
        int goodsId = purchaseMapper.getOrderListGoodsIdById(orderLIstVo.getId());
        StoreInventory storeInventoryByGSId = purchaseMapper.getStoreInventoryByGSId(goodsId, storeId);
        AssertUtil.isTrue(storeInventoryByGSId == null, storeId + "号仓库库存不足，请重新处理！");
        AssertUtil.isTrue(storeInventoryByGSId.getInventory() < orderList.getNumber(), storeId + "号仓库库存不足，请重新处理！");
        int i = purchaseMapper.editOrderListItem(orderList);
        return i;

    }

    @Override
    @Transactional
    public void verifyReturnInOrder(BigInteger id, Authentication authentication) {
        int orderStatusById = purchaseMapper.getOrderStatusById(id);
        AssertUtil.isTrue(id == null,  "数据提交异常，请重试！");
        AssertUtil.isTrue(orderStatusById == 4, "该订单已经审核出库，完成退货！");
        AssertUtil.isTrue(orderStatusById != 3, "订单状态异常，请检查订单状态！");
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
            System.out.println("number = " + number);
            System.out.println("price = " + price);
            AssertUtil.isTrue(number.compareTo(BigDecimal.valueOf(0)) <= 0,"订单内存在商品数量为0，审核失败！");
            AssertUtil.isTrue(price.compareTo(BigDecimal.valueOf(0)) <= 0,"订单内存在商品价格错误，审核失败！");
            result = price.multiply(number);
            money = money.add(result);
            StoreInventory storeInventory = purchaseMapper.getStoreInventoryByGSId(o.getGoodsId(), o.getStoreId());
//            if (storeInventory == null) {//说明此时指定仓库内没有该商品，应该直接插入数据
//                StoreInventory sInventory = new StoreInventory();
//                sInventory.setGoodsId(o.getGoodsId());
//                sInventory.setInventory(o.getNumber());
//                sInventory.setStoreId(o.getStoreId());
//                purchaseMapper.addStoreInventory(sInventory);
//            } else {
            AssertUtil.isTrue(storeInventory == null, o.getGoodsId() + "号仓库没有该商品！");
            int nowInventory = storeInventory.getInventory() - o.getNumber();
            AssertUtil.isTrue(nowInventory < 0, "订单内" + o.getId()+ "号商品库存不足！");
            storeInventory.setInventory(nowInventory);
            purchaseMapper.updStoreInventory(o.getGoodsId(), o.getStoreId(), storeInventory.getInventory());
//            }
            storeLog.setGoodsId(o.getGoodsId());
            storeLog.setNumber(o.getNumber());
            storeLog.setPerson(adminId);
            storeLog.setStoreId(o.getStoreId());
            storeLog.setType(8);//8代表采购退货出库
            storeLog.setDate(new Date());
            purchaseMapper.addStoreLog(storeLog);
        }
        OrderLog orderLog = new OrderLog();
        orderLog.setMoney(money);
        orderLog.setType(1);//1 代表进货订单退货
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
        purchaseMapper.verifyReturnInOrder(id);
    }

    @Override
    @Transactional
    public void delAllReturnInOrder(List<OrderVo> orderVos) {
        AssertUtil.isTrue(orderVos.size() == 0, "请选择要删除的数据！");
        for (OrderVo o :
                orderVos) {
           AssertUtil.isTrue("已退货出库".equals(o.getStatus()), "要删除的数据包含已经退货出库的订单，批量删除失败！");
           purchaseMapper.delOrderById(o.getId());
        }
    }
}
