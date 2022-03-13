package com.syuct.utils;

import java.text.DecimalFormat;

/**
 * @Author Zsz
 * @Date 2021/11/23 16:18
 * @Version 1.0
 **/
public class FormatConversion {
    public static String doubleToString(Double d) {
        if (d != null) {
            if (d.doubleValue() != 0.00) {
                DecimalFormat df = new DecimalFormat("##0.00##");
                return df.format(d.doubleValue());
            } else {
                return "0.00";
            }
        }
        return "";
    }
}
