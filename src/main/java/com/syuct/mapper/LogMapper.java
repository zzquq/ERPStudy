package com.syuct.mapper;

import com.syuct.pojo.Admin;
import com.syuct.pojo.Log;
import com.syuct.pojo.vo.LogVo;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LogMapper {


    int saveLog(Log log);

    List<Log> getLogByPage(int page, int limit);

    int getLogCounts();

    void delLog(int id);

    List<Log> getLogByParams(String username, String name, String module, int page, int limit);

    int getLogCountsByParams(String username, String name, String module);

}
