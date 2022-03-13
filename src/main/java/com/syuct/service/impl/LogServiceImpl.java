package com.syuct.service.impl;

import com.syuct.mapper.LogMapper;
import com.syuct.pojo.Admin;
import com.syuct.pojo.Log;
import com.syuct.pojo.vo.LogSearchParamsVo;
import com.syuct.pojo.vo.LogVo;
import com.syuct.service.LogService;
import com.syuct.utils.AssertUtil;
import com.syuct.utils.IpUtil;
import org.apache.ibatis.annotations.Mapper;
import org.aspectj.lang.JoinPoint;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class LogServiceImpl implements LogService {

    @Autowired
    private LogMapper logMapper;

    @Override
    public int addLog(JoinPoint joinPoint, String methodName, String module, String description) {
        Log log = new Log();
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();

        // 获取当前登录用户
        Admin admin = (Admin) request.getSession().getAttribute("session_user");
//            String name = SecurityContextHolder.getContext().getAuthentication().getName();
//            System.out.println(name);

        String requestURL = request.getRequestURL().toString();
        String ip = IpUtil.getIPAddress(request);
        log.setUsername(admin.getUsername());
        log.setName(admin.getName());
        log.setModule(module);
        log.setOperation(description);
        log.setUrl(requestURL);
        log.setIp(ip);
//            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
//            log.setDate(df.format(new Date()));
        log.setDate(new Date());
        log.setStatus(1);
        logMapper.saveLog(log);
        return 0;
    }

    @Override
    public Map<String, Object> getLogInfoByPage(int page, int limit) {
        System.out.println("无查询参数serviceImpl");
        Map<String, Object> map = new HashMap<>();

        page = (page - 1) * limit;
        List<Log> logByPage = logMapper.getLogByPage(page, limit);
        map.put("code", 0);
        //得到所有个数
        int count = logMapper.getLogCounts();
        List<LogVo> logs = new ArrayList<>();
        map.put("count", count);
//        List<Log> logs = new ArrayList<>();
        for (Log log :
                logByPage) {
            LogVo logVo = new LogVo();
            BeanUtils.copyProperties(log, logVo);
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            logVo.setDate(df.format(log.getDate()));
            logs.add(logVo);
        }
//        for (Log log :
//                logByPage) {
//            logs.add(log);
//        }
        map.put("data", logs);
        return map;
    }


    @Override
    public void delAllLog(List<LogVo> logs) {
        AssertUtil.isTrue(logs.size() == 0, "请选择要删除的数据！");
        for (LogVo logVo :
                logs) {
            int id = logVo.getId();
            logMapper.delLog(id);
        }
    }

    @Override
    public void delLog(int id) {
        logMapper.delLog(id);
    }

    @Override
    public Map<String, Object> getLogInfoByParams(int page, int limit, LogSearchParamsVo logSearchParamsVo) {
        System.out.println("有查询参数serviceImpl");
        Map<String, Object> map = new HashMap<>();

        page = (page - 1) * limit;
        String username = logSearchParamsVo.getUsername();
        String name = logSearchParamsVo.getName();
        String module = logSearchParamsVo.getModule();
        System.out.println(0);
        List<Log> logByPage = logMapper.getLogByParams(username, name, module, page, limit);
        map.put("code", 0);
        //得到所有个数
//        int count = logMapper.getLogCounts();
        int count = logMapper.getLogCountsByParams(username, name, module);
        List<LogVo> logs = new ArrayList<>();
        map.put("count", count);
        for (Log log :
                logByPage) {
            LogVo logVo = new LogVo();
            BeanUtils.copyProperties(log, logVo);
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            logVo.setDate(df.format(log.getDate()));
            logs.add(logVo);
        }
//        List<Log> logs = new ArrayList<>();
        System.out.println(1);
        System.out.println(logByPage);

//        for (Log log :
//                logByPage) {
//            logs.add(log);
//        }//此处出问题*******************************************************************
        System.out.println(2);

        map.put("data", logs);
        return map;
    }
}
