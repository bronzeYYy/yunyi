package cn.chen.utils;

import cn.chen.data.exceptions.IllegalParamException;
import com.mysql.jdbc.StringUtils;
import org.springframework.mail.MailException;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

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
        mailMessage.setTo(email);
        mailSender.send(mailMessage);
    }
    public static boolean isImgFile(MultipartFile file) {
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
}
