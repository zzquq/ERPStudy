package com.syuct.controller;

import com.alibaba.fastjson.JSON;
import com.syuct.config.annotation.Log;
import com.syuct.model.RespBean;
import com.syuct.pojo.Admin;
import com.syuct.pojo.Order;
import com.syuct.pojo.Test01;
import com.syuct.pojo.Test02;
import com.syuct.pojo.vo.OrderLIstVo;
import com.syuct.pojo.vo.OrderVo;
import com.syuct.pojo.vo.searchParamsVo.GoodsSearchParamsVo;
import com.syuct.pojo.vo.searchParamsVo.StoreSearchParamsVo;
import com.syuct.service.AdminService;
import com.syuct.service.CommodityService;
import com.syuct.service.InfoService;
import com.syuct.service.PurchaseService;
import com.syuct.utils.IdWorker;
import org.aspectj.weaver.ast.Test;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author Zsz
 * @Date 2022/2/22 10:20
 * @Version 1.0
 **/
@Controller
@RequestMapping("/purchase")
public class PurchaseController {

    @Autowired
    private PurchaseService purchaseService;

    @Autowired
    private InfoService infoService;

    @Autowired
    private AdminService adminService;
    @Autowired
    private CommodityService commodityService;

    @RequestMapping("/order")
    public String getOrderPage() {
        return "/page/purchase/order/table";
    }

    @RequestMapping("/orderInfo")
    @ResponseBody
    public Map<String, Object> getOrderInfo(@RequestParam(value = "page") int page,
                                             @RequestParam(value = "limit") int limit,
                                             @RequestParam(value = "searchParams", required = false) String sertchParams) {
        if (sertchParams == null) {
            Map<String, Object> map = purchaseService.getOrderInfoByPage(page, limit);
            return map;
        } else {
            Map<String, Object> map = purchaseService.getOrderInfoByParams(sertchParams, page, limit);
            return map;
        }

    }


    @RequestMapping("getOrderListPage")
    public String getOrderListPage(BigInteger id, HttpServletRequest request, Model model) {
        BigInteger listId = purchaseService.getOrderListIdByOrderId(id);
        request.getSession().setAttribute("listId", listId);
        request.getSession().setAttribute("orderId", id);
        model.addAttribute("orderId", request.getSession().getAttribute("orderId"));
        return "/page/purchase/order/orderList";
    }

    @RequestMapping("orderListInfo")
    @ResponseBody
    public Map<String, Object> getOrderListInfo(HttpServletRequest request) {
        BigInteger listId = (BigInteger) request.getSession().getAttribute("listId");
        Map<String, Object> map = purchaseService.getOrderListInfo(listId);
        return map;
    }

    @RequestMapping("verifyOrder")
    @ResponseBody
    public RespBean verifyOrderById(BigInteger id) {
        int i = purchaseService.verifyOrderById(id);
        if (i == 1) {
            return RespBean.success("审核成功！");
        } else {
            return RespBean.err("审核失败！");
        }
    }

    @RequestMapping("getAddOrderPage")
    public String getAddOrderPage(Model model) {
        BigInteger nextId = IdWorker.getNextId(1, 1, 1);
        model.addAttribute("orderId", nextId);
        return "/page/purchase/order/add";
    }

    @RequestMapping("getAccountIdName")
    @ResponseBody
    public Map<String, Object> getAccountIdName(@RequestParam int page,
                                                @RequestParam int limit,
                                                @RequestParam(value = "name", required = false) String searchParams){
//        AccountSearchParamsVo accountSearchParamsVo = JSON.parseObject(searchParams, AccountSearchParamsVo.class);
        if (searchParams == null) {
            Map<String, Object> map = infoService.getAccountIdName(page, limit);
            return map;
        } else {
            Map<String, Object> map = infoService.getAccountIdName(page, limit, searchParams);
            return map;
        }
    }

    @RequestMapping("getSystemAccountIdName")
    @ResponseBody
    public Map<String, Object> getSystemAccountIdName(@RequestParam int page,
                                                @RequestParam int limit,
                                                @RequestParam(value = "name", required = false) String searchParams){
//        AccountSearchParamsVo accountSearchParamsVo = JSON.parseObject(searchParams, AccountSearchParamsVo.class);
        if (searchParams == null) {
            Map<String, Object> map = infoService.getSystemAccountIdName(page, limit);
            return map;
        } else {
            Map<String, Object> map = infoService.getSystemAccountIdName(page, limit, searchParams);
            return map;
        }
    }


