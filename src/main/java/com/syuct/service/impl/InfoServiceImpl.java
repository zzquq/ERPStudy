package com.syuct.service.impl;

import com.syuct.mapper.AccountMapper;
import com.syuct.mapper.InfoMapper;
import com.syuct.pojo.Account;
import com.syuct.pojo.Member;
import com.syuct.pojo.Store;
import com.syuct.pojo.Supplier;
import com.syuct.pojo.vo.AccountIdNameVo;
import com.syuct.pojo.vo.AccountVo;
import com.syuct.pojo.vo.AddSupplierVo;
import com.syuct.pojo.vo.SupplierVo;
import com.syuct.pojo.vo.searchParamsVo.AccountSearchParamsVo;
import com.syuct.pojo.vo.searchParamsVo.MemberSearchParamsVo;
import com.syuct.pojo.vo.searchParamsVo.StoreSearchParamsVo;
import com.syuct.pojo.vo.searchParamsVo.SupplierSearchParamsVo;
import com.syuct.service.InfoService;
import com.syuct.utils.AssertUtil;
import com.syuct.utils.FormatConversion;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @Author Zsz
 * @Date 2021/11/22 20:57
 * @Version 1.0
 **/
@Service
public class InfoServiceImpl implements InfoService {

    @Autowired
    private InfoMapper infoMapper;

    @Autowired
    private AccountMapper accountMapper;

    Pattern pattern = Pattern.compile("-?[0-9]+\\.?[0-9]*");

    @Override
    public Map<String, Object> getSupplierInfoByPage(int page, int limit) {
        page = (page - 1) * limit;
        List<Supplier> supplierInfoByPage = infoMapper.getSupplierInfoByPage(page, limit);
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        int count = infoMapper.getSupplierCounts();
        map.put("count", count);
        ArrayList<SupplierVo> supplierVos = new ArrayList<>();
        for (Supplier supplier :
                supplierInfoByPage) {
            SupplierVo supplierVo = new SupplierVo();
            BeanUtils.copyProperties(supplier, supplierVo);
            //通过ID查询账户名称
            String accountName = accountMapper.getAccountNameById(supplier.getAccountId());
            supplierVo.setAccountName(accountName);
            supplierVos.add(supplierVo);
        }
        map.put("data", supplierVos);
        return map;
    }

    @Override
    public Map<String, Object> getSupplierInfoByParams(int page, int limit, SupplierSearchParamsVo supplierSearchParamsVo) {
        page = (page - 1) * limit;
        int id = supplierSearchParamsVo.getId();
        String name = supplierSearchParamsVo.getName();
        List<Supplier> supplierInfoByPage = infoMapper.getSupplierInfoByParams(id, name, page, limit);
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        int count = infoMapper.getSupplierCountsByParams(id, name, page, limit);
        map.put("count", count);
        ArrayList<SupplierVo> supplierVos = new ArrayList<>();
        for (Supplier supplier :
                supplierInfoByPage) {
            SupplierVo supplierVo = new SupplierVo();
            BeanUtils.copyProperties(supplier, supplierVo);
            //通过ID查询账户名称
            String accountName = accountMapper.getAccountNameById(supplier.getAccountId());
            supplierVo.setAccountName(accountName);
            supplierVos.add(supplierVo);
        }
        map.put("data", supplierVos);
        return map;
    }

    @Override
    @Transactional(propagation= Propagation.REQUIRED, rollbackFor = Exception.class)
    public void delAllSupplierbyId(List<SupplierVo> supplierVoList) {
        AssertUtil.isTrue(supplierVoList.isEmpty(), "请先选择供应商！");
        for (SupplierVo supplierVo :
                supplierVoList) {
            infoMapper.delSupplierByid(supplierVo.getId());
        }
    }

    @Override
    public void delSupplierbyId(int id) {
        infoMapper.delSupplierByid(id);
    }

    @Override
    public Map<String, Object> getAccountInfoByPage(int page, int limit) {
        page = (page - 1) * limit;

        List<Account> accountInfoByPage = infoMapper.getAccountInfoByPage(page, limit);
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        int count = infoMapper.getAccountCounts();
        map.put("count", count);
        List<AccountVo> data = new ArrayList<>();
        for (Account account :
                accountInfoByPage) {
            AccountVo accountVo = new AccountVo();
            BeanUtils.copyProperties(account, accountVo);

            if (account.getFlag() == 1) {
                accountVo.setNowMoney(("供应商账户，该条目不予展示！"));
            } else {
//                在double d的值非常大或者非常小的时候，d会转换为科记学数法表示，我们看到的string字串就会和原本的d的表示形式不一样.
                //                accountVo.setNowMoney(account.getNowMoney() + "");
                accountVo.setNowMoney(FormatConversion.doubleToString(account.getNowMoney()));
            }

            data.add(accountVo);
        }
        map.put("data", data);
        return map;
    }

