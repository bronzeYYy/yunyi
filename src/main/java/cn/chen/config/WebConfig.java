package cn.chen.config;

import cn.chen.interceptor.NeedLoginMsgInterceptor;
import cn.chen.interceptor.QuestionInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@ComponentScan("cn.chen.controller")
@EnableWebMvc
public class WebConfig extends WebMvcConfigurerAdapter {
    @Bean
    public ViewResolver viewResolver() {
        InternalResourceViewResolver resourceViewResolver = new InternalResourceViewResolver();
        resourceViewResolver.setPrefix("/WEB-INF/views/");
        resourceViewResolver.setSuffix(".jsp");
        return resourceViewResolver;
    }

    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
        super.configureDefaultServletHandling(configurer);
        configurer.enable();
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        super.addInterceptors(registry);
        registry.addInterceptor(new QuestionInterceptor()) // 需要登陆并自动跳转
                .addPathPatterns("/user/update", "/user");
        registry.addInterceptor(new NeedLoginMsgInterceptor())
                .addPathPatterns("/answer/save", "/answer/star",
                        "/question/star", "/file/upload",
                        "/question/save", "/user/update/avatar",
                        "/file/save", "/user/delete/*", "/user/upload");
        // 注册拦截器
    }
}
