package com.syuct.mapper;

import org.springframework.stereotype.Repository;

/**
 * @Author Zsz
 * @Date 2021/11/22 21:42
 * @Version 1.0
 **/
@Repository
public interface AccountMapper {

    String getAccountNameById(int accountId);

    String getAccountIdByName(String name);
}
