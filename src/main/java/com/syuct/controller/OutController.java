package com.syuct.controller;

import com.alibaba.fastjson.JSON;
import com.syuct.config.annotation.Log;
import com.syuct.model.RespBean;
import com.syuct.pojo.Admin;
import com.syuct.pojo.vo.OrderLIstVo;
import com.syuct.pojo.vo.OrderVo;
import com.syuct.pojo.vo.searchParamsVo.GoodsSearchParamsVo;
import com.syuct.pojo.vo.searchParamsVo.MemberSearchParamsVo;
import com.syuct.pojo.vo.searchParamsVo.StoreSearchParamsVo;
import com.syuct.service.*;
import com.syuct.utils.IdWorker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.math.BigInteger;
import java.util.List;
import java.util.Map;

/**
 * @Author Zsz
 * @Date 2022/2/22 10:20
 * @Version 1.0
 **/
@Controller
@RequestMapping("/out")
public class OutController {

    @Autowired
    private OutService outService;

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
        return "/page/out/order/table";
    }

    @RequestMapping("/orderInfo")
    @ResponseBody
    public Map<String, Object> getOrderInfo(@RequestParam(value = "page") int page,
                                             @RequestParam(value = "limit") int limit,
                                             @RequestParam(value = "searchParams", required = false) String sertchParams) {
        if (sertchParams == null) {
            Map<String, Object> map = outService.getOutOrderInfoByPage(page, limit);
            return map;
        } else {
            Map<String, Object> map = outService.getOutOrderInfoByParams(sertchParams, page, limit);
            return map;
        }

    }


    @RequestMapping("getOrderListPage")
    public String getOrderListPage(BigInteger id, HttpServletRequest request, Model model) {
        BigInteger listId = purchaseService.getOrderListIdByOrderId(id);
        request.getSession().setAttribute("listId", listId);
        request.getSession().setAttribute("orderId", id);
        model.addAttribute("orderId", request.getSession().getAttribute("orderId"));
        return "/page/out/order/orderList";
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
        int i = outService.verifyOrderById(id);
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
        return "/page/out/order/add";
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


    @RequestMapping("getMemberIdName")
    @ResponseBody
    public Map<String, Object> getMemberIdName(@RequestParam int page,
                                                 @RequestParam int limit,
                                                 @RequestParam(value = "name", required = false) String name) {
        if (name == null) {
            Map<String, Object> map = infoService.getMemberInfoByPage(page, limit);
            return map;
        } else {
            Map<String, Object> map = infoService.getMemberInfoByParams(new MemberSearchParamsVo(0, name, null), page, limit);
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
        int i = outService.addOrder(orderVo);
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
        return "/page/out/order/orderListTable";
    }

    @RequestMapping("confirmOrderStatus")
    @ResponseBody
    public RespBean confirmOrderStatus(BigInteger id) {
        outService.getOrderStatusById(id);
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
                                            @RequestParam(value = "searchParams", required = false) String searchParams) {
        StoreSearchParamsVo storeSearchParamsVo = JSON.parseObject(searchParams, StoreSearchParamsVo.class);
        if (storeSearchParamsVo == null) {
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


    @RequestMapping("sale")
    public String getEnterPage() {
        return "/page/out/sale/table";
    }

    @RequestMapping("/saleInfo")
    @ResponseBody
    public Map<String, Object> getSaleInfo(@RequestParam(value = "page") int page,
                                            @RequestParam(value = "limit") int limit,
                                            @RequestParam(value = "searchParams", required = false) String sertchParams) {
        if (sertchParams == null) {
            Map<String, Object> map = outService.getSaleInfoByPage(page, limit);
            return map;
        } else {
            Map<String, Object> map = outService.getSaleInfoByParams(sertchParams, page, limit);
            return map;
        }

    }

    @RequestMapping("completeOrder")
    @ResponseBody
    @Log(module = "销售出库", description = "商品出库审核确认")
    public RespBean completeOrder(BigInteger id, Authentication authentication) {
        outService.completeOrderById(id, authentication);
        return RespBean.success("操作成功，订单内容已入库!");
    }






    @RequestMapping("back")
    public String getBackPage() {
        return "/page/out/back/table";
    }

    @RequestMapping("getAddReturnOutOrderPage")
    public String getAddReturnOutOrderPage(Model model) {
        BigInteger nextId = IdWorker.getNextId(1, 1, 1);
        model.addAttribute("orderId", nextId);
        return "/page/out/back/add";
    }

    @RequestMapping("delAllReturnOutOrder")
    @ResponseBody
    public RespBean delAllReturnOutOrder(@RequestBody List<OrderVo> orderVos) {
        outService.delAllReturnOutOrder(orderVos);
        return RespBean.success("批量删除成功！");
    }


    @RequestMapping("addReturnOutOrder")
    @ResponseBody
    public RespBean addReturnOutOrder(@RequestBody OrderVo orderVo, HttpServletRequest request, Authentication authentication) {
        String name = authentication.getName();
        Admin admin = adminService.getAdminByusername(name);
        orderVo.setHandsPerson(String.valueOf(admin.getId()));
//        Object session_user = request.getSession().getAttribute("session_user");
//        System.out.println(session_user);
        int i = outService.addReturnOutOrder(orderVo);
        if (i == 1) {
            return RespBean.success("添加成功，需要退货的商品详情信息请前往编辑页面！");
        } else {
            return RespBean.err("添加失败！");
        }
    }

    @RequestMapping("returnOutOrderInfo")
    @ResponseBody
    public Map<String, Object> returnOutOrderInfo(@RequestParam(value = "page") int page,
                                                @RequestParam(value = "limit") int limit,
                                                @RequestParam(value = "searchParams", required = false) String sertchParams) {
        if (sertchParams == null) {
            Map<String, Object> map = outService.getReturnOutOrderInfoByPage(page, limit);
            return map;
        } else {
            Map<String, Object> map = outService.getReturnOutOrderInfoByParams(sertchParams, page, limit);
            return map;
        }
    }


    @RequestMapping("confirmReturnOutOrderStatus")
    @ResponseBody
    public RespBean confirmReturnOutOrderStatus(BigInteger id) {
        outService.getReturnOutOrderStatusById(id);
        return RespBean.success("操作成功！");
    }

    @RequestMapping("getEditReturnOutOrderPage")
    public String getEditReturnOutOrderPage(BigInteger id, HttpServletRequest request) {
//        purchaseService.getOrderStatusById(id);
        request.getSession().setAttribute("OrderId", id);
        return "/page/out/back/orderListTable";
    }

    @RequestMapping("getEditReturnInOrderListPage")
    public String getEditReturnInOrderListPage(HttpServletRequest request, int id, Model model) {

        BigInteger orderId = (BigInteger) request.getSession().getAttribute("OrderId");
//        BigInteger orderListIdByOrderId = purchaseService.getOrderListIdByOrderId(orderId);
        OrderLIstVo orderLIstVo = purchaseService.getOrderListInfoById(id);
        model.addAttribute("orderList", orderLIstVo);
        return "/page/purchase/back/editListItem";
    }
    @RequestMapping("verifyReturnOutOrder")
    @ResponseBody
    public RespBean verifyReturnOutOrder(BigInteger id, Authentication authentication) {
        outService.verifyReturnOutOrder(id, authentication);
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
