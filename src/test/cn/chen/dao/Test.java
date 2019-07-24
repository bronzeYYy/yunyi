package cn.chen.dao;

import cn.chen.config.QiNiuConfig;
import cn.chen.config.RootConfig;
import cn.chen.dao.mysql.UserDao;
import cn.chen.model.Comment;
import cn.chen.model.File;
import cn.chen.model.User;
import cn.chen.service.CommentDaoService;
import cn.chen.service.UserDaoService;
import cn.chen.utils.Utils;
import com.google.gson.JsonParser;
import com.qiniu.util.Md5;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Properties;

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
        String jsonString = "{\"key\":\"avatar_15_4\",\"hash\":\"FmO43v0Ylb6z2Fo3r5_lo5WF2-YY\",\"md5\":\"null\",\"size\":5218}";
        JsonParser jsonParser = new JsonParser();
        System.out.println(jsonParser.parse(jsonString).getAsJsonObject().get("size"));
        //System.out.println("计算机163".length());
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

    @org.junit.Test
    public void test4() {
        AnnotationConfigApplicationContext annotationConfigApplicationContext = new AnnotationConfigApplicationContext(RootConfig.class);
        CommentDaoService commentDaoService = annotationConfigApplicationContext.getBean(CommentDaoService.class);
        Comment comment = new Comment();
        File file = new File();
        file.setMd5("017637700a0049901d6e4f07d21c8faa");
        comment.setFile(file);
        User user = new User();
        user.setId(1);
        comment.setCommentUser(user);
        comment.setCommentContent("ok");
        List<Comment> comments = commentDaoService.getCommentsByFileMD5("017637700a0049901d6e4f07d21c8faa");
        System.out.println();
        /*Properties properties = new Properties();
        try {
            properties.load(new InputStreamReader(new ClassPathResource("detail.properties").getInputStream(), "gbk"));
            System.out.println(properties.getProperty("计算机系"));
        } catch (IOException e) {
            e.printStackTrace();
        }*/

    }

    @org.junit.Test
    public void test5() {
        /*AnnotationConfigApplicationContext annotationConfigApplicationContext = new AnnotationConfigApplicationContext(RootConfig.class);
        UserDaoService userDaoService = annotationConfigApplicationContext.getBean(UserDaoService.class);
        System.out.println(userDaoService.deleteAnswer(18, 15));*/
        System.out.println(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss").format(LocalDateTime.now()));
    }

    @org.junit.Test
    public void test6() {
        AnnotationConfigApplicationContext annotationConfigApplicationContext = new AnnotationConfigApplicationContext(RootConfig.class);
        JedisPool jedisPool = annotationConfigApplicationContext.getBean(JedisPool.class);
        Jedis jedis = jedisPool.getResource();
        //jedis.set("1:计算机专业".getBytes(), "1".getBytes());
        //jedis.zadd("z", 1, "1:计算机专业");
        //jedis.zadd("z", 2, "1:农牧");
       /* System.out.println(jedis.zincrby("z", 2, "1:计算机专业"));
        System.out.println(jedis.zrevrange("z", 0, 2));*/
        System.out.println(jedis.zrange("23", 0, 2));
//        System.out.println(jedis.zscore("1", "1"));
//        System.out.println(jedis.zrange("z", 0, 2));
        //System.out.println(new String(jedis.get("1:计算机专业".getBytes())));
        jedis.close();
    }
}
