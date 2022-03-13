package com.syuct.service;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.syuct.pojo.Admin;
import com.syuct.pojo.vo.AdminVo;

import java.util.List;


public interface AdminService {

    Admin getAdminByusername(String username);

    List<String> getRoleByid(int id);

    int getRoleIdByusername(String username);

    AdminVo getAdminVoByusername(String username) throws JsonProcessingException;

    int updUserInfo(int id, AdminVo adminVo);

    int updPasswordById(String username, String oldPassword, String newPassword, String confirmPassword);

    Admin getAdminById(int id);

    int updUserInfo(Admin admin);

    int delUserById(int id);

    void delAllUserById(List<Admin> admins);
}
