package com.syuct.service.impl;

import com.alibaba.fastjson.JSON;
import com.syuct.mapper.CommodityMapper;
import com.syuct.mapper.DepotMapper;
import com.syuct.mapper.InfoMapper;
import com.syuct.mapper.PurchaseMapper;
import com.syuct.pojo.*;
import com.syuct.pojo.vo.DepotInventoryVo;
import com.syuct.pojo.vo.StoreOutInVo;
import com.syuct.pojo.vo.searchParamsVo.DepotInventorySearchParamsVo;
import com.syuct.pojo.vo.searchParamsVo.StoreOutInSearchParamsVo;
import com.syuct.service.AdminService;
import com.syuct.service.DepotService;
import com.syuct.utils.AssertUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author Zsz
 * @Date 2022/3/9 11:48
 * @Version 1.0
 **/
@Service
public class DepotServiceImpl implements DepotService {

    @Autowired
    private DepotMapper depotMapper;

    @Autowired
    private PurchaseMapper purchaseMapper;

    @Autowired
    private AdminService adminService;

    @Autowired
    private InfoMapper infoMapper;

    @Autowired
    private CommodityMapper commodityMapper;

    @Override
    public Map<String, Object> getDepotInventoryByPage(int page, int limit) {

        page = (page - 1) * limit;
        HashMap<String, Object> map = new HashMap<>();
        map.put("code", 0);
        int count = depotMapper.getDepotInventoryCount();
        map.put("count", count);


        List<DepotInventoryVo> depotInventoryVoLists = depotMapper.getDepotInventoryByPage(page, limit);
        map.put("data", depotInventoryVoLists);
        return map;
    }

    @Override
    public Map<String, Object> getDepotInventoryByParams(int page, int limit, String searchParams) {
        DepotInventorySearchParamsVo depotInventorySearchParamsVo = JSON.parseObject(searchParams, DepotInventorySearchParamsVo.class);
        String goodsName = depotInventorySearchParamsVo.getGoodsName();
        String storeName = depotInventorySearchParamsVo.getStoreName();
        page = (page - 1) * limit;
        HashMap<String, Object> map = new HashMap<>();
        map.put("code", 0);
        int count = depotMapper.getDepotInventoryCountByparams(goodsName,storeName);
        map.put("count", count);


        List<DepotInventoryVo> depotInventoryVoLists = depotMapper.getDepotInventoryByParams(goodsName, storeName, page, limit);
        map.put("data", depotInventoryVoLists);
        return map;
    }

    @Override
    @Transactional
    public void addStoreIn(StoreInVo storeInVo, Authentication authentication) {
        String store = storeInVo.getStore();
        String goods = storeInVo.getGoods();
        String[] split = store.trim().split("-");
        int storeId = Integer.parseInt(split[0]);
        AssertUtil.isTrue(storeId == 0, "数据异常，请重新处理！");
        String[] split1 = goods.trim().split("-");
        int goodsId = Integer.parseInt(split1[0]);
        AssertUtil.isTrue(goodsId == 0, "数据异常，请重新处理！");
        StoreInventory storeInventory = purchaseMapper.getStoreInventoryByGSId(goodsId, storeId);
        if (storeInventory == null) {//说明此时指定仓库内没有该商品，应该直接插入数据
            StoreInventory sInventory = new StoreInventory();
            sInventory.setGoodsId(goodsId);
            sInventory.setInventory(storeInVo.getNumber());
            sInventory.setStoreId(storeId);
            purchaseMapper.addStoreInventory(sInventory);
        } else {
            int nowInventory = storeInventory.getInventory() + storeInVo.getNumber();
            storeInventory.setInventory(nowInventory);
            purchaseMapper.updStoreInventory(goodsId, storeId, storeInventory.getInventory());
        }
        String name = authentication.getName();
        Admin admin = adminService.getAdminByusername(name);
        int adminId = admin.getId();
        StoreLog storeLog = new StoreLog();
        storeLog.setType(3);
        storeLog.setStoreId(storeId);
        storeLog.setGoodsId(goodsId);
        storeLog.setNumber(storeInVo.getNumber());
        storeLog.setPerson(adminId);
        storeLog.setDate(new Date());
        purchaseMapper.addStoreLog(storeLog);

    }