    @RequestMapping("getSupplierIdName")
    @ResponseBody
    public Map<String, Object> getSupplierIdName(@RequestParam int page,
                                                 @RequestParam int limit,
                                                 @RequestParam(value = "name", required = false) String name) {
        if (name == null) {
            Map<String, Object> map = commodityService.getSupplierIdNameByPage(page, limit);
            return map;
        } else {
            Map<String, Object> map = commodityService.getSupplierIdNameByParam(page, limit, name);
            return map;
        }
    }

    @RequestMapping("goodsInfo")
    @ResponseBody
    public Map<String, Object> getAllGoodsName(@RequestParam int page,
                                               @RequestParam int limit,
                                               @RequestParam(value = "name", required = false) String name) {
        if (name == null) {
            Map<String, Object> map = commodityService.getGoodInfoBypage(page, limit);
            return map;
        } else {
            Map<String, Object> map = commodityService.getGoodInfoByParams(new GoodsSearchParamsVo(0, name, null), page, limit);
            return map;
        }
    }

    @RequestMapping("addOrder")
    @ResponseBody
    public RespBean addOrder(@RequestBody OrderVo orderVo, HttpServletRequest request, Authentication authentication) {
        String name = authentication.getName();
        Admin admin = adminService.getAdminByusername(name);
        orderVo.setHandsPerson(String.valueOf(admin.getId()));
//        Object session_user = request.getSession().getAttribute("session_user");
//        System.out.println(session_user);
        int i = purchaseService.addOrder(orderVo);
        if (i == 1) {
            return RespBean.success("添加成功，商品详情信息请前往编辑页面！");
        } else {
            return RespBean.err("添加失败！");
        }
    }

    @RequestMapping("getEditOrderPage")
    public String getEditOrderPage(BigInteger id, HttpServletRequest request) {
//        purchaseService.getOrderStatusById(id);
        request.getSession().setAttribute("OrderId", id);
        return "/page/purchase/order/orderListTable";
    }

    @RequestMapping("confirmOrderStatus")
    @ResponseBody
    public RespBean confirmOrderStatus(BigInteger id) {
        purchaseService.getOrderStatusById(id);
        return RespBean.success("操作成功！");
    }

    @RequestMapping("editOrderListInfo")
    @ResponseBody
    public Map<String, Object> orderListInfo(int page, int limit, HttpServletRequest request) {
        BigInteger orderId = (BigInteger) request.getSession().getAttribute("OrderId");
        Map<String, Object> map = purchaseService.getOrderListInfoByPage(orderId, page, limit);
        return map;
    }

    @RequestMapping("getEditOrderListPage")
    public String getEditOrderListPage(HttpServletRequest request, int id, Model model) {

        BigInteger orderId = (BigInteger) request.getSession().getAttribute("OrderId");
//        BigInteger orderListIdByOrderId = purchaseService.getOrderListIdByOrderId(orderId);
        OrderLIstVo orderLIstVo = purchaseService.getOrderListInfoById(id);
        model.addAttribute("orderList", orderLIstVo);
        return "/page/purchase/order/editListItem";
    }


    @RequestMapping("getStoreIdName")
    @ResponseBody
    public Map<String, Object> getStoreIdName(@RequestParam int page,
                                            @RequestParam int limit,
                                            @RequestParam(value = "name", required = false) String name) {
        StoreSearchParamsVo storeSearchParamsVo = new StoreSearchParamsVo();
        storeSearchParamsVo.setName(name);
        if ("".equals(storeSearchParamsVo.getName())) {
            Map<String, Object> map = infoService.getStoreInfoByPage(page, limit);
            return map;
        } else {
            Map<String, Object> map = infoService.getStoreInfoByParams(storeSearchParamsVo, page, limit);
            return map;
        }
    }

    @RequestMapping("editOrderListItem")
    @ResponseBody
    public RespBean editOrderListItem(OrderLIstVo orderLIstVo) {
        int i = purchaseService.editOrderListItem(orderLIstVo);
        if (i > 0) {
            return RespBean.success("修改成功！");
        } else {
            return RespBean.err("修改失败！");
        }
    }

    @RequestMapping("delAllOrder")
    @ResponseBody
    public RespBean delAllOrder(@RequestBody List<OrderVo> orderVos) {
        purchaseService.delAllOrder(orderVos);
        return RespBean.success("批量删除成功！");
    }


    @RequestMapping("enter")
    public String getEnterPage() {
        return "/page/purchase/enter/table";
    }

