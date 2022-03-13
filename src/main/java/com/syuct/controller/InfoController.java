package com.syuct.controller;

import com.alibaba.fastjson.JSON;
import com.syuct.config.annotation.Log;
import com.syuct.model.RespBean;
import com.syuct.pojo.Member;
import com.syuct.pojo.Store;
import com.syuct.pojo.vo.AccountVo;
import com.syuct.pojo.vo.AddSupplierVo;
import com.syuct.pojo.vo.SupplierVo;
import com.syuct.pojo.vo.searchParamsVo.AccountSearchParamsVo;
import com.syuct.pojo.vo.searchParamsVo.MemberSearchParamsVo;
import com.syuct.pojo.vo.searchParamsVo.StoreSearchParamsVo;
import com.syuct.pojo.vo.searchParamsVo.SupplierSearchParamsVo;
import com.syuct.service.InfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * @Author Zsz
 * @Date 2021/11/22 20:07
 * @Version 1.0
 **/

@Controller
@RequestMapping("/info")
public class InfoController {

    @Autowired
    private InfoService infoService;

    @RequestMapping("/supplier")
    public String getSupplierInfoPage() {

        return "/page/info/supplier/table";
    }

    @RequestMapping("/supplierInfo")
    @ResponseBody
    @Log(module = "基本资料", description = "查询供应商信息")
    public Map<String, Object> getSupplierInfo(@RequestParam("page") int page,
                                               @RequestParam("limit") int limit,
                                               @RequestParam(value = "searchParams", required = false) String searchParams) {
        SupplierSearchParamsVo supplierSearchParamsVo = JSON.parseObject(searchParams, SupplierSearchParamsVo.class);
        if (supplierSearchParamsVo == null) {
            Map<String, Object> map = infoService.getSupplierInfoByPage(page, limit);
            return map;
        } else {
            Map<String, Object> map = infoService.getSupplierInfoByParams(page, limit, supplierSearchParamsVo);
            return map;
        }
    }

    @RequestMapping("/delAllSupplier")
    @ResponseBody
    @Log(module = "基本资料", description = "删除供应商信息")
    public RespBean delAllSupplier(@RequestBody List<SupplierVo> supplierVoList) {
        infoService.delAllSupplierbyId(supplierVoList);
        return RespBean.success("批量删除成功！");
    }

    @RequestMapping("/delSupplier")
    @ResponseBody
    @Log(module = "基本资料", description = "删除供应商信息")
    public RespBean delSupplier(int id) {
        infoService.delSupplierbyId(id);
        return RespBean.success("删除成功！");
    }


    @RequestMapping("/getAddSupplierPage")
    public String getAddSupplierPage(Model model) {

        return "page/info/supplier/add";
    }

    @RequestMapping("getEditSupplierPage")
    public String getEditSupplierPage(@RequestParam(value = "id") int id, Model model) {
        AddSupplierVo supplierVo = infoService.getSupplierInfoById(id);
        model.addAttribute("supplier", supplierVo);
        return "page/info/supplier/edit";
    }


    @RequestMapping("/addSupplier")
    @ResponseBody
    @Log(module = "基本资料", description = "添加供应商信息")
    public RespBean addSupplier(AddSupplierVo supplier) {
        int i = infoService.addSupplier(supplier);
        if(i > 0){
            return RespBean.success("添加成功！");
        }else {
            return RespBean.err("添加失败！");
        }
    }

    @RequestMapping("/editSupplier")
    @ResponseBody
    @Log(module = "基本资料", description = "修改供应商信息")
    public RespBean editSupplier(AddSupplierVo supplier) {
        int i = infoService.editSupplier(supplier);
        if(i > 0){
            return RespBean.success("修改成功！");
        }else {
            return RespBean.err("修改失败！");
        }
    }


    @RequestMapping("/account")
    public String getAccountInfoPage() {
        return "/page/info/account/table";
    }

    @RequestMapping("/acountInfo")
    @ResponseBody
    @Log(module = "基本资料", description = "查询账户信息")
    public Map<String, Object> acountInfo(@RequestParam int page,
                                                   @RequestParam int limit,
                                                   @RequestParam(value = "searchParams", required = false) String searchParams) {
        AccountSearchParamsVo accountSearchParamsVo = JSON.parseObject(searchParams, AccountSearchParamsVo.class);
        if (accountSearchParamsVo == null) {
            Map<String, Object> map = infoService.getAccountInfoByPage(page, limit);
            return map;
        } else {
            Map<String, Object> map = infoService.getAccountInfoByParams(page, limit, accountSearchParamsVo);
            return map;
        }
    }


    @RequestMapping("/delAllAcount")
    @ResponseBody
    @Log(module = "基本资料", description = "删除账户信息")
    public RespBean delAllAcount(@RequestBody List<AccountVo> accountVoList) {
        infoService.delAllAccountById(accountVoList);
        return RespBean.success("批量删除成功！");
    }

    @RequestMapping("/delAccount")
    @ResponseBody
    @Log(module = "基本资料", description = "删除账户信息")
    public RespBean delAccount(int id) {
        infoService.delAccountbyId(id);
        return RespBean.success("删除成功！");
    }

    @RequestMapping("/getEditAccountPage")
    public String getEditAccountPage(@RequestParam(value = "id") int id, Model model) {
        AccountVo accountVo = infoService.getAccountInfoById(id);
        model.addAttribute("accountVo", accountVo);
        return "page/info/account/edit";
    }