    @Override
    @Transactional
    public void addstoreOut(StoreInVo storeInVo, Authentication authentication) {
        String store = storeInVo.getStore();
        String goods = storeInVo.getGoods();
        String[] split = store.trim().split("-");
        int storeId = Integer.parseInt(split[0]);
        AssertUtil.isTrue(storeId == 0, "数据异常，请重新处理！");
        String[] split1 = goods.trim().split("-");
        int goodsId = Integer.parseInt(split1[0]);
        AssertUtil.isTrue(goodsId == 0, "数据异常，请重新处理！");
        StoreInventory storeInventory = purchaseMapper.getStoreInventoryByGSId(goodsId, storeId);

        AssertUtil.isTrue(storeInventory == null, storeId + "号仓库没有该商品！");
        int nowInventory = storeInventory.getInventory() - storeInVo.getNumber();
        AssertUtil.isTrue(nowInventory < 0, "订单内" + goodsId + "号商品库存不足！");
        storeInventory.setInventory(nowInventory);
        purchaseMapper.updStoreInventory(goodsId, storeId, storeInventory.getInventory());

        String name = authentication.getName();
        Admin admin = adminService.getAdminByusername(name);
        int adminId = admin.getId();
        StoreLog storeLog = new StoreLog();
        storeLog.setType(4);
        storeLog.setStoreId(storeId);
        storeLog.setGoodsId(goodsId);
        storeLog.setNumber(storeInVo.getNumber());
        storeLog.setPerson(adminId);
        storeLog.setDate(new Date());
        purchaseMapper.addStoreLog(storeLog);
    }





    @Override
    public Map<String, Object> getStoreOutInInfoByPage(int page, int limit) {

        page = (page - 1) * limit;
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        int count = depotMapper.getStoreOutInInfoCount();
        map.put("count", count);
        List<StoreOutInVo> storeOutInVos = depotMapper.getStoreOutInInfoByPage(page, limit);
        for (StoreOutInVo s :
                storeOutInVos) {
            s.setStoreInName(infoMapper.getStoreInfoById(Integer.parseInt(s.getStoreInName())).getName());
            s.setStoreOutName(infoMapper.getStoreInfoById(Integer.parseInt(s.getStoreOutName())).getName());
            if ("0".equals(s.getStatus())) {
                s.setStatus("未审核出入库");
            } else if("1".equals(s.getStatus())){
                s.setStatus("已成功出入库");
            }
        }
        map.put("data", storeOutInVos);
        return map;
    }

    @Override
    public Map<String, Object> getStoreOutInInfoByParams(String searchParams, int page, int limit) {
        StoreOutInSearchParamsVo storeOutInSearchParamsVo = JSON.parseObject(searchParams, StoreOutInSearchParamsVo.class);
        String goodsName = storeOutInSearchParamsVo.getGoodsName();
        String storeName = storeOutInSearchParamsVo.getStoreName();
        Integer storeId = null;
        Store storeInfoByName = infoMapper.getStoreInfoByName(storeName);
        if (storeInfoByName == null && !"".equals(storeName)) {
            storeId = 0;
        }else if("".equals(storeName)){
            storeId = null;
        }else {
            storeId = storeInfoByName.getId();
        }

        Integer goodsId = infoMapper.getGoodsIdByName(goodsName);

        if (goodsId == null && !"".equals(goodsName)) {
            goodsId = 0;
        }
        page = (page - 1) * limit;
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        int count = depotMapper.getStoreOutInInfoCountByParams(storeId, goodsId);
        map.put("count", count);
        List<StoreOutInVo> storeOutInVos = depotMapper.getStoreOutInInfoByParams(storeId, goodsId, page, limit);
        for (StoreOutInVo s :
                storeOutInVos) {
            s.setStoreInName(infoMapper.getStoreInfoById(Integer.parseInt(s.getStoreInName())).getName());
            s.setStoreOutName(infoMapper.getStoreInfoById(Integer.parseInt(s.getStoreOutName())).getName());
            if ("0".equals(s.getStatus())) {
                s.setStatus("未审核出入库");
            } else if("1".equals(s.getStatus())){
                s.setStatus("已成功出入库");
            }
        }
        map.put("data", storeOutInVos);
        return map;
    }