    @Override
    public Map<String, Object> getAccountInfoByParams(int page, int limit, AccountSearchParamsVo accountSearchParamsVo) {
        page = (page - 1) * limit;
        int id = accountSearchParamsVo.getId();
        String name = accountSearchParamsVo.getName();
        String flag = accountSearchParamsVo.getFlag();

        List<Account> accountInfoByPage = infoMapper.getAccountInfoByParams(id, name, flag, page, limit);
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        int count = infoMapper.getAccountCountsByParams(id, name);
        map.put("count", count);
        List<AccountVo> data = new ArrayList<>();
        for (Account account :
                accountInfoByPage) {
            AccountVo accountVo = new AccountVo();
            BeanUtils.copyProperties(account, accountVo);

            if (account.getFlag() == 1) {
                accountVo.setNowMoney(("供应商账户，该条目不予展示！"));
            } else {
                accountVo.setNowMoney(FormatConversion.doubleToString(account.getNowMoney()));
            }


            data.add(accountVo);
        }
        map.put("data", data);
        return map;
    }

    @Override
    public void delAllAccountById(List<AccountVo> accountVoList) {
        AssertUtil.isTrue(accountVoList.isEmpty(),"请先选择账户");
        for (AccountVo accountVo :
                accountVoList) {
            infoMapper.delAccountById(accountVo.getId());
        }
    }

    @Override
    public void delAccountbyId(int id) {
        infoMapper.delAccountById(id);
    }

    @Override
    public AccountVo getAccountInfoById(int id) {
        Account account = infoMapper.getgetAccountInfoById(id);

        AccountVo accountVo = new AccountVo();
        BeanUtils.copyProperties(account, accountVo);
        if (account.getFlag() == 1) {
            accountVo.setNowMoney("供应商账号，此条目禁止修改！");
        }else {
            accountVo.setNowMoney(FormatConversion.doubleToString(account.getNowMoney()));
        }
        return accountVo;
    }

    @Override
    public int addAccount(AccountVo accountVo) {
        Account account = new Account();
        BeanUtils.copyProperties(accountVo, account);
        account.setStatus(1);
        if (accountVo.getFlag() == 1) {
            account.setNowMoney(0.0);
        } else {
            if ((accountVo.getNowMoney() + "").indexOf(".") != -1) {
                int length = (accountVo.getNowMoney() + "").length() - (accountVo.getNowMoney() + "").indexOf(".") - 1;
                AssertUtil.isTrue(length > 2, "请输入正确的余额！");
            }
            account.setNowMoney(Double.parseDouble(accountVo.getNowMoney()));
        }
        int i = infoMapper.addAccount(account);
        return i;
    }

    @Override
    public int updAccountInfo(AccountVo accountVo) {
        Account account = new Account();
        BeanUtils.copyProperties(accountVo, account);
        if (accountVo.getFlag() == 1) {
            account.setNowMoney(0.0);
        } else {
            if ((accountVo.getNowMoney() + "").indexOf(".") != -1) {
                int length = (accountVo.getNowMoney() + "").length() - (accountVo.getNowMoney() + "").indexOf(".") - 1;
                AssertUtil.isTrue(length > 2, "请输入正确的余额！");
            }

            account.setNowMoney(Double.parseDouble(accountVo.getNowMoney()));
        }
        int i = infoMapper.updAccountInfo(account);
        return i;
    }


    @Override
    public Map<String, Object> getAccountIdName(int page, int limit) {
        page = (page - 1) * limit;
        int accountCounts = infoMapper.getSupplierAccountCounts();
        List<Account> accountInfoByPage = infoMapper.getSupplierAccountInfoByPage(page, limit);

        Map<String, Object> map = new HashMap<>();

        map.put("count", accountCounts);
        map.put("code", 0);
        List<AccountIdNameVo> data = new ArrayList<>();

        for (Account account :
                accountInfoByPage) {
            AccountIdNameVo accountIdNameVo = new AccountIdNameVo();
            accountIdNameVo.setId(account.getId());
            accountIdNameVo.setName(account.getName());
            data.add(accountIdNameVo);
        }
        map.put("data", data);
        return map;
    }

