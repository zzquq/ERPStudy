package com.syuct.model;


import java.io.Serializable;
import java.time.LocalDateTime;

public class CaptchaModel implements Serializable {

    private String code;
    private LocalDateTime expireTime;

    public CaptchaModel(String code, int expireAfterSeconds){
        this.code = code;
        this.expireTime = LocalDateTime.now().plusSeconds(expireAfterSeconds);
    }

    public String getCode() {
        return code;
    }

    /**
     * 验证码是否失效
     * @return
     */
    public boolean isExpired(){
        return  LocalDateTime.now().isAfter(expireTime);
    }
}