package com.syuct.config.filter;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.syuct.model.CaptchaModel;
import com.syuct.model.RespBean;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.session.SessionAuthenticationException;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Objects;

@Component
public class CaptchaFilter extends OncePerRequestFilter {

    @Autowired
    private ObjectMapper objectMapper;

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws IOException, ServletException {
        if (StringUtils.equals("/login", request.getRequestURI()) && StringUtils.equalsIgnoreCase("post", request.getMethod())) {
            try {
                HttpSession session = request.getSession();
                String captchaInRequest = request.getParameter("captcha");
                CaptchaModel captcha = (CaptchaModel) session.getAttribute("verifyCode");

                if (StringUtils.isEmpty(captchaInRequest)) {
                    throw new SessionAuthenticationException("验证码不能为空！");
                }
                if (Objects.isNull(session)) {
                    throw new SessionAuthenticationException("验证码不存在！");
                }
                if (captcha.isExpired()) {
                    throw new SessionAuthenticationException("验证码已过期！");
                }
                if (!StringUtils.equals(captcha.getCode(), captchaInRequest)) {
                    throw new SessionAuthenticationException("验证码不匹配！");
                }
            } catch (AuthenticationException e) {
                response.setContentType("application/json;charset=UTF-8");
                response.getWriter().write(objectMapper.writeValueAsString(RespBean.err(e.getMessage())));
                return;
            }
        }
        filterChain.doFilter(request, response);
    }


}