    @Override
    public Map<String, Object> getAccountIdName(int page, int limit, String searchParams) {
        page = (page - 1) * limit;
        int accountCounts = infoMapper.getSupplierAccountCountsByParams(searchParams);

        List<Account> accountInfoByPage = infoMapper.getSupplierAccountInfoByPageParam(searchParams, page, limit);
        Map<String, Object> map = new HashMap<>();

        map.put("count", accountCounts);
        map.put("code", 0);
        List<AccountIdNameVo> data = new ArrayList<>();

        for (Account account :
                accountInfoByPage) {
            AccountIdNameVo accountIdNameVo = new AccountIdNameVo();
            accountIdNameVo.setId(account.getId());
            accountIdNameVo.setName(account.getName());
            data.add(accountIdNameVo);
        }
        map.put("data", data);
        return map;
    }

    @Override
    public int addSupplier(AddSupplierVo supplier) {

        AssertUtil.isTrue(supplier.getAccountId().isEmpty(),  "账户ID不能为空，如果当前没有账户数据，请前往《账户信息》新建账户！");
        AssertUtil.isTrue(supplier.getPhone().isEmpty(),"供应商电话不能为空！");
        Matcher isNum = pattern.matcher(supplier.getAccountId());
        AssertUtil.isTrue(!isNum.matches(), "请输入正确的账户ID");
        Supplier newSupplier = new Supplier();
        BeanUtils.copyProperties(supplier, newSupplier);
        newSupplier.setStatus(1);
        newSupplier.setAccountId(Integer.parseInt(supplier.getAccountId()));
        int i = infoMapper.addSupplier(newSupplier);
        return i;
    }

    @Override
    public AddSupplierVo getSupplierInfoById(int id) {
        Supplier supplier = infoMapper.getSupplierInfoById(id);
        AddSupplierVo supplierVo = new AddSupplierVo();
        supplierVo.setId(supplier.getId());
        supplierVo.setName(supplier.getName());
        supplierVo.setPhone(supplier.getPhone());
        supplierVo.setAddress(supplier.getAddress());
        supplierVo.setFax(supplier.getFax());
        supplierVo.setEmail(supplier.getEmail());

        supplierVo.setAccountId(supplier.getAccountId()+"");
        supplierVo.setRemark(supplier.getRemark());
        return supplierVo;
    }

    @Override
    public int editSupplier(AddSupplierVo supplier) {
        AssertUtil.isTrue(supplier.getAccountId().isEmpty(),  "账户ID不能为空，如果当前没有账户数据，请前往《账户信息》新建账户！");
        AssertUtil.isTrue(supplier.getPhone().isEmpty(),"供应商电话不能为空！");
        Matcher isNum = pattern.matcher(supplier.getAccountId());
        AssertUtil.isTrue(!isNum.matches(), "请输入正确的账户ID");
        Supplier newSupplier = new Supplier();
        BeanUtils.copyProperties(supplier, newSupplier);
        newSupplier.setAccountId(Integer.parseInt(supplier.getAccountId()));

        int i = infoMapper.updSupplierInfo(newSupplier);
        return i;
    }

    @Override
    public Map<String, Object> getMemberInfoByPage(int page, int limit) {
        page = (page - 1) * limit;
        int accountCounts = infoMapper.getMemberCounts();

        List<Member> memberInfoByPage = infoMapper.getMemberInfoByPage(page, limit);

        Map<String, Object> map = new HashMap<>();

        map.put("count", accountCounts);
        map.put("code", 0);

        map.put("data", memberInfoByPage);
        return map;
    }

    @Override
    public Map<String, Object> getMemberInfoByParams(MemberSearchParamsVo memberSearchParamsVo, int page, int limit) {
        page = (page - 1) * limit;
        int id = memberSearchParamsVo.getId();
        String name = memberSearchParamsVo.getName();
        String phone = memberSearchParamsVo.getPhone();
        int memberCountsByParams = infoMapper.getMemberCountsByParams(id, name, phone);
        Map map = new HashMap<String, Object>();
        map.put("count", memberCountsByParams);
        map.put("code", 0);

        List<Member> members = infoMapper.getMemberInfoByParas(id, name, phone, page, limit);
        map.put("data", members);
        return map;
    }

    @Override
    public int addMumber(Member member) {
        member.setStatus(1);
        int i = infoMapper.addMumber(member);
        return i;
    }

    @Override
    public Member getMemberInfoById(int id) {
        Member memberInfoById = infoMapper.getMemberInfoById(id);
        return memberInfoById;
    }

    @Override
    public int editMember(Member member) {
        int i = infoMapper.editMember(member);
        return i;
    }

    @Override
    public int delMemberById(int id) {
        AssertUtil.isTrue(id == 0, "删除失败，请重试！");
        int i = infoMapper.delMemberById(id);
        return i;
    }

    @Override
    @Transactional(propagation= Propagation.REQUIRED, rollbackFor = Exception.class)
    public void delAllMemberById(List<Member> memberList) {
        AssertUtil.isTrue(memberList.isEmpty(), "请先选择会员信息！");
        for (Member m :
                memberList) {
            infoMapper.delMemberById(m.getId());
        }
    }