    @Override
    public void addStoreOutIn(StoreOutInVo storeOutInVo) {
    //StoreOutInVo(id=0, storeOutName=1-默认仓库, goodsName=1-优酸乳, number=111, storeInName=2-仓库一号,
    // creatTime=null, status=null, deleteFlag=null)
        AssertUtil.isTrue("".equals(storeOutInVo.getStoreOutName()), "转出仓库不能为空！");
        AssertUtil.isTrue("".equals(storeOutInVo.getStoreInName()), "转入仓库不能为空！");
        AssertUtil.isTrue("".equals(storeOutInVo.getNumber()), "数量不能为空！");
        AssertUtil.isTrue("".equals(storeOutInVo.getGoodsName()), "商品名不能为空！");

        AssertUtil.isTrue(storeOutInVo.getStoreInName().equals(storeOutInVo.getStoreOutName()), "转入仓库与转出仓库不能相同！");
        StoreOutIn storeOutIn = new StoreOutIn();
        String[] split = storeOutInVo.getGoodsName().trim().split("-");
        storeOutIn.setGoodsId(Integer.parseInt(split[0]));
        storeOutIn.setStoreIn(Integer.parseInt(storeOutInVo.getStoreInName().trim().split("-")[0]));
        storeOutIn.setStoreOut(Integer.parseInt(storeOutInVo.getStoreOutName().trim().split("-")[0]));
        storeOutIn.setStatus(0);//代表未审核出入库
        storeOutIn.setCreatTime(new Date());
        storeOutIn.setNumber(storeOutInVo.getNumber());
        storeOutIn.setDeleteFlag(0);
        depotMapper.addStoreOutIn(storeOutIn);
    }

    @Override
    public void delOutIn(int id) {
        int status = depotMapper.getStoreOutInStatusById(id);
        AssertUtil.isTrue(status == 1, "已审核条目无法删除！");
        depotMapper.delOutIn(id);
    }

    @Override
    @Transactional
    public void delAllOutIn(List<StoreOutInVo> storeOutInVos) {
        for (StoreOutInVo s :
                storeOutInVos) {
            AssertUtil.isTrue("已成功出入库".equals(s.getStatus()), "要删除的条目包含已审核订单，请重新选择！");
            depotMapper.delOutIn(s.getId());
        }
    }

    @Override
    @Transactional
    public void verifyOutIn(int id, Authentication authentication) {
        StoreOutIn storeOutIn = depotMapper.getStoreOutInInfoById(id);
        AssertUtil.isTrue(storeOutIn.getStatus() == 1, "此条目已审核完成并成功调拨！");
        String name = authentication.getName();
        Admin admin = adminService.getAdminByusername(name);
        StoreLog storeLog = new StoreLog();
        storeLog.setPerson(admin.getId());
        storeLog.setDate(new Date());
        storeLog.setNumber(storeOutIn.getNumber());
        storeLog.setGoodsId(storeOutIn.getGoodsId());
        storeLog.setStoreId(storeOutIn.getStoreOut());
        storeLog.setType(5);//5代表调拨出库

        StoreInventory storeInventoryByGSId = purchaseMapper.getStoreInventoryByGSId(storeOutIn.getGoodsId(), storeOutIn.getStoreOut());

        AssertUtil.isTrue(storeInventoryByGSId == null, storeOutIn.getStoreOut() + " 内没有" +storeOutIn.getGoodsId() + "号商品");
        AssertUtil.isTrue(storeInventoryByGSId.getInventory() < storeOutIn.getNumber(),"该仓库库存不足，库存量为" + storeInventoryByGSId.getInventory());
        int nowInventory = storeInventoryByGSId.getInventory() - storeOutIn.getNumber();
        System.out.println(storeInventoryByGSId);
        System.out.println(nowInventory);
        purchaseMapper.updStoreInventory(storeOutIn.getGoodsId(), storeOutIn.getStoreOut(), nowInventory);
        purchaseMapper.addStoreLog(storeLog);


        storeLog.setStoreId(storeOutIn.getStoreIn());
        storeLog.setType(6);//代表调拨入库
        StoreInventory storeInventory = purchaseMapper.getStoreInventoryByGSId(storeOutIn.getGoodsId(), storeOutIn.getStoreIn());
        nowInventory = storeInventory.getInventory() + storeOutIn.getNumber();
        System.out.println(nowInventory);

        if (storeInventory == null) {
            StoreInventory sInventory = new StoreInventory();
            sInventory.setGoodsId(storeOutIn.getGoodsId());
            sInventory.setStoreId(storeOutIn.getStoreIn());
            sInventory.setInventory(nowInventory);
            purchaseMapper.addStoreInventory(sInventory);
        } else {
            purchaseMapper.updStoreInventory(storeOutIn.getGoodsId(), storeOutIn.getStoreIn(), nowInventory);
        }
        purchaseMapper.addStoreLog(storeLog);
        depotMapper.verifyOutIn(id);
    }
}
