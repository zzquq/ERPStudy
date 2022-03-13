package com.syuct.controller;


import com.syuct.model.CaptchaModel;
import com.syuct.service.MainService;
import com.syuct.service.SysMenuService;
import com.syuct.utils.VerifyCodeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Map;

/**
 * 系统Controller
 */
@Controller
public class MainController {

    @Autowired
    private VerifyCodeUtil verifyCodeUtil;

    @Resource
    private SysMenuService sysMenuService;

    @Autowired
    private MainService mainService;
    @RequestMapping("/")
    public String index() {
        return "index";
    }

    @RequestMapping("/page/welcome")
    public String getWelcome(Model model) {
        int saleCount = mainService.getSaleCount();
        int saleSumCount = mainService.getSaleSumCount();
        int saleMoney = mainService.getsaleMoneyCount();
        int saleSumMoney = mainService.getSumMoneyCount();
        int saleNumber = mainService.getSaleNumber();
        int goodsCount = mainService.getGoodsCount();
        int warning = mainService.getWarningCount();

        model.addAttribute("saleCount", saleCount);
        model.addAttribute("saleSumCount", saleSumCount);
        model.addAttribute("saleMoney", saleMoney);
        model.addAttribute("saleSumMoney", saleSumMoney);
        model.addAttribute("saleNumber", saleNumber);
        model.addAttribute("goodsCount", goodsCount);
        model.addAttribute("warning", warning);
        return "page/welcome";
    }

    @GetMapping("/sys/menu")
    @ResponseBody
    public Map<String, Object> menu() {
        return sysMenuService.menu();
    }

    @GetMapping("/undefined")
    public String undefined() {
        return "index";
    }


    @RequestMapping("/captcha")
    public void getVerifyCode(HttpServletResponse response, HttpSession session) throws IOException {
        /**
         *   0）想办法禁用缓存. 1）先使用VerifyCodeUtil工具类生成随机的4位数字. 2）将生成的验证码放入session中. 3）根据随机4位数字生成图片流. 4）将图片流写入到输出流response.getOutputStream()
         */
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Expires", "0");
        /*
        * Parameters:
        type 验证码类型,参见本类的静态属性
        length 验证码长度,要求大于0的整数
        excludeString 需排除的特殊字符（无需排除则为null）
        */
        String verifyCode = VerifyCodeUtil.generateTextCode(VerifyCodeUtil.TYPE_NUM_ONLY, 4, null);

        session.setAttribute("verifyCode", new CaptchaModel(verifyCode, 2 * 60));
        /*
        * textCode 文本验证码
        width 图片宽度(注意此宽度若过小,容易造成验证码文本显示不全,如4个字符的文本可使用85到90的宽度)
        height 图片高度
        interLine 图片中干扰线的条数
        randomLocation 每个字符的高低位置是否随机
        backColor 图片颜色,若为null则表示采用随机颜色
        foreColor 字体颜色,若为null则表示采用随机颜色
        lineColor 干扰线颜色,若为null则表示采用随机颜色
        */
        response.setContentType("image/jpeg");
        BufferedImage bufferedImage = VerifyCodeUtil.generateImageCode(verifyCode, 90, 30, 5, true, Color.WHITE, Color.BLACK, null);

        ImageIO.write(bufferedImage, "JPEG", response.getOutputStream());
    }
}

