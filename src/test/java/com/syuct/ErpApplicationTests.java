package com.syuct;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.syuct.mapper.*;
import com.syuct.pojo.Order;
import com.syuct.pojo.OrderList;
import com.syuct.pojo.StoreInventory;
import com.syuct.pojo.vo.AccountReportVo;
import com.syuct.pojo.vo.GoodsVo;
import com.syuct.pojo.vo.OrderVo;
import com.syuct.service.AdminService;
import com.syuct.service.ReportService;
import com.syuct.service.SystemService;
import com.syuct.utils.IdWorker;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@SpringBootTest
class ErpApplicationTests {

    @Test
    void contextLoads() {
    }

    @Autowired
    private InfoMapper infoMapper;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private SystemService systemService;

    @Autowired
    private AdminMapper adminMapper;
    @Autowired
    private AdminService adminService;

    @Autowired
    private CommodityMapper commodityMapper;

    @Autowired
    private PurchaseMapper purchaseMapper;

    @Autowired
    private ReportService reportService;
    @Autowired
    private ReportMapper reportMapper;
    @Test
    public void test() throws JsonProcessingException {
//        AdminVo adminVo = new AdminVo("test", "231321", "213213", "21321", "321312");
//        adminService.updUserInfo(4,adminVo);
//        String encode = passwordEncoder.encode("123456");
//        System.out.println(encode);
//        Admin admin = new Admin();

//        admin.setUsername("bbbbbbbbbbbbbb");
//        admin.setRole("5");
//        admin.setName("1545545645");
//        int i = systemService.addUser(admin);
//        int id = admin.getId();
//        System.out.println("id:"+id);
//        Map<String, Object> functionInfo = systemService.getFunctionInfo();
//        System.out.println(functionInfo);
//        List<Account> aa = infoMapper.getAccountInfoByPageParam("农业",1, 10);
//        categoryMapper.delCategory(9);


//        List<GoodsVo> aaa = commodityMapper.getGoodsInfoByParams(1, "优", "", 1, 15);
//        System.out.println(aaa);
//
//        IdWorker idWorker = new IdWorker(1,1,1);
//        long l = idWorker.nextId();
//        System.out.println(l);
//        int inOrderCountByPage = purchaseMapper.getInOrderCountByPage();
//        System.out.println(inOrderCountByPage);
//        List<OrderVo> orderList = purchaseMapper.getInOderInfoByPage(0, 15);
//        System.out.println(orderList);
//        List<OrderVo> inOderInfoByParams = purchaseMapper.getInOderInfoByParams(BigInteger.valueOf(0), 2, 0, 15);
//
//        System.out.println(inOderInfoByParams);
//        long a = 252514663366004736L;
//        Order order = purchaseMapper.getOrderById(BigInteger.valueOf(a));
//        List<OrderList> orderLists = purchaseMapper.getOrderListById(order.getList());
//        System.out.println(order);
//        System.out.println(orderLists);
//        StoreInventory storeInventoryByGSId = purchaseMapper.getStoreInventoryByGSId(1, 1);
//        System.out.println(storeInventoryByGSId);
//        BigDecimal money = new BigDecimal(-10000000);
//
//        boolean b = money.compareTo(BigDecimal.valueOf(0)) < 0;
//        System.out.println(b);
//        Map<String, Object> accountReportByPage = reportService.getAccountReportByPage(1, 15);
//
//        System.out.println(accountReportByPage);
//        List<AccountReportVo> accountReportByPage = reportMapper.getAccountReportByPage(0, 15);
//        System.out.println(accountReportByPage);
//        int accountReportCountsByParams = reportMapper.getAccountReportCountsByParams(null, "1");

//        System.out.println(accountReportCountsByParams);


        Integer goodsIdByName = infoMapper.getGoodsIdByName("优酸乳");
        System.out.println(goodsIdByName);
    }
}
