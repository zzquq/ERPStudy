package com.syuct.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.syuct.mapper.CommodityMapper;
import com.syuct.pojo.Category;
import com.syuct.pojo.Goods;
import com.syuct.pojo.Measure;
import com.syuct.pojo.vo.AddSupplierVo;
import com.syuct.pojo.vo.GoodsVo;
import com.syuct.pojo.vo.searchParamsVo.GoodsSearchParamsVo;
import com.syuct.pojo.vo.searchParamsVo.SupplierSearchParamsVo;
import com.syuct.service.CommodityService;
import com.syuct.utils.AssertUtil;
import com.syuct.utils.DelTreeUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

/**
 * @Author Zsz
 * @Date 2022/1/10 18:18
 * @Version 1.0
 **/
@Service
public class CommodityServiceImpl implements CommodityService {

    @Autowired
    private CommodityMapper commodityMapper;
    @Autowired
    private InfoServiceImpl infoService;

    @Override
    public Map<String, Object> getCategoryInfo() {
        Map<String, Object> map = new HashMap<>();

        int count = commodityMapper.getCategoryCounts();
        map.put("code", 0);
        map.put("count", count);

        List<Category> list = new ArrayList<>();

        List<Category> catagorys = commodityMapper.getCategoryInfo();

        Category cg = new Category();
        cg.setId(0);
        cg.setPid(-1);
        cg.setName("类别总览");
        cg.setRemark("顶层类别");
        cg.setStatus(1);
        list.add(cg);

        for (Category c :
                catagorys) {
            list.add(c);
        }

        map.put("data", list);
        return map;
    }

    @Override
    public Map<String, Object> getCategoryIdNameByPage(int page, int limit) {
        page = (page - 1) * limit;
        Map<String, Object> map = new HashMap<>();
        int count = commodityMapper.getCategoryCounts();
        map.put("count", count);
        map.put("code", 0);
        List<Category> categoryInfo = commodityMapper.getCategoryInfoByPage(page, limit);
        map.put("data", categoryInfo);
        return map;
    }

    @Override
    public Map<String, Object> getCategoryIdNameByparams(String name, int page, int limit) {
        page = (page - 1) * limit;
        Map<String, Object> map = new HashMap<>();
        int count = commodityMapper.getCategoryCountsByName(name);
        map.put("count", count);
        map.put("code", 0);
        List<Category> categoryInfo = commodityMapper.getCategoryInfoByparams(name, page, limit);
        map.put("data", categoryInfo);
        return map;
    }

    @Override
    public int addCategory(Category category) {
        category.setPid(category.getId());
        category.setId(0);
        category.setStatus(1);
        int i = commodityMapper.addCategory(category);
        return i;
    }

    @Override
    @Transactional(propagation= Propagation.REQUIRED, rollbackFor = Exception.class)
    public int delCategoryById(int id) {
        AssertUtil.isTrue(id == 0, "此条目无法删除！");
        DelTreeUtil delTreeUtil = new DelTreeUtil();
        delTreeUtil.delTreeByInt(id);
        return 2;
    }

    @Override
    public Map<String, Object> getMeasureInfoByPage(int page, int limit) {
        page = (page - 1) * limit;
        Map<String, Object> map = new HashMap<>();
        int count = commodityMapper.getMeasureCountByPage();
        map.put("count", count);
        map.put("code", 0);
        List<Measure> measureList = commodityMapper.getMeasureInfoByPage(page, limit);
        map.put("data", measureList);
        return map;
    }

    @Override
    public int delMeasureById(int id) {
        int i = commodityMapper.delMeasureById(id);
        return i;
    }

    @Override
    @Transactional(propagation= Propagation.REQUIRED, rollbackFor = Exception.class)
    public void delAllMeasure(List<Measure> measures) {
        for (Measure m :
                measures) {
            commodityMapper.delMeasureById(m.getId());
        }
    }

    @Override
    public int addMeasure(Measure measure) {
        measure.setStatus(1);
        int i = commodityMapper.addMeasure(measure);
        return i;
    }

    @Override
    public Measure getMeasureInfoById(int id) {
        Measure measure = commodityMapper.getMeasureCountById(id);
        return measure;
    }

    @Override
    public int editMeasure(Measure measure) {
        int i = commodityMapper.editMeasure(measure);
        return i;
    }

    //已完成
    @Override
    public Map<String, Object> getGoodInfoBypage(int page, int limit) {
        page = (page - 1) * limit;
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        int count = commodityMapper.getGoodsCountBypage();
        map.put("count", count);
        List<GoodsVo> goodsList = commodityMapper.getGoodsInfoByPage(page, limit);
        int i = 0;
        for (GoodsVo good :
                goodsList) {
            List<String> suppliers = commodityMapper.getSupplierInfoByGoodId(good.getId());
            String supplier = suppliers.toString();
            String substring = supplier.substring(1, supplier.length() - 1);
            good.setSupplier(substring);
            if ("1".equals(good.getStatus())) {
                good.setStatus("正常");
            } else {
                good.setStatus("下架");
            }
        }
        map.put("data", goodsList);
        return map;
    }

