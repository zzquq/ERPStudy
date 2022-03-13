package com.syuct.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.syuct.config.annotation.Log;
import com.syuct.model.RespBean;
import com.syuct.pojo.Admin;
import com.syuct.pojo.vo.AdminVo;
import com.syuct.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 系统用户Controller
 */
@Controller
@RequestMapping("/user")
public class AdminController {

    @Autowired
    private AdminService adminService;


    @RequestMapping("/info")
    public String getUserInfo(Model model, Authentication authentication) throws JsonProcessingException {

        String username = authentication.getName();
        AdminVo adminVo = adminService.getAdminVoByusername(username);
        model.addAttribute("adminVo", adminVo);
        return "page/user/info";
    }

    @RequestMapping("/updInfo")
    @ResponseBody
    @Log(module = "用户管理",description = "更新本人信息")
    public RespBean updUserInfo(AdminVo adminVo, HttpServletRequest request) {
        Admin session_user = (Admin) request.getSession().getAttribute("session_user");
        int id = session_user.getId();
        int i = adminService.updUserInfo(id, adminVo);
        if (i == 1) {
            return RespBean.success("更新成功！");
        } else {
            return RespBean.err("更新失败！");
        }
    }

    @RequestMapping("/password")
    public String updPwdPage() {
        return "/page/user/password";
    }

    @RequestMapping("/updPassword")
    @ResponseBody
    @Log(module = "用户管理",description = "更新本人密码信息")
    public RespBean updPassword(String oldPassword, String newPassword, String confirmPassword, HttpServletRequest request) {
        Admin session_user = (Admin) request.getSession().getAttribute("session_user");
        String username = session_user.getUsername();
        int i = adminService.updPasswordById(username, oldPassword, newPassword, confirmPassword);
        if (i == 1) {
            return RespBean.success("更新密码成功！");
        } else {
            return RespBean.err("更新密码失败！");
        }
    }

}
