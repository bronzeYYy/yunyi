package cn.chen.utils;

import cn.chen.config.QiNiuConfig;
import cn.chen.data.exceptions.IllegalParamException;
import cn.chen.data.exceptions.YunyiException;
import cn.chen.data.result.AbstractResult;
import cn.chen.data.result.MsgResult;
import cn.chen.model.Question;
import com.hankcs.hanlp.HanLP;
import com.mysql.jdbc.StringUtils;
import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.MailException;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.validation.Errors;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.*;

public final class Utils {
    private static final Properties nameDetail;
    public static final Long maxFileSize = 200 * 1024 * 1024L;
    public static final String[] SIZE_UNITS = {"B", "KB", "MB"};
    static {
        nameDetail = new Properties();
        try {
            nameDetail.load(new InputStreamReader(new ClassPathResource("detail.properties").getInputStream(), "gbk"));
        } catch (IOException e) {
            e.printStackTrace();
        }
        /*map.put("", "");
        map.put("", "");
        map.put("", "");*/
    }
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
        if (multipartFileMap.size() != 1) {
            throw new YunyiException("请选择一个文件");
        }
        return multipartFileMap.get(multipartFileMap.keySet().iterator().next());
    }

    public static String getString(String name) {
        return nameDetail.getProperty(name);
    }

    public static List<String> getResultList(String searchContent) {
        return HanLP.extractKeyword(searchContent, searchContent.length());
    }
    public static String getSql(String searchContent, List<String> list) {
        StringBuilder sql = new StringBuilder();
        for (int i = 0; i < list.size(); i++) {
            String s1 = list.get(i);
            sql.append(" question_name like '%");
            sql.append(s1);
            sql.append("%' or question_content like '%");
            sql.append(s1);
            sql.append("%'");
            if (i != list.size() - 1) {
                sql.append(" or ");
            }
        }
        return sql.toString();
    }

    public static String getSql(String searchContent) {
        return getSql(searchContent, getResultList(searchContent));
    }

    public static String getOrder(int order) {
        return order == 1 ? "creation_time" : "(likenum + comment_num)";
    }

    public static void highName(List<Question> questions, List<String> results) {
        questions.forEach(e ->
            results.forEach(r -> {
                String name = e.getQuestionName();
                if (name.contains(r)) {
                    e.setQuestionName(name.replace(r, "<span style='color: #FF0000'>" + r + "</span>"));
                }
            })
        );
    }

    public static void highAll(List<Question> questions, List<String> results) {
        questions.forEach(e ->
                results.forEach(r -> {
                    String name = e.getQuestionName();
                    String content = e.getQuestionContent();
                    if (name.contains(r)) {
                        e.setQuestionName(name.replace(r, "<span style='color: #FF0000'>" + r + "</span>"));
                    }
                    if (content.contains(r)) {
                        e.setQuestionContent(content.replace(r, "<span style='color: #FF0000'>" + r + "</span>"));
                    }
                })
        );
    }

    public static int getSizeUnitType(long size) {
        if (size >= 1024 * 1024) {
            return 2;
        }
        if (size >= 1024) {
            return 1;
        }
        return 0;
    }


    public static float getSize(int type, long size) {
        if (type == 0) {
            // B
            return size;
        }
        if (type == 1) {
            // KB
            return (float) (size / 1024.0);
        }
        // MB
        return (float) (size / 1024.0 / 1024);
    }

    public static int getPageNum(int count) {
        return (count + 9) / 10 ;
    }

    public static AbstractResult deleteResult(boolean deleteResult) {
        MsgResult msgResult = new MsgResult();
        if (deleteResult) {
            msgResult.setCode(0);
            msgResult.setMsg("删除成功");
        } else {
            msgResult.setCode(-1);
            msgResult.setMsg("删除失败");
        }
        return msgResult;
    }

}
