package com.syuct.config.annotation;

import java.lang.annotation.*;

/***
 *
 * @author 墨墨
 */
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Log {
    /**
     * 模块
     * @return
     */
    String module() default "";

    /**
     * 描述
     * @return
     */
    String description() default "";
}