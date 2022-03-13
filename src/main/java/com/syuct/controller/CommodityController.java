package com.syuct.controller;

import com.alibaba.fastjson.JSON;
import com.syuct.config.annotation.Log;
import com.syuct.model.RespBean;
import com.syuct.pojo.Category;
import com.syuct.pojo.Goods;
import com.syuct.pojo.Measure;
import com.syuct.pojo.vo.GoodsVo;
import com.syuct.pojo.vo.searchParamsVo.GoodsSearchParamsVo;
import com.syuct.service.CommodityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * @Author Zsz
 * @Date 2022/1/10 16:17
 * @Version 1.0
 **/
@Controller
@RequestMapping("/commodity")
public class CommodityController {


    @Autowired
    private CommodityService commodityService;

    @RequestMapping("/category")
    public String getCategoryPage() {
        return "/page/commodity/category/category";
    }


    @RequestMapping("/categoryInfo")
    @ResponseBody
    @Log(module = "商品管理", description = "查询商品类别信息")
    public Map<String, Object> getCategoryInfo() {
        Map<String, Object> map = commodityService.getCategoryInfo();
        return map;
    }

    @RequestMapping("/getAddCategoryPage")
    public String getAddCategoryPage() {
        return "/page/commodity/category/add";
    }

    @RequestMapping("/getCategoryIdName")
    @ResponseBody
    public Map<String, Object> getCategoryIdName(@RequestParam int page,
                                                 @RequestParam int limit,
                                                 @RequestParam(value = "name", required = false) String name) {
        if (name == null) {
            Map<String, Object> map = commodityService.getCategoryIdNameByPage(page, limit);
            return map;
        } else {
            Map<String, Object> map = commodityService.getCategoryIdNameByparams(name, page, limit);
            return map;
        }
    }

    @RequestMapping("/addCategory")
    @ResponseBody
    @Log(module = "商品类别", description = "添加商品类别信息")
    public RespBean addCategory(Category category) {
        int i = commodityService.addCategory(category);
        if (i > 0) {
            return RespBean.success("添加成功！");
        } else {
            return RespBean.err("添加失败！");
        }
    }

    @RequestMapping("/delCategoryById")
    @ResponseBody
    @Log(module = "商品类别", description = "删除商品类别信息")
    public RespBean delCategoryById(int id) {
        int i = commodityService.delCategoryById(id);
        if (i == 2) {
            return RespBean.success("删除成功！");
        } else {
            return RespBean.err("删除失败！");
        }
    }

    @RequestMapping("measure")
    public String getMeasureInfoPage() {
        return "/page/commodity/measure/table";
    }

    @RequestMapping("getAddMeasurePage")
    public String getAddMeasurePage() {
        return "/page/commodity/measure/add";
    }

    @RequestMapping("getEditMeasurePage")
    public String getEditMeasurePage(int id, Model model) {
        Measure measure = commodityService.getMeasureInfoById(id);
        model.addAttribute("measure", measure);
        return "/page/commodity/measure/edit";
    }

    @RequestMapping("/measureInfo")
    @ResponseBody
    @Log(module = "计量单位", description = "查询计量单位信息")
    public Map<String, Object> getMeasureInfo(int page, int limit) {
        Map<String, Object> map = commodityService.getMeasureInfoByPage(page, limit);
        return map;
    }

    @RequestMapping("delMeasure")
    @ResponseBody
    @Log(module = "计量单位", description = "删除计量单位信息")
    public RespBean delMeasure(int id) {
        int i = commodityService.delMeasureById(id);
        if (i > 0) {
            return RespBean.success("删除成功！");
        } else {
            return RespBean.err("删除失败");
        }
    }

    @RequestMapping("delAllMeasure")
    @ResponseBody
    @Log(module = "计量单位", description = "批量删除计量单位信息")
    public RespBean delAllMeasure(@RequestBody List<Measure> measures) {
        commodityService.delAllMeasure(measures);
        return RespBean.success("批量删除成功！");
    }

