package com.syuct.config.web;


import com.syuct.config.interceptor.LoginInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.config.annotation.*;

@Component
public class WebConfig implements WebMvcConfigurer {


    @Autowired
    private LoginInterceptor loginInterceptor;

    /**
     * 添加静态资源文件，外部可以直接访问地址
     * @param registry
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/static/**")
                .addResourceLocations("classpath:/static/");
//                .addResourceLocations("classpath:/templates/**");
        //此处还可继续增加目录。。。。
    }


    //拦截器示例
    @Override
    public void addInterceptors(InterceptorRegistry registry) {

//        registry.addInterceptor(loginInterceptor);
    }


    //    配置页面跳转
    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/index").setViewName("index");
        registry.addViewController("/login").setViewName("login");
    }

//    //    跨域
//    @Override
//    public void addCorsMappings(CorsRegistry registry) {
//        registry.addMapping("/cors")
//                .allowedOrigins("*")
//                .allowedMethods("GET", "POST")
//                .allowedHeaders("*");
//    }



}