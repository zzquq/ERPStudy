package com.syuct.controller;

import com.syuct.model.RespBean;
import com.syuct.pojo.StoreInVo;
import com.syuct.pojo.vo.StoreOutInVo;
import com.syuct.pojo.vo.searchParamsVo.GoodsSearchParamsVo;
import com.syuct.pojo.vo.searchParamsVo.StoreSearchParamsVo;
import com.syuct.service.CommodityService;
import com.syuct.service.DepotService;
import com.syuct.service.InfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * @Author Zsz
 * @Date 2022/3/8 14:47
 * @Version 1.0
 **/
@Controller
@RequestMapping("/depot")
public class DepotController {

    @Autowired
    private DepotService depotService;

    @Autowired
    private InfoService infoService;

    @Autowired
    private CommodityService commodityService;

    @RequestMapping("manage")
    public String getManagePage() {
        return "/page/depot/manage/table";
    }

    @RequestMapping("depotInfo")
    @ResponseBody
    public Map<String, Object> getDepotInventoryInfo(@RequestParam int page,
                                                     @RequestParam int limit,
                                                     @RequestParam(value = "searchParams", required = false) String searchParams) {
        if (searchParams == null) {
            Map<String, Object> map = depotService.getDepotInventoryByPage(page, limit);
            return map;
        } else {
            Map<String, Object> map = depotService.getDepotInventoryByParams(page, limit, searchParams);
            return map;
        }
    }

    @RequestMapping("getStoreInPage")
    public String getStoreInPage() {
        return "/page/depot/manage/storeIn";
    }

    @RequestMapping("getStoreOutPage")
    public String getStoreOutPage() {
        return "/page/depot/manage/storeOut";
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

    @RequestMapping("addstoreIn")
    @ResponseBody
    public RespBean addstoreIn(@RequestBody StoreInVo storeInVo, Authentication authentication) {
        depotService.addStoreIn(storeInVo, authentication);
        return RespBean.success("入库成功");
    }

    @RequestMapping("addstoreOut")
    @ResponseBody
    public RespBean addstoreOut(@RequestBody StoreInVo storeInVo, Authentication authentication) {
        depotService.addstoreOut(storeInVo, authentication);
        return RespBean.success("出库成功");
    }

    @RequestMapping("outin")
    public String getOutInPage() {
        return "/page/depot/outin/table";
    }

    @RequestMapping("storeOutInInfo")
    @ResponseBody
    public Map<String, Object> getStoreOutInInfo(@RequestParam int page,
                                                 @RequestParam int limit,
                                                 @RequestParam(value = "searchParams", required = false) String searchParams) {
        if (searchParams == null) {
            System.out.println(searchParams);
           Map<String, Object> map =  depotService.getStoreOutInInfoByPage(page, limit);
            return map;
        } else {
            System.out.println("not null " + searchParams);
            Map<String, Object> map =  depotService.getStoreOutInInfoByParams(searchParams, page, limit);
            return map;
        }
    }

    @RequestMapping("getAddOutInPage")
    public String getAddOutInPage() {
        return "/page/depot/outin/add";
    }

    @RequestMapping("delOutIn")
    @ResponseBody
    public RespBean delOutIn(int id) {
        depotService.delOutIn(id);
        return RespBean.success("删除成功！");
    }

    @RequestMapping("delAllOutIn")
    @ResponseBody
    public RespBean delAllOutIn(@RequestBody List<StoreOutInVo> storeOutInVos) {
        depotService.delAllOutIn(storeOutInVos);
        return RespBean.success("批量删除成功！");
    }

    @RequestMapping("verifyOutIn")
    @ResponseBody
    public RespBean verifyOutIn(int id, Authentication authentication) {
        depotService.verifyOutIn(id, authentication);
        return RespBean.success("审核成功！");
    }

    @RequestMapping("addStoreOutIn")
    @ResponseBody
    public RespBean addStoreOutIn(@RequestBody StoreOutInVo storeOutInVo) {
        depotService.addStoreOutIn(storeOutInVo);
        return RespBean.success("添加成功！");
    }

}
