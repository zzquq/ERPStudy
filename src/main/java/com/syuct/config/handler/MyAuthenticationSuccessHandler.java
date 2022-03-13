package com.syuct.config.handler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.syuct.config.annotation.Log;
import com.syuct.model.RespBean;
import com.syuct.pojo.Admin;
import com.syuct.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Component
public class MyAuthenticationSuccessHandler implements AuthenticationSuccessHandler
{

    // private RequestCache requestCache = new HttpSessionRequestCache();

    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

     @Autowired
     private ObjectMapper objectMapper;
    @Autowired
    private AdminService adminService;

    @Override
    @Log(module = "用户",description = "用户登录")
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                        Authentication authentication) throws IOException {
//         response.setContentType("application/json;charset=utf-8");
//         response.getWriter().write(mapper.writeValueAsString(authentication));
//         SavedRequest savedRequest = requestCache.getRequest(request, response);
//         System.out.println(savedRequest.getRedirectUrl());
//         redirectStrategy.sendRedirect(request, response, savedRequest.getRedirectUrl());
        String username = authentication.getName();
        Admin admin = adminService.getAdminByusername(username);
        HttpSession session = request.getSession();
        session.setAttribute("session_user",admin);
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(objectMapper.writeValueAsString(RespBean.success("登录成功！")));
    }
}
