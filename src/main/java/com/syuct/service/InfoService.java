package com.syuct.service;

import com.syuct.pojo.Member;
import com.syuct.pojo.Store;
import com.syuct.pojo.Supplier;
import com.syuct.pojo.vo.AccountVo;
import com.syuct.pojo.vo.AddSupplierVo;
import com.syuct.pojo.vo.SupplierVo;
import com.syuct.pojo.vo.searchParamsVo.AccountSearchParamsVo;
import com.syuct.pojo.vo.searchParamsVo.MemberSearchParamsVo;
import com.syuct.pojo.vo.searchParamsVo.StoreSearchParamsVo;
import com.syuct.pojo.vo.searchParamsVo.SupplierSearchParamsVo;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

/**
 * @Author Zsz
 * @Date 2021/11/22 20:56
 * @Version 1.0
 **/
public interface InfoService {

    Map<String, Object> getSupplierInfoByPage(int page, int limit);

    Map<String, Object> getSupplierInfoByParams(int page, int limit, SupplierSearchParamsVo supplierSearchParamsVo);

    void delAllSupplierbyId(List<SupplierVo> supplierVoList);

    void delSupplierbyId(int id);

    Map<String, Object> getAccountInfoByPage(int page, int limit);

    Map<String, Object> getAccountInfoByParams(int page, int limit, AccountSearchParamsVo accountSearchParamsVo);

    void delAllAccountById(List<AccountVo> accountVoList);

    void delAccountbyId(int id);

    AccountVo getAccountInfoById(int id);

    int addAccount(AccountVo accountVo);

    int updAccountInfo(AccountVo accountVo);

    //此方法查询的是供应商账户
    Map<String, Object> getAccountIdName(int page, int limit);

    Map<String, Object> getAccountIdName(int page, int limit, String searchParams);

    int addSupplier(AddSupplierVo supplier);

    AddSupplierVo getSupplierInfoById(int id);

    int editSupplier(AddSupplierVo supplier);

    Map<String, Object> getMemberInfoByPage(int page, int limit);

    Map<String, Object> getMemberInfoByParams(MemberSearchParamsVo memberSearchParamsVo, int page, int limit);

    int addMumber(Member member);

    Member getMemberInfoById(int id);

    int editMember(Member member);

    int delMemberById(int id);

    void delAllMemberById(List<Member> memberList);

    Map<String, Object> getStoreInfoByPage(int page, int limit);

    Map<String, Object> getStoreInfoByParams(StoreSearchParamsVo searchParams, int page, int limit);

    Store getStoreInfoById(int id);

    int delStoreInfoById(int id);

    void delAllStoreInfo(List<Store> stores);

    int addStore(Store store);

    int editStore(Store store);

    Store getStoreInfoByName(String name);

    Integer getSupplierIdByName(String supplier);

    Map<String, Object> getSystemAccountIdName(int page, int limit);

    Map<String, Object> getSystemAccountIdName(int page, int limit, String searchParams);

    void updAccountNowMoneyById(int id, BigDecimal money);

    Integer getMemberIdByName(String member);

}
