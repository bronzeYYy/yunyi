package cn.chen.utils;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.http.HttpServletRequest;

public final class BeanUtils {
    public static <T> T getBean(HttpServletRequest request, Class<T> tClass) {
        WebApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(request.getServletContext());
        return applicationContext.getBean(tClass);
    }
}
