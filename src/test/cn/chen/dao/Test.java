package cn.chen.dao;

import cn.chen.config.QiNiuConfig;
import cn.chen.config.RootConfig;
import cn.chen.dao.mysql.UserDao;
import cn.chen.model.Question;
import cn.chen.model.User;
import cn.chen.service.QuestionService;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.regex.Pattern;

public class Test {
    @org.junit.Test
    public void test() {
        AnnotationConfigApplicationContext annotationConfigApplicationContext = new AnnotationConfigApplicationContext(RootConfig.class);
        UserDao userDao = annotationConfigApplicationContext.getBean(UserDao.class);
        System.out.println(userDao.getUserById(1));
    }
    @org.junit.Test
    public void sendMail() {
        AnnotationConfigApplicationContext annotationConfigApplicationContext = new AnnotationConfigApplicationContext(RootConfig.class);
        MailSender mailSender = annotationConfigApplicationContext.getBean(MailSender.class);
        SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
        simpleMailMessage.setTo("chen1769178812@gmail.com");
        simpleMailMessage.setFrom("15597397967@163.com");
        simpleMailMessage.setText("你好123");
        simpleMailMessage.setSubject("验证码");
        //simpleMailMessage.setFrom("云易问答平台");
        mailSender.send(simpleMailMessage);
    }
    @org.junit.Test
    public void test2() {
        System.out.println("计算机163".length());
        //System.out.println(Pattern.matches("[a-zA-Z_0-9]{2,}@(([a-zA-z0-9]-*){1,}\\.){1,3}[a-zA-z\\-]{1,}", "1769178812@qq.com"));
    }
    @org.junit.Test
    public void test3() {
        try {
        HttpURLConnection connection = (HttpURLConnection) new URL(QiNiuConfig.BUCKET_URL + "file").openConnection();

            System.out.println(connection.getResponseCode());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
