package com.syuct.mapper;


import com.syuct.pojo.Function;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SystemMapper {


    int addRoleAdmin(String roleid, int autoid);

    List<Function> getFunctionInfo();

    int getFunctionCounts();

    void banFunctionById(int id);

    void openFunctionById(int id);

    void banAllFunctionById(int id);

    void openAllFunctionById(int id);
}
