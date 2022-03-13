package com.syuct.service.impl;

import com.syuct.mapper.MainMapper;
import com.syuct.service.MainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * @Author Zsz
 * @Date 2022/3/12 16:08
 * @Version 1.0
 **/
@Service
public class MainServiceImpl implements MainService {

    @Autowired
    private MainMapper mainMapper;

    @Override
    public int getSaleCount() {
        int count = mainMapper.getSaleCount();
        return count;
    }

    @Override
    public int getSaleSumCount() {
        int count = mainMapper.getSumSaleCount();
        return count;
    }

    @Override
    public int getsaleMoneyCount() {
        int count = mainMapper.getsaleMoneyCount();
        return count;
    }

    @Override
    public int getSumMoneyCount() {
        int count = mainMapper.getSumMoneyCount();
        return count;
    }

    @Override
    public int getSaleNumber() {
        int count = mainMapper.getSaleNumber();
        return count;
    }

    @Override
    public int getGoodsCount() {
        int count = mainMapper.getGoodsCount();
        return count;
    }

    @Override
    public int getWarningCount() {
        int count = mainMapper.getWarningCount();
        return count;
    }
}
