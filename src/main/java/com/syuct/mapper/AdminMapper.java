package com.syuct.mapper;


import com.syuct.pojo.Admin;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AdminMapper {
    Admin getAdminByusername(String username);

    List<String> getRoleByid(int id);

    int getRoleIdByusername(String username);

    int updUserInfo(Admin admin);

    int updUseById(Admin admin);

    List<Admin> getUsers();

    int getUserCounts();

    List<Admin> getUsersByPage(int page, int limit);

    int addUser(Admin admin);

    Admin getAdminById(int id);

    int updRole(String roleid, int adminid);

    int updUser(Admin admin);

    int delUserById(int id);

    List<Admin> getUsersByParams(String id, String username, String name, int page, int limit);

    int getUserCountsByParams(String id, String username, String name);
}
