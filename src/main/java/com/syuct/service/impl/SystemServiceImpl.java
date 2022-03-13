package com.syuct.service.impl;

import com.syuct.mapper.AdminMapper;
import com.syuct.mapper.SysMenuMapper;
import com.syuct.mapper.SystemMapper;
import com.syuct.model.RespBean;
import com.syuct.pojo.Admin;
import com.syuct.pojo.Function;
import com.syuct.pojo.SysMenu;
import com.syuct.pojo.vo.FunctionVo;
import com.syuct.pojo.vo.UserSearchVo;
import com.syuct.service.SystemService;
import com.syuct.utils.AssertUtil;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.awt.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/***
 * 系统功能模块实现类
 */
@Service
public class SystemServiceImpl implements SystemService {

    @Autowired
    private SystemMapper systemMapper;

    @Autowired
    private AdminMapper adminMapper;

    @Autowired
    private SysMenuMapper sysMenuMapper;

    @Override
    public Map<String, Object> getUserInfo() {
        return null;
    }

    /***
     * 分页查询用户信息
     * @param page
     * @param limit
     * @return
     */
    @Override
    public Map<String, Object> getMapOfUserInfo(int page, int limit) {
        Map<String, Object> map = new HashMap<>();
        //分页查询第page页，一页limit条数据，即 第page*linit+1到第（page+1）*limit +1之间的数据
        page = (page-1) * limit;
        List<Admin> users = adminMapper.getUsersByPage(page, limit);
        map.put("code", 0);
        //得到所有个数
        int count = adminMapper.getUserCounts();
        map.put("count", count);
        List<Admin> admins = new ArrayList<>();
        for (Admin admin :
                users) {
            if("5".equals(admin.getRole())){
                admin.setRole("管理员");
            } else if ("1".equals(admin.getRole())) {
                admin.setRole("普通员工");
            } else if(admin.getRole().isEmpty()){
                admin.setRole("未分配角色");
            }
            admins.add(admin);
        }
        map.put("data", admins);
        return map;
    }

    /**
     * 添加用户
     * @param admin
     * @return
     */
    @Override
    @Transactional(propagation= Propagation.REQUIRED, rollbackFor = Exception.class)
    public int addUser(Admin admin) {
        Admin adminByusername = adminMapper.getAdminByusername(admin.getUsername());
        AssertUtil.isTrue(adminByusername != null, "该用户已存在，请重新设置账号名！");
        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
        String password = bCryptPasswordEncoder.encode("123456");
        admin.setPassword(password);
        String role = admin.getRole();
        int i = adminMapper.addUser(admin);
        int autoid = admin.getId();
        systemMapper.addRoleAdmin(role, autoid);
        return i;
    }

    /***
     * 得到用户信息列表
     * @param page
     * @param limit
     * @param userSearchVo
     * @return
     */
    @Override
    public Map<String, Object> getMapOfUserInfo(int page, int limit, UserSearchVo userSearchVo) {
        String id = userSearchVo.getId();
        String username = userSearchVo.getUsername();
        String name = userSearchVo.getName();
        Map<String, Object> map = new HashMap<>();
        //分页查询第page页，一页limit条数据，即 第page*linit+1到第（page+1）*limit +1之间的数据
        page = (page-1) * limit;
        List<Admin> users = adminMapper.getUsersByParams(id, username, name, page, limit);
        map.put("code", 0);
        //得到所有个数
        int count = adminMapper.getUserCountsByParams(id, username, name);
        map.put("count", count);
        List<Admin> admins = new ArrayList<>();
        for (Admin admin :
                users) {
            if("5".equals(admin.getRole())){
                admin.setRole("管理员");
            } else if ("1".equals(admin.getRole())) {
                admin.setRole("普通员工");
            } else if(admin.getRole().isEmpty()){
                admin.setRole("未分配角色");
            }
            admins.add(admin);
        }
        map.put("data", admins);
        return map;
    }

    /***
     * 得到功能列表
     * @return
     */
    @Override
    public Map<String, Object> getFunctionInfo() {
        HashMap<String, Object> map = new HashMap<>();
//        ArrayList<FunctionVo> data = new ArrayList<>();
        FunctionVo fv = new FunctionVo();
        fv.setId(0);
        fv.setTitle("进销存管理系统功能清单");
        fv.setIsMenu(0);
        fv.setPid(-1);
        fv.setHref(null);
        fv.setRole(null);
        fv.setStatus("正常");
        ArrayList<FunctionVo> functionVos = new ArrayList<>();
        functionVos.add(fv);

        List<Function> functionInfo = systemMapper.getFunctionInfo();
        map.put("code",0);
        int count = systemMapper.getFunctionCounts();
        map.put("count", count);

        for (Function function:
             functionInfo) {
            FunctionVo functionVo = new FunctionVo();
            functionVo.setId(function.getId());
            functionVo.setPid(function.getPid());
            functionVo.setTitle(function.getTitle());
            if (!function.getHref().isEmpty()) {
                //说明是一个按钮
                functionVo.setIsMenu(1);
                 functionVo.setHref(function.getHref());
            } else {
                functionVo.setIsMenu(0);
                functionVo.setHref("主菜单");
            }
            if (function.getStatus() == 1) {
                functionVo.setStatus("启用");
            } else if (function.getStatus() == 0) {
                functionVo.setStatus("禁用");
            }
            if (function.getRoleid() == 5) {
                functionVo.setRole("管理员权限");
            } else if (function.getRoleid() == 1) {
                functionVo.setRole("普通用户权限");
            }
            functionVos.add(functionVo);
        }
        map.put("data", functionVos);

        return map;
    }
    /**
     * 关闭系统功能
     * @param id
     * @return
     */
    @Override
    @Transactional(propagation= Propagation.REQUIRED, rollbackFor = Exception.class)
    public RespBean banFunctionById(int id) {

        SysMenu menu = sysMenuMapper.getMenuById(id);
        AssertUtil.isTrue(!menu.getStatus(), "该功能已经是禁用状态!");
        AssertUtil.isTrue(id == 36, "功能管理模块无法禁用！");
        //说明要删除的是主菜单，那么要将该菜单下的所有功能全部禁用
        if (menu.getHref().isEmpty()) {
            systemMapper.banAllFunctionById(id);
            systemMapper.banFunctionById(id);
            return RespBean.success("已禁用主菜单" + menu.getTitle() + "与该菜单下的所有功能！");
        } else {
            systemMapper.banFunctionById(id);
            return RespBean.success("已禁用" + menu.getTitle()+ "!");
        }
    }

    /**
     * 开启系统功能
     * @param id
     * @return
     */
    @Override
    @Transactional(propagation= Propagation.REQUIRED, rollbackFor = Exception.class)
    public RespBean openFunctionById(int id) {
        SysMenu menu = sysMenuMapper.getMenuById(id);
        System.out.println(menu.getStatus());
        AssertUtil.isTrue(menu.getStatus(), "该功能已经是启用状态!");
        //说明要删除的是主菜单，那么要将该菜单下的所有功能全部禁用
        if (menu.getHref().isEmpty()) {
            systemMapper.openAllFunctionById(id);
            systemMapper.openFunctionById(id);
            return RespBean.success("已启用主菜单" + menu.getTitle() + "与该菜单下的所有功能！");
        } else {
            systemMapper.openFunctionById(id);
            return RespBean.success("已启用" + menu.getTitle()+ "!");
        }

    }
}