    /***
     * 未完成
     * @param goodsSearchParamsVo
     * @param page
     * @param limit
     * @return
     */
    @Override
    public Map<String, Object> getGoodInfoByParams(GoodsSearchParamsVo goodsSearchParamsVo, int page, int limit) {
        page = (page - 1) * limit;
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        int id = goodsSearchParamsVo.getId();
        String name = goodsSearchParamsVo.getName();
        String supplier = goodsSearchParamsVo.getSupplier();
        int count = commodityMapper.getGoodsCountByParams(id, name, supplier);//已完成
        map.put("count", count);
        //这个地方还没完成
        List<GoodsVo> goodsList = commodityMapper.getGoodsInfoByParams(id, name, supplier, page, limit);
        if ("".equals(supplier)) {
            for (GoodsVo good :
                    goodsList) {
                List<String> suppliers = commodityMapper.getSupplierInfoByGoodId(good.getId());
                String allSupplier = suppliers.toString();
                String substring = allSupplier.substring(1, allSupplier.length() - 1);
                good.setSupplier(substring);
                if ("1".equals(good.getStatus())) {
                    good.setStatus("正常");
                } else {
                    good.setStatus("下架");
                }
            }
        } else {
            for (GoodsVo good :
                    goodsList) {
                good.setSupplier(supplier);
                if ("1".equals(good.getStatus())) {
                    good.setStatus("正常");
                } else {
                    good.setStatus("下架");
                }
            }
        }
        map.put("data", goodsList);
        return map;
    }

    @Override
    public Map<String, Object> getSupplierIdNameByPage(int page, int limit) {
        Map<String, Object> map = infoService.getSupplierInfoByPage(page, limit);
        return map;
    }

    @Override
    public Map<String, Object> getSupplierIdNameByParam(int page, int limit, String name) {
        SupplierSearchParamsVo supplierSearchParamsVo = new SupplierSearchParamsVo();
        supplierSearchParamsVo.setName(name);
        Map<String, Object> map = infoService.getSupplierInfoByParams(page, limit, supplierSearchParamsVo);
        return map;
    }

    @Override
    @Transactional
    public int addGoods(GoodsVo goodsVo) {
        goodsVo.setDeleteFlag(0);
        Goods goods = new Goods();
        BeanUtils.copyProperties(goodsVo,goods);
        goods.setStatus(1);
        goods.setCategoryId(Integer.parseInt(goodsVo.getCategory()));
        goods.setMeasureId(Integer.parseInt(goodsVo.getMeasure()));
        commodityMapper.addGoods(goods);
        int goodsId = goods.getId();
        String[] supplierIdStr = goodsVo.getSupplier().split(",");
        for (String supplierId :
                supplierIdStr) {
            int goodsSupplier = Integer.parseInt(supplierId);
            commodityMapper.addGoodsSupplier(goodsId, goodsSupplier);
        }
        return 1;
    }

    @Override
    public GoodsVo getGoogsInfoById(int id) {
        GoodsVo goodsVo = new GoodsVo();
        Goods goods = commodityMapper.getGoodsInfoById(id);
        List<Integer> supplierInfoByGoodId = commodityMapper.getSupploerIdListByGid(id);
        String s = supplierInfoByGoodId.toString().replace(" ", "");
        BeanUtils.copyProperties(goods,goodsVo);
        goodsVo.setCategory(goods.getCategoryId() + "");
        goodsVo.setMeasure(goods.getMeasureId() + "");
        goodsVo.setSupplier(s.substring(1, s.length() - 1));

        List<Integer> list = new ArrayList();
//        for (Integer i :
//                supplierInfoByGoodId) {
//            list.add()
//        }
        System.out.println(goodsVo);

        return goodsVo;
    }

    @Override
    public int updGoodsInfoById(GoodsVo goodsVo) {
        int i = commodityMapper.updGoodsInfoById(goodsVo);
        String[] split = goodsVo.getSupplier().split(",");
        commodityMapper.delGoodsSupplierByGid(goodsVo.getId());
        for (String c :
                split) {

            commodityMapper.addGoodsSupplier(goodsVo.getId(), Integer.parseInt(c));
        }
        return i;
    }

    @Override
    public int upGoodsStatusById(int id) {
        Goods goodsInfoById = commodityMapper.getGoodsInfoById(id);
        AssertUtil.isTrue(goodsInfoById.getStatus() == 1,"商品已经是上架状态！");
        int i = commodityMapper.upGoodsStatusById(id);
        return i;
    }

    @Override
    public int downGoodsStatusById(int id) {
        Goods goodsInfoById = commodityMapper.getGoodsInfoById(id);
        AssertUtil.isTrue(goodsInfoById.getStatus() == 0,"商品已经是下架状态！");
        int i = commodityMapper.downGoodsStatusById(id);
        return i;
    }

    @Override
    @Transactional
    public int delGoodsById(List<GoodsVo> goodsVos) {
        AssertUtil.isTrue(goodsVos == null, "请先选择数据！");
        for (GoodsVo g :
                goodsVos) {
            commodityMapper.delGoodsById(g.getId());
        }
        return 1;
    }


}