    @RequestMapping("addMeasure")
    @ResponseBody
    @Log(module = "计量单位", description = "添加计量单位信息")
    public RespBean addmeasuer(Measure measure) {
        int i = commodityService.addMeasure(measure);
        if (i > 0) {
            return RespBean.success("添加成功！");
        } else {
            return RespBean.err("添加失败");
        }
    }

    @RequestMapping("editMeasure")
    @ResponseBody
    @Log(module = "计量单位", description = "修改计量单位信息")
    public RespBean editMeasure(Measure measure) {
        int i = commodityService.editMeasure(measure);
        if (i > 0) {
            return RespBean.success("修改成功！");
        } else {
            return RespBean.err("修改失败");
        }
    }


    @RequestMapping("goods")
    public String getGoodsInfoPage() {
        return "/page/commodity/goods/table";
    }


    @RequestMapping("/goodsInfo")
    @ResponseBody
    @Log(module = "商品信息", description = "查询商品信息")
    public Map<String, Object> getGoodsInfo(int page, int limit, @RequestParam(value = "searchParams", required = false) String searchParams) {
        GoodsSearchParamsVo goodsSearchParamsVo = JSON.parseObject(searchParams, GoodsSearchParamsVo.class);
        if (goodsSearchParamsVo == null) {
            Map<String, Object> map = commodityService.getGoodInfoBypage(page, limit);
            return map;
        } else {
            Map<String, Object> map = commodityService.getGoodInfoByParams(goodsSearchParamsVo, page, limit);
            return map;
        }
    }

    @RequestMapping("getAddGoodsPage")
    public String getAddGoodsPage() {
        return "/page/commodity/goods/add";
    }

    @RequestMapping("getSupplierIdName")
    @ResponseBody
    public Map<String, Object> getSupplierIdName(@RequestParam int page,
                                                 @RequestParam int limit,
                                                 @RequestParam(value = "name", required = false) String name) {
        if (name == null) {
            Map<String, Object> map = commodityService.getSupplierIdNameByPage(page, limit);
            return map;
        } else {
            Map<String, Object> map = commodityService.getSupplierIdNameByParam(page, limit, name);
            return map;
        }
    }

    @RequestMapping("addGoods")
    @ResponseBody
    @Log(module = "商品信息", description = "添加商品信息")
    public RespBean addGoods(GoodsVo goodsVo) {
        int i = commodityService.addGoods(goodsVo);
        if (i > 0) {
            return RespBean.success("添加成功！");
        } else {
            return RespBean.err("添加失败！");
        }
    }

    @RequestMapping("getEditGoodsPage")
    public String getEditGoodsPage(Model model, int id) {
        GoodsVo goodsVo = commodityService.getGoogsInfoById(id);
        model.addAttribute("goods", goodsVo);
        return "/page/commodity/goods/edit";
    }

    @RequestMapping("editGoods")
    @ResponseBody
    @Log(module = "商品信息", description = "编辑商品信息")
    public RespBean editGoods(GoodsVo goodsVo) {
        int i = commodityService.updGoodsInfoById(goodsVo);
        if (i > 0) {
            return RespBean.success("修改成功！");
        } else {
            return RespBean.err("修改失败！");
        }
    }

    @RequestMapping("upGoods")
    @ResponseBody
    @Log(module = "商品信息", description = "上架商品")
    public RespBean upGoods(int id) {
        int i = commodityService.upGoodsStatusById(id);
        if (i > 0) {
            return RespBean.success("上架成功！");
        } else {
            return RespBean.err("上架失败！");
        }
    }

    @RequestMapping("downGoods")
    @ResponseBody
    @Log(module = "商品信息", description = "下架商品")
    public RespBean downGoods(int id) {
        int i = commodityService.downGoodsStatusById(id);
        if (i > 0) {
            return RespBean.success("下架成功！");
        } else {
            return RespBean.err("下架失败！");
        }
    }

    @RequestMapping("delAllGoods")
    @ResponseBody
    @Log(module = "商品信息", description = "删除商品")
    public RespBean delAllGoods(@RequestBody List<GoodsVo> goodsVos) {
        int i = commodityService.delGoodsById(goodsVos);
        if (i > 0) {
            return RespBean.success("删除成功！");
        } else {
            return RespBean.err("删除失败！");
        }

    }
}
