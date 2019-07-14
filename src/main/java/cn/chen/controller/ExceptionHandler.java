package cn.chen.controller;

import cn.chen.data.exceptions.NoSuchDataException;
import cn.chen.data.exceptions.YunyiException;
import cn.chen.data.result.AbstractResult;
import cn.chen.data.result.MsgResult;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.mail.MailException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ResponseBody;

@ControllerAdvice
public class ExceptionHandler {
    @org.springframework.web.bind.annotation.ExceptionHandler(value = {YunyiException.class, MailException.class, DataAccessException.class})
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
    public String handleException() {
        return "404";
    }
}
