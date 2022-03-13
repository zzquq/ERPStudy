package com.syuct.service;


import com.syuct.pojo.Category;
import com.syuct.pojo.Goods;
import com.syuct.pojo.Measure;
import com.syuct.pojo.vo.GoodsVo;
import com.syuct.pojo.vo.searchParamsVo.GoodsSearchParamsVo;

import java.util.List;
import java.util.Map;

/**
 * @Author Zsz
 * @Date 2022/1/10 18:17
 * @Version 1.0
 **/
public interface CommodityService {

    Map<String, Object> getCategoryInfo();

    Map<String, Object> getCategoryIdNameByPage(int page, int limit);

    Map<String, Object> getCategoryIdNameByparams(String name, int page, int limit);

    int addCategory(Category category);

    int delCategoryById(int id);

    Map<String, Object> getMeasureInfoByPage(int page, int limit);

    int delMeasureById(int id);

    void delAllMeasure(List<Measure> measures);

    int addMeasure(Measure measure);

    Measure getMeasureInfoById(int id);

    int editMeasure(Measure measure);

    Map<String, Object> getGoodInfoBypage(int page, int limit);

    Map<String, Object> getGoodInfoByParams(GoodsSearchParamsVo goodsSearchParamsVo, int page, int limit);

    Map<String, Object> getSupplierIdNameByPage(int page, int limit);

    Map<String, Object> getSupplierIdNameByParam(int page, int limit, String name);

    int addGoods(GoodsVo goodsVo);

    GoodsVo getGoogsInfoById(int id);

    int updGoodsInfoById(GoodsVo goodsVo);

    int upGoodsStatusById(int id);

    int downGoodsStatusById(int id);

    int delGoodsById(List<GoodsVo> goodsVos);
}
