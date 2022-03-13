package com.syuct.mapper;

import org.springframework.stereotype.Repository;

/**
 * @Author Zsz
 * @Date 2022/3/12 16:11
 * @Version 1.0
 **/
@Repository
public interface MainMapper {
    int getSaleCount();

    int getSumSaleCount();

    int getsaleMoneyCount();

    int getSumMoneyCount();

    int getSaleNumber();

    int getGoodsCount();

    int getWarningCount();
}