    @Override
    public Map<String, Object> getStoreInfoByPage(int page, int limit) {
        page = (page - 1) * limit;
        int storeCounts = infoMapper.getStoreCounts();
        List<Store> storeInfoByPage = infoMapper.getStoreInfoByPage(page, limit);

        Map<String, Object> map = new HashMap<>();

        map.put("count", storeCounts);
        map.put("code", 0);
        List<Store> data = new ArrayList<>();

        for (Store s :
                storeInfoByPage) {
            data.add(s);
        }

        map.put("data", data);
        return map;
    }

    @Override
    public Map<String, Object> getStoreInfoByParams(StoreSearchParamsVo searchParams, int page, int limit) {
        page = (page - 1) * limit;
        int id = searchParams.getId();
        String name = searchParams.getName();
        String address = searchParams.getAddress();
        int storeCounts = infoMapper.getStoreCountsByParams(id, name, address);
        List<Store> storeInfoByParams = infoMapper.getStoreInfoByParams(id, name, address, page, limit);

        Map<String, Object> map = new HashMap<>();

        map.put("count", storeCounts);
        map.put("code", 0);
        List<Store> data = new ArrayList<>();
        for (Store s :
                storeInfoByParams) {
            data.add(s);
        }
        map.put("data", data);
        return map;
    }

    @Override
    public Store getStoreInfoById(int id) {
        Store store = infoMapper.getStoreInfoById(id);
        return store;
    }

    @Override
    public int delStoreInfoById(int id) {
        AssertUtil.isTrue(id == 0, "删除失败，请重试！");
        int i = infoMapper.delStoreById(id);
        return i;
    }

    @Override
    @Transactional(propagation= Propagation.REQUIRED, rollbackFor = Exception.class)
    public void delAllStoreInfo(List<Store> stores) {
        AssertUtil.isTrue(stores.isEmpty(), "请先选择仓库信息！");
        for (Store s :
                stores) {
            infoMapper.delStoreById(s.getId());
        }
    }

    @Override
    public int addStore(Store store) {
        store.setStatus(1);
        int i = infoMapper.addStore(store);
        return i;
    }

    @Override
    @Transactional(propagation= Propagation.REQUIRED, rollbackFor = Exception.class)
    public int editStore(Store store) {
        int i =  infoMapper.editStore(store);
        return i;
    }

    @Override
    public Store getStoreInfoByName(String name) {

        Store store = infoMapper.getStoreInfoByName(name);
        return store;
    }

    @Override
    public Integer getSupplierIdByName(String name) {

        Integer id = infoMapper.getSupplierIdByName(name);
        return id;
    }

    @Override
    public Map<String, Object> getSystemAccountIdName(int page, int limit) {
        page = (page - 1) * limit;
        int accountCounts = infoMapper.getSystemAccountCounts();
        List<Account> accountInfoByPage = infoMapper.getSystemAccountInfoByPage(page, limit);

        Map<String, Object> map = new HashMap<>();

        map.put("count", accountCounts);
        map.put("code", 0);
        List<AccountIdNameVo> data = new ArrayList<>();

        for (Account account :
                accountInfoByPage) {
            AccountIdNameVo accountIdNameVo = new AccountIdNameVo();
            accountIdNameVo.setId(account.getId());
            accountIdNameVo.setName(account.getName());
            data.add(accountIdNameVo);
        }
        map.put("data", data);
        return map;
    }

    @Override
    public Map<String, Object> getSystemAccountIdName(int page, int limit, String searchParams) {
        page = (page - 1) * limit;
        int accountCounts = infoMapper.getSystemAccountCountsByParams(searchParams);

        List<Account> accountInfoByPage = infoMapper.getSystemAccountInfoByParams(searchParams, page, limit);
        Map<String, Object> map = new HashMap<>();

        map.put("count", accountCounts);
        map.put("code", 0);
        List<AccountIdNameVo> data = new ArrayList<>();

        for (Account account :
                accountInfoByPage) {
            AccountIdNameVo accountIdNameVo = new AccountIdNameVo();
            accountIdNameVo.setId(account.getId());
            accountIdNameVo.setName(account.getName());
            data.add(accountIdNameVo);
        }
        map.put("data", data);
        return map;
    }

    @Override
    public void updAccountNowMoneyById(int id, BigDecimal money) {
        infoMapper.updAccountNowMoneyById(id, money);
    }

    @Override
    public Integer getMemberIdByName(String name) {

        Integer id = infoMapper.getMemberIdByName(name);
        return id;
    }

}
