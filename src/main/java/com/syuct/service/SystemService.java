package com.syuct.service;

import com.syuct.model.RespBean;
import com.syuct.pojo.Admin;
import com.syuct.pojo.vo.UserSearchVo;

import java.util.Map;

public interface SystemService {

    Map<String, Object> getUserInfo();

    Map<String, Object> getMapOfUserInfo(int page, int limit);

    int addUser(Admin admin);

    Map<String, Object> getMapOfUserInfo(int page, int limit, UserSearchVo userSearchVo);

    Map<String, Object> getFunctionInfo();

    RespBean banFunctionById(int id);

    RespBean openFunctionById(int id);
}
