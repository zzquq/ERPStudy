package com.syuct.config.security;


import com.syuct.pojo.Admin;
import com.syuct.service.AdminService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/***
 * UserDetailsService验证
 */
@Component
public class MyUserDetailsService implements UserDetailsService {


    @Autowired
    private AdminService adminService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        System.out.println("进入用户名密码验证");
        System.out.println("UserDetailsService验证");
        StringUtils.trim(username);
        Admin admin = adminService.getAdminByusername(username);
        if(admin == null){
            throw new UsernameNotFoundException("该用户不存在！");
        }
        String password = admin.getPassword();

        List<GrantedAuthority> grantedAuthorities = new ArrayList<>();
//        添加权限
        int id = admin.getId();
        List<String> role = adminService.getRoleByid(id);
        for (String s : role) {
            if(s != null){
                GrantedAuthority grantedAuthority = new SimpleGrantedAuthority(s);
                grantedAuthorities.add(grantedAuthority);
            }
        }
        return new User(username,password,
                true, true, true, true,
                grantedAuthorities);
    }



}

