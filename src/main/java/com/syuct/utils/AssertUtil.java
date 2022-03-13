package com.syuct.utils;


import com.syuct.exceptions.ParamsException;

public class AssertUtil {
    public static void isTrue(boolean flag, String msg) {
        if (flag == true) {
            throw new ParamsException(msg);
        }
    }
}
