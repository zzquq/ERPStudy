package com.syuct.service;


import com.syuct.pojo.Log;
import com.syuct.pojo.vo.LogSearchParamsVo;
import com.syuct.pojo.vo.LogVo;
import org.aspectj.lang.JoinPoint;

import java.util.List;
import java.util.Map;

public interface LogService {

    int addLog(JoinPoint joinPoint, String methodName, String module, String description);

    Map<String, Object> getLogInfoByPage(int page, int limit);

    void delAllLog(List<LogVo> logs);

    void delLog(int id);

    Map<String, Object> getLogInfoByParams(int page, int limit, LogSearchParamsVo logSearchParamsVo);
}
