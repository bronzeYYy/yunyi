package cn.chen.utils;

import cn.chen.config.QiNiuConfig;
import cn.chen.data.exceptions.IllegalParamException;
import cn.chen.data.exceptions.YunyiException;
import cn.chen.data.result.AbstractResult;
import cn.chen.data.result.MsgResult;
import com.mysql.jdbc.StringUtils;
import com.qiniu.storage.BucketManager;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;
import org.springframework.mail.MailException;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.validation.Errors;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;
import java.util.Random;
import java.util.Set;

public final class Utils {
    public static String getRandomCode() {
        Random random = new Random();
        StringBuilder stringBuilder = new StringBuilder(6);
        for (int i = 0; i < 8; i++) {
            int c = random.nextInt(25) + 65;
            stringBuilder.append((char) c);
        }
        return stringBuilder.toString();
    }
    public static void checkStringLength(String s, int min, int max) {
        if (StringUtils.isNullOrEmpty(s) || min > s.length() || max < s.length()) {
            throw new IllegalParamException("参数不合法");
        }
    }
    public static void checkStringLength(String s, int min) {
        checkStringLength(s, min, Integer.MAX_VALUE);
    }
    public static void sendEmail(MailSender mailSender, String email, String subject, String text) throws MailException {
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setText(text);
        mailMessage.setSubject(subject);
        mailMessage.setFrom("chensuwei0@163.com");
        try {
            HttpURLConnection connection = (HttpURLConnection) new URL(QiNiuConfig.BUCKET_URL + "file").openConnection();

            System.out.println(connection.getResponseCode());
        } catch (IOException e) {
            e.printStackTrace();
        }      mailMessage.setTo(email);
        mailSender.send(mailMessage);
    }
    static boolean isImgFile(MultipartFile file) {
        try {
            BufferedImage image = ImageIO.read(file.getInputStream());
            if (image == null) {
                return false;
            }
        } catch (IOException e) {
            return false;
        }
        return true;
    }
    public static void dealErrors(Errors errors) {
        throw new YunyiException(errors.getAllErrors().get(0).getDefaultMessage());
        //return new MsgResult(1, errors.getAllErrors().get(0).getDefaultMessage());
    }

    public static boolean qiniuFileExists(String url) {
        try {
            HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
            return connection.getResponseCode() == 200;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return false;
    }
    public static MultipartFile getFirstPartFile(MultipartHttpServletRequest request) {
        Map<String, MultipartFile> multipartFileMap = request.getFileMap();
        return multipartFileMap.get(multipartFileMap.keySet().iterator().next());
    }


}
