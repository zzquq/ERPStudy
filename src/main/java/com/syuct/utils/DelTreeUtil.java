package com.syuct.utils;


import com.syuct.mapper.CommodityMapper;
import com.syuct.pojo.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.List;

/**
 * @Author Zsz
 * @Date 2022/1/11 12:31
 * @Version 1.0
 **/
@Component
public class DelTreeUtil {

    @Autowired
    private CommodityMapper categoryMapper;

    private static CommodityMapper cmapper;

    @PostConstruct
    public void init() {
        cmapper= categoryMapper;
    }

    public  void delTreeByInt(int id) {
        List<Category> categoryList = cmapper.getCategoryInfoByPid(id);
        for (int i = 0; i < categoryList.size(); i++) {
            delTreeByInt(categoryList.get(i).getId());
        }
        cmapper.delCategory(id);
    }

}
