package com.syuct.mapper;

import com.syuct.pojo.SysMenu;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SysMenuMapper {

    //这里我只查询页面转态为启用,可自行定义和写.
    List<SysMenu> getSystemMenuByStatusAndSort();

    List<SysMenu> findAllByStatusOrderBySort();

    List<SysMenu> finfMenuByroleIdOrderBySort(int roleId);


    SysMenu getMenuById(int id);
}
