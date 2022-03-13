package com.syuct.mapper;

import com.syuct.pojo.Account;
import com.syuct.pojo.Member;
import com.syuct.pojo.Store;
import com.syuct.pojo.Supplier;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.List;

/**
 * @Author Zsz
 * @Date 2021/11/22 21:09
 * @Version 1.0
 **/
@Repository
public interface InfoMapper {

    List<Supplier> getSupplierInfoByPage(int page, int limit);


    int getSupplierCounts();

    List<Supplier> getSupplierInfoByParams(int id, String name, int page, int limit);

    int getSupplierCountsByParams(int id, String name, int page, int limit);

    void delSupplierByid(int id);

    List<Account> getAccountInfoByPage(int page, int limit);


    int getAccountCounts();

    List<Account> getAccountInfoByParams(int id, String name, String flag, int page, int limit);


    int getAccountCountsByParams(int id, String name);

    void delAccountById(int id);

    Account getgetAccountInfoById(int id);

    int addAccount(Account account);

    int updAccountInfo(Account account);

    List<Account> getAccountInfoByPageParam(String name, int page, int limit);

    int addSupplier(Supplier supplier);

    Supplier getSupplierInfoById(int id);

    int updSupplierInfo(Supplier supplier);

    int getMemberCounts();

    List<Member> getMemberInfoByPage(int page, int limit);

    int getMemberCountsByParams(int id, String name, String phone);

    List<Member> getMemberInfoByParas(int id, String name, String phone, int page, int limit);

    int addMumber(Member membe);

    Member getMemberInfoById(int id);

    int editMember(Member member);

    int delMemberById(int id);

    int getStoreCounts();

    List<Store> getStoreInfoByPage(int page, int limit);

    int getStoreCountsByParams(int id, String name, String address);

    List<Store> getStoreInfoByParams(int id, String name, String address, int page, int limit);

    Store getStoreInfoById(int id);

    int delStoreById(int id);

    int addStore(Store store);

    int editStore(Store store);

    List<Account> getSupplierAccountInfoByPage(int page, int limit);

    int getSupplierAccountCounts();

    int getSupplierAccountCountsByParams(String searchParams);

    List<Account> getSupplierAccountInfoByPageParam(String searchParams, int page, int limit);

    Store getStoreInfoByName(String name);

    Integer getSupplierIdByName(String name);

    int getSystemAccountCounts();

    List<Account> getSystemAccountInfoByPage(int page, int limit);

    int getSystemAccountCountsByParams(String searchParams);

    List<Account> getSystemAccountInfoByParams(String searchParams, int page, int limit);

    void updAccountNowMoneyById(int id, BigDecimal money);

    Integer getMemberIdByName(String name);

    Integer getGoodsIdByName(String goodsName);

    Integer getStoreIdByName(String storeName);
}