    @RequestMapping("/enterInfo")
    @ResponseBody
    public Map<String, Object> getEnterInfo(@RequestParam(value = "page") int page,
                                            @RequestParam(value = "limit") int limit,
                                            @RequestParam(value = "searchParams", required = false) String sertchParams) {
        if (sertchParams == null) {
            Map<String, Object> map = purchaseService.getEnterInfoByPage(page, limit);
            return map;
        } else {
            Map<String, Object> map = purchaseService.getEnterInfoByParams(sertchParams, page, limit);
            return map;
        }

    }


    @RequestMapping("completeOrder")
    @ResponseBody
    @Log(module = "采购入库", description = "商品入库审核确认")
    public RespBean completeOrder(BigInteger id, Authentication authentication) {
        purchaseService.completeOrderById(id, authentication);
        return RespBean.success("操作成功，订单内容已入库!");
    }



    @RequestMapping("back")
    public String getBackPage() {
        return "/page/purchase/back/table";
    }

    @RequestMapping("getAddReturnInOrderPage")
    public String getAddReturnInOrderPage(Model model) {
        BigInteger nextId = IdWorker.getNextId(1, 1, 1);
        model.addAttribute("orderId", nextId);
        return "/page/purchase/back/add";
    }

    @RequestMapping("delAllReturnInOrder")
    @ResponseBody
    public RespBean delAllReturnInOrder(@RequestBody List<OrderVo> orderVos) {
        purchaseService.delAllReturnInOrder(orderVos);
        return RespBean.success("批量删除成功！");
    }


    @RequestMapping("addReturnInOrder")
    @ResponseBody
    public RespBean addReturnInOrder(@RequestBody OrderVo orderVo, HttpServletRequest request, Authentication authentication) {
        String name = authentication.getName();
        Admin admin = adminService.getAdminByusername(name);
        orderVo.setHandsPerson(String.valueOf(admin.getId()));
//        Object session_user = request.getSession().getAttribute("session_user");
//        System.out.println(session_user);
        int i = purchaseService.addReturnInOrder(orderVo);
        if (i == 1) {
            return RespBean.success("添加成功，需要退货的商品详情信息请前往编辑页面！");
        } else {
            return RespBean.err("添加失败！");
        }
    }

    @RequestMapping("returnInOrderInfo")
    @ResponseBody
    public Map<String, Object> returnInOrderInfo(@RequestParam(value = "page") int page,
                                                @RequestParam(value = "limit") int limit,
                                                @RequestParam(value = "searchParams", required = false) String sertchParams) {
        if (sertchParams == null) {
            Map<String, Object> map = purchaseService.getReturnInOrderInfoByPage(page, limit);
            return map;
        } else {
            Map<String, Object> map = purchaseService.getReturnInOrderInfoByParams(sertchParams, page, limit);
            return map;
        }
    }


    @RequestMapping("confirmReturnInOrderStatus")
    @ResponseBody
    public RespBean confirmReturnInOrderStatus(BigInteger id) {
        purchaseService.getReturnInOrderStatusById(id);
        return RespBean.success("操作成功！");
    }

    @RequestMapping("getEditReturnInOrderPage")
    public String getEditReturnInOrderPage(BigInteger id, HttpServletRequest request) {
//        purchaseService.getOrderStatusById(id);
        request.getSession().setAttribute("OrderId", id);
        return "/page/purchase/back/orderListTable";
    }

    @RequestMapping("getEditReturnInOrderListPage")
    public String getEditReturnInOrderListPage(HttpServletRequest request, int id, Model model) {

        BigInteger orderId = (BigInteger) request.getSession().getAttribute("OrderId");
//        BigInteger orderListIdByOrderId = purchaseService.getOrderListIdByOrderId(orderId);
        OrderLIstVo orderLIstVo = purchaseService.getOrderListInfoById(id);
        model.addAttribute("orderList", orderLIstVo);
        return "/page/purchase/back/editListItem";
    }
    @RequestMapping("verifyReturnInOrder")
    @ResponseBody
    public RespBean verifyReturnInOrder(BigInteger id, Authentication authentication) {
        purchaseService.verifyReturnInOrder(id, authentication);
        return RespBean.success("审核成功，该商品已完成退货出库！");
    }

    @RequestMapping("editReturnInOrderListItem")
    @ResponseBody
    public RespBean editReturnInOrderListItem(OrderLIstVo orderLIstVo) {
        int i = purchaseService.editReturnInOrderListItem(orderLIstVo);
        if (i > 0) {
            return RespBean.success("修改成功！");
        } else {
            return RespBean.err("修改失败！");
        }
    }
}