    @RequestMapping("/getAddAccountPage")
    public String getAddAccountPage() {
        return "page/info/account/add";
    }

    @RequestMapping("/addAccount")
    @ResponseBody
    @Log(module = "基本资料", description = "添加账户信息")
    public RespBean addAccount(AccountVo accountVo) {
//        AccountVo(id=0, name=154, accountNumber=13564, nowMoney=1564, remark=1564, flag=1)
        int i = infoService.addAccount(accountVo);
        if (i == 1) {
            return RespBean.success("添加成功！");
        } else {
            return RespBean.err("添加失败");
        }
    }

    @RequestMapping("/editAccountInfo")
    @ResponseBody
    @Log(module = "基本资料", description = "编辑账户信息")
    public RespBean editAccountInfo(AccountVo accountVo) {
        int i = infoService.updAccountInfo(accountVo);
        if (i == 1) {
            return RespBean.success("修改成功！");
        } else {
            return RespBean.err("修改失败");
        }
    }

    @RequestMapping("/getAccountIdName")
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


    @RequestMapping("/member")
    public String getMemberPage() {
        return "/page/info/member/table";
    }

    @RequestMapping("/memberInfo")
    @ResponseBody
    @Log(module = "基本资料", description = "查询会员信息")
    public Map<String, Object> getMemberInfo(@RequestParam int page,
                                             @RequestParam int limit,
                                             @RequestParam(value = "searchParams", required = false) String searchParams) {
        MemberSearchParamsVo memberSearchParamsVo = JSON.parseObject(searchParams, MemberSearchParamsVo.class);
        if (memberSearchParamsVo == null) {
            Map<String, Object> map = infoService.getMemberInfoByPage(page, limit);
            return map;
        } else {
            Map<String, Object> map = infoService.getMemberInfoByParams(memberSearchParamsVo, page, limit);
            return map;
        }

    }

    @RequestMapping("/getAddMemberPage")
    public String getAddMemberPage() {
        return "/page/info/member/add";
    }

    @RequestMapping("/addMember")
    @ResponseBody
    @Log(module = "基本资料", description = "添加会员信息")
    public RespBean addMember(Member member) {
        int i = infoService.addMumber(member);
        if (i > 0) {
            return RespBean.success("添加成功！");
        } else {
            return RespBean.err("添加失败！");
        }
    }

    @RequestMapping("/getEditMemberPage")
    public String getDelMemberPage(int id, Model model) {
        Member member = infoService.getMemberInfoById(id);
        model.addAttribute("member", member);
        return "/page/info/member/edit";
    }

    @RequestMapping("/editMember")
    @ResponseBody
    @Log(module = "基本资料", description = "编辑会员信息")
    public RespBean editMember(Member member) {
        int i = infoService.editMember(member);
        if (i > 0) {
            return RespBean.success("修改成功！");
        } else {
            return RespBean.err("修改失败！");
        }
    }


    @RequestMapping("delMember")
    @ResponseBody
    @Log(module = "基本资料", description = "删除会员信息")
    public RespBean delMember(int id) {
        int i = infoService.delMemberById(id);
        if (i > 0) {
            return RespBean.success("删除成功");
        } else {
            return RespBean.err("删除失败！");
        }
    }

    @RequestMapping("delAllMember")
    @ResponseBody
    @Log(module = "基本资料", description = "批量删除会员信息")
    public RespBean delAllMember(@RequestBody List<Member> memberList) {
        infoService.delAllMemberById(memberList);
        return RespBean.success("批量删除成功！");
    }


    @RequestMapping("/store")
    public String getStorePage() {
        return "/page/info/store/table";
    }

    @RequestMapping("/storeInfo")
    @ResponseBody
    @Log(module = "基本资料", description = "查询仓库信息")
    public Map<String, Object> getStoreInfo(@RequestParam int page,
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

    @RequestMapping("/getAddStorePage")
    public String getAddStorePage() {
        return "/page/info/store/add";
    }

    @RequestMapping("/getEditStorePage")
    public String getEditStorePage(int id, Model model) {
        Store store = infoService.getStoreInfoById(id);
        model.addAttribute("store", store);
        return "/page/info/store/edit";
    }

    @RequestMapping("/delStore")
    @ResponseBody
    @Log(module = "基本资料", description = "删除仓库信息")
    public RespBean delStore(int id) {
        int i  = infoService.delStoreInfoById(id);
        if (i > 0) {
            return RespBean.success("删除成功！");
        } else {
            return RespBean.err("删除失败！");
        }
    }

    @RequestMapping("/delAllStore")
    @ResponseBody
    @Log(module = "基本资料", description = "批量删除仓库信息")
    public RespBean delStore(List<Store> stores) {
        infoService.delAllStoreInfo(stores);
        return RespBean.success("批量删除成功！");
    }

    @RequestMapping("addStore")
    @ResponseBody
    @Log(module = "基本资料", description = "添加仓库信息")
    public RespBean addStore(Store store) {
        int i = infoService.addStore(store);
        if (i > 0) {
            return RespBean.success("添加成功！");
        } else {
            return RespBean.err("添加失败！");
        }
    }

    @RequestMapping("editStore")
    @ResponseBody
    @Log(module = "基本资料", description = "编辑仓库信息")
    public RespBean editStore(Store store) {
        int i = infoService.editStore(store);
        if (i > 0) {
            return RespBean.success("修改成功！");
        } else {
            return RespBean.err("修改失败！");
        }
    }

}
