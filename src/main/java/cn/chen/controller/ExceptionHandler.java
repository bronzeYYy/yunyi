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

@ControllerAdvice
public class ExceptionHandler {
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

    @org.springframework.web.bind.annotation.ExceptionHandler(FileMd5ExistsException.class)
    @ResponseBody
    public DataResult fileExists(FileMd5ExistsException e) {
        return new DataResult<>(-2, e.getFile(), e.getMessage());
    }

    @org.springframework.web.bind.annotation.ExceptionHandler(NeedLoginAndRedirectException.class)
    public Object delNeedLogin(HttpServletRequest request) {
        return toLogin(request);
    }

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
