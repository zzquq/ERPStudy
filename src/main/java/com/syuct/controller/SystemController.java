package com.syuct.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.syuct.config.annotation.Log;
import com.syuct.model.RespBean;
import com.syuct.pojo.Admin;
import com.syuct.pojo.vo.LogSearchParamsVo;
import com.syuct.pojo.vo.LogVo;
import com.syuct.pojo.vo.UserSearchVo;
import com.syuct.service.AdminService;
import com.syuct.service.LogService;
import com.syuct.service.SystemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/system")
public class SystemController {

    @Autowired
    private SystemService systemService;
    @Autowired
    private LogService logService;

    @Autowired
    private AdminService adminService;
    @RequestMapping("/user")
    public String getSysUserPage(Map map) {
        return "page/system/user/table";
    }

    @GetMapping("/userInfo")
    @ResponseBody
    @Log(module = "系统管理",description = "查询用户信息")
    public Map<String, Object> getUserInfo(@RequestParam("page") int page,
                                           @RequestParam("limit") int limit,
                                           @RequestParam(value = "searchParams", required = false) String searchParams) {

        UserSearchVo userSearchVo = JSON.parseObject(searchParams, UserSearchVo.class);
        if (userSearchVo == null) {
            Map<String, Object> map = systemService.getMapOfUserInfo(page, limit);
            return map;
        } else {
            Map<String, Object> map = systemService.getMapOfUserInfo(page, limit, userSearchVo);
            return map;
        }
    }

    @RequestMapping("getAddUserPage")
    public String getAddUserPage() {
        return "page/system/user/add";
    }
    @RequestMapping("addUser")
    @ResponseBody
    @Log(module = "系统管理",description = "添加用户")
    public RespBean addUser(Admin admin) {
        int i = systemService.addUser(admin);
        if (i == 1) {
            return RespBean.success("添加成功！");
        } else {
            return RespBean.err("添加失败");
        }
    }

    @RequestMapping("getEditUserPage")
    public String getEditUserPage(@RequestParam("id") int id, Model model) {
        Admin admin = adminService.getAdminById(id);
        model.addAttribute("admin", admin);
        return "page/system/user/edit";
    }

    @RequestMapping("/editUserInfo")
    @ResponseBody
    @Log(module = "系统管理",description = "修改用户信息")
    public RespBean editUserInfo(Admin admin) {
        int i = adminService.updUserInfo(admin);
        if (i == 1) {
            return RespBean.success("修改成功！");
        } else {
            return RespBean.err("修改失败！");
        }
    }

    @RequestMapping("/delUser")
    @ResponseBody
    @Log(module = "系统管理",description = "删除用户")
    public RespBean delUserById(@RequestParam("id") int id) {
        int i = adminService.delUserById(id);
        if (i == 1) {
            return RespBean.success("删除成功！");
        } else {
            return RespBean.err("删除失败！");
        }
    }

    @RequestMapping("/delAllUser")
    @ResponseBody
    @Log(module = "系统管理",description = "批量删除用户信息")
    public RespBean delAllUserById(@RequestBody List<Admin> admins) {
        adminService.delAllUserById(admins);
        return RespBean.success("批量删除成功！");
    }


    @RequestMapping("log")
    @Log(module = "系统管理",description = "查询日志信息")
    public String getLogPage() {
        return "page/system/log/table";
    }


    @RequestMapping("getLogInfo")
    @ResponseBody
    public Map<String, Object> getLogInfo(@RequestParam("page") int page,
                               @RequestParam("limit") int limit,
                               @RequestParam(value = "searchParams", required = false) String searchParams) {
        LogSearchParamsVo logSearchParamsVo = JSON.parseObject(searchParams, LogSearchParamsVo.class);

        if (logSearchParamsVo == null) {
            Map<String, Object> map = logService.getLogInfoByPage(page, limit);
            return map;
        } else {
            Map<String, Object> map = logService.getLogInfoByParams(page, limit, logSearchParamsVo);
            return map;
        }
    }

    @RequestMapping("/delAllLog")
    @ResponseBody
    public RespBean delAllLog(@RequestBody List<LogVo> logs) {
        logService.delAllLog(logs);
        return RespBean.success("批量删除成功！");
    }


    @RequestMapping("/delLog")
    @ResponseBody
    public RespBean detlLog(@RequestParam int id) {
        logService.delLog(id);
        return RespBean.success("删除成功！");
    }

    @RequestMapping("/function")
    public String getFunctionPage() {
        return "page/system/function/menu";
    }

    @RequestMapping("/functionInfo")
    @ResponseBody
    @Log(module = "系统管理", description = "查询系统功能")
    public Map<String, Object> getFunctionInfo() {
        Map<String, Object> functionInfo = systemService.getFunctionInfo();
        return functionInfo;
    }


    @RequestMapping("/banFunctionById")
    @ResponseBody
    @Log(module = "系统管理", description = "禁用功能")
    public RespBean banFunctionById(@RequestParam int id) {

        RespBean respBean = systemService.banFunctionById(id);
        return respBean;
    }

    @RequestMapping("/openFunctionById")
    @ResponseBody
    @Log(module = "系统管理", description = "启用功能")
    public RespBean openFunctionById(@RequestParam int id) {
        RespBean respBean = systemService.openFunctionById(id);
        return respBean;
    }

}
