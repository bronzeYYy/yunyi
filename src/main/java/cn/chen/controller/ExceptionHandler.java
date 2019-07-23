package cn.chen.controller;

import cn.chen.data.exceptions.FileMd5ExistsException;
import cn.chen.data.exceptions.NoSuchDataException;
import cn.chen.data.exceptions.YunyiException;
import cn.chen.data.exceptions.login.NeedLoginAndRedirectException;
import cn.chen.data.exceptions.login.NeedLoginNotRedirectException;
import cn.chen.data.result.AbstractResult;
import cn.chen.data.result.DataResult;
import cn.chen.data.result.MsgResult;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.mail.MailException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

// 用来处理所有抛出的异常的类
@ControllerAdvice
public class ExceptionHandler {

    // 处理所有YunyiException和MailException及执行sql时抛出的异常
    @org.springframework.web.bind.annotation.ExceptionHandler(value = {YunyiException.class, MailException.class,
            DataAccessException.class})
    @ResponseBody
    public AbstractResult handleException(Exception e) {
        String msg = e.getMessage();
        if (e instanceof DuplicateKeyException) {
            msg = "邮箱已被注册";
        }
        return new MsgResult(-1, msg);
//        return new MsgResult(-1, e.getClass().getName());
    }

    // 处理NoSuchDataException，跳转到404页面，如用户不存在，问题不存在等等
    @org.springframework.web.bind.annotation.ExceptionHandler(NoSuchDataException.class)
    public String handleException(HttpServletRequest request) {
        /*try {
            response.sendError(404);
            //response.sendRedirect("404.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }*/

        return "redirect:"+ getHome(request) + "404.jsp";
    }

    // 处理文件已存在的异常，将文件信息返回给前端
    @org.springframework.web.bind.annotation.ExceptionHandler(FileMd5ExistsException.class)
    @ResponseBody
    public DataResult fileExists(FileMd5ExistsException e) {
        return new DataResult<>(-2, e.getFile(), e.getMessage());
    }

    // 处理需要登陆并且自动跳转的异常，这个异常基本在过滤器中
    @org.springframework.web.bind.annotation.ExceptionHandler(NeedLoginAndRedirectException.class)
    public Object delNeedLogin(HttpServletRequest request) {
        return toLogin(request);
    }

    // 处理需要登陆并且不用跳转的异常，返回信息给前端
    @org.springframework.web.bind.annotation.ExceptionHandler(NeedLoginNotRedirectException.class)
    @ResponseBody
    public Object delNeedLogin(Exception e) {
        return handleException(e);
    }

    private String toLogin(HttpServletRequest request) {
        return "redirect:"+ getHome(request) + "login.jsp";
        /*StringBuilder url = new StringBuilder();
        String path = request.getServletPath();
        int j = 0;
        for (int i = 0; i < path.length(); i++) {
            if (path.charAt(i) == '/') {
                j++;
            }
        }
        for (int k = 1; k < j; k++) {
            url.append("../");
        }
        //String url = request.getScheme() + "://" + request.getServletPath() + ":" + request.getServerPort() + "/";
        //System.out.println(url);
        return "redirect:"+ url + "login.jsp";*/
    }

    private String getHome(HttpServletRequest request) {
        StringBuilder url = new StringBuilder();
        String path = request.getServletPath();
        int j = 0;
        for (int i = 0; i < path.length(); i++) {
            if (path.charAt(i) == '/') {
                j++;
            }
        }
        for (int k = 1; k < j; k++) {
            url.append("../");
        }
        return url.toString();
    }
}
