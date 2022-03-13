package com.syuct.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.syuct.mapper.AdminMapper;
import com.syuct.mapper.SystemMapper;
import com.syuct.pojo.Admin;
import com.syuct.pojo.vo.AdminVo;
import com.syuct.service.AdminService;
import com.syuct.utils.AssertUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;


@Service
public class AdminServiceImpl implements AdminService {


    @Autowired
    private AdminMapper adminMapper;

    @Autowired
    private ObjectMapper objectMapper;

    @Autowired
    private SystemMapper systemMapper;

    @Override
    public Admin getAdminByusername(String username) {
        Admin admin = adminMapper.getAdminByusername(username);
        return admin;
    }

    @Override
    public List<String> getRoleByid(int id) {
        List<String> role = adminMapper.getRoleByid(id);
        return role;
    }

    @Override
    public int getRoleIdByusername(String username) {
        int roleId = adminMapper.getRoleIdByusername(username);
        return roleId;
    }

    @Override
    public AdminVo getAdminVoByusername(String username) throws JsonProcessingException {

        Admin admin = adminMapper.getAdminByusername(username);
        String s = objectMapper.writeValueAsString(admin);
        AdminVo adminVo = objectMapper.readValue(s, AdminVo.class);
        return adminVo;
    }

    @Override
    @Transactional(propagation= Propagation.REQUIRED, rollbackFor = Exception.class)
    public int updUserInfo(int id, AdminVo adminVo) {
        Admin admin = new Admin();
        BeanUtils.copyProperties(adminVo, admin);
        admin.setId(id);
        int i = adminMapper.updUserInfo(admin);
        return i;
    }

    @Override
    @Transactional(propagation= Propagation.REQUIRED, rollbackFor = Exception.class)
    public int updPasswordById(String username, String oldPassword, String newPassword, String confirmPassword) {
        Admin admin = this.getAdminByusername(username);
        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();

        AssertUtil.isTrue(admin == null, "该用户不存在！");
        AssertUtil.isTrue(!(bCryptPasswordEncoder.matches(oldPassword, admin.getPassword())), "旧密码输入错误！");
        AssertUtil.isTrue(!(newPassword.equals(confirmPassword)), "新密码两次输入不一致！");
        AssertUtil.isTrue(oldPassword.equals(newPassword), "新密码与旧密码不能相同！");
        newPassword = bCryptPasswordEncoder.encode(newPassword);
        admin.setPassword(newPassword);
        int i = adminMapper.updUseById(admin);
        return i;
    }

    @Override
    public Admin getAdminById(int id) {
        return adminMapper.getAdminById(id);
    }

    @Override
    @Transactional(propagation= Propagation.REQUIRED, rollbackFor = Exception.class)
    public int updUserInfo(Admin admin) {

        Admin adminByusername = adminMapper.getAdminByusername(admin.getUsername());
//        if (adminByusername != null || (adminByusername != null&&(admin.getUsername().equals(adminByusername.getUsername())))) {
//            AssertUtil.isTrue(adminByusername != null, "该用户名已存在，请重新修改用户名！");
//        }
        if (adminByusername != null) {
            AssertUtil.isTrue(!admin.getName().equals(adminByusername.getName()), "该用户名已存在，请重新修改用户名！");
        }

        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
        String password = bCryptPasswordEncoder.encode("123456");
        admin.setPassword(password);
        String role = admin.getRole();
        System.out.println(role);
        int i = adminMapper.updUser(admin);
        int adminId = admin.getId();
        String roleid = admin.getRole();
        adminMapper.updRole(roleid, adminId);
        return i;

    }

    @Override
    public int delUserById(int id) {
        int i = adminMapper.delUserById(id);
        return i;
    }

    @Override
    @Transactional(propagation= Propagation.REQUIRED, rollbackFor = Exception.class)
    public void delAllUserById(List<Admin> admins) {
        AssertUtil.isTrue(admins.size() == 0, "请选择要删除的数据！");
        for (Admin admin:
             admins) {
            int adminId = admin.getId();
            adminMapper.delUserById(adminId);
        }
    }
}
