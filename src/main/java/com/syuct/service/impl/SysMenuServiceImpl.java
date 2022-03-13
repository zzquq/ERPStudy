package com.syuct.service.impl;

import com.syuct.mapper.SysMenuMapper;
import com.syuct.pojo.vo.MenuVo;
import com.syuct.pojo.SysMenu;
import com.syuct.service.AdminService;
import com.syuct.service.SysMenuService;
import com.syuct.utils.TreeUtil;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;


@Service
public class SysMenuServiceImpl implements SysMenuService {

    @Resource
    private SysMenuMapper sysMenuMapper;
    @Resource
    private AdminService adminService;
    @Override
    public Map<String, Object> menu() {
                Map<String, Object> map = new HashMap<>(16);
        Map<String,Object> home = new HashMap<>(16);
        Map<String,Object> logo = new HashMap<>(16);
        home.put("title","首页");
        home.put("href","/page/welcome");//控制器路由,自行定义
        logo.put("title","进销存管理系统");
        logo.put("image","../static/images/logo.png");//静态资源文件路径,可使用默认的logo.png
        map.put("homeInfo", home);
        map.put("logoInfo", logo);


        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();

        int roleId = adminService.getRoleIdByusername(username);
//        int id = admin.getId();
//        List<String> roleByid = adminService.getRoleByid(id);
//        System.out.println(roleByid);
//        Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
//        System.out.println(authorities);

        //完成1：根据用户名查询角色id
//        2.根据角色id查询功能列表（已完成）

        //根据用户id查询用户对应的角色id，之后根据角色id查询角色对应功能列表，权限控制已经由SpringSecurity配置类完成。
//        List<SysMenu> menuList = sysMenuMapper.findAllByStatusOrderBySort();
        List<SysMenu> menuList = sysMenuMapper.finfMenuByroleIdOrderBySort(roleId);

        List<MenuVo> menuInfo = new ArrayList<>();
        for (SysMenu e : menuList) {
            MenuVo menuVO = new MenuVo();
            menuVO.setId(e.getId());
            menuVO.setPid(e.getPid());
            menuVO.setHref(e.getHref());
            menuVO.setTitle(e.getTitle());
            menuVO.setIcon(e.getIcon());
            menuVO.setTarget(e.getTarget());
            menuInfo.add(menuVO);
        }
        map.put("menuInfo", TreeUtil.toTree(menuInfo, 0L));

        return map;
    }
}
