package cn.chen.controller;

import cn.chen.config.QiNiuConfig;
import cn.chen.dao.JedisDao;
import cn.chen.data.result.AbstractResult;
import cn.chen.data.result.MsgResult;
import cn.chen.data.result.UploadResult;
import cn.chen.model.User;
import cn.chen.service.UserDaoService;
import cn.chen.utils.QiniuUtils;
import cn.chen.utils.Utils;
import com.mysql.jdbc.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Map;
import java.util.regex.Pattern;

// 与用户相关的操作
@RestController
@RequestMapping(value = "/user", method = RequestMethod.POST)
public class UserController {
    private JedisDao jedisDao;
    private MailSender mailSender;
    private UserDaoService userDaoService;

    private StandardServletMultipartResolver multipartHttpServletRequest;
    @Autowired
    public UserController(JedisDao jedisDao, MailSender mailSender, UserDaoService userDaoService,
                          StandardServletMultipartResolver multipartHttpServletRequest) {
        this.jedisDao = jedisDao;
        this.mailSender = mailSender;
        this.userDaoService = userDaoService;
        this.multipartHttpServletRequest = multipartHttpServletRequest;
    }

    // 删除问题
    @RequestMapping("/delete/question")
    public AbstractResult deleteQuestion(int questionId, HttpSession session) {
        User user = (User) session.getAttribute("user");
        AbstractResult abstractResult =
                Utils.deleteResult(userDaoService.deleteQuestion(questionId, user.getId()));
        if (abstractResult.getCode() == 0) {
            user = userDaoService.getUserById(user.getId());
            session.setAttribute("user", user);
        }
        return abstractResult;
    }

    // 删除回答
    @RequestMapping("/delete/answer")
    public AbstractResult deleteAnswer(int answerId, HttpSession session) {
        User user = (User) session.getAttribute("user");
        AbstractResult abstractResult =
                Utils.deleteResult(userDaoService.deleteAnswer(answerId, ((User) session.getAttribute("user")).getId()));
        if (abstractResult.getCode() == 0) {
            user.setAnswerNumber(user.getAnswerNumber() - 1);
            session.setAttribute("user", user);
        }
        return abstractResult;
    }

    // 删除上传的文件
    @RequestMapping("/delete/file")
    public AbstractResult deleteFile(String fileMd5, HttpSession session) {
        User user = (User) session.getAttribute("user");
        AbstractResult abstractResult =
                Utils.deleteResult(userDaoService.deleteFile(fileMd5, ((User) session.getAttribute("user")).getId()));
        if (abstractResult.getCode() == 0) {
            user.setUploadNumber(user.getUploadNumber() - 1);
            session.setAttribute("user", user);
        }
        return abstractResult;
    }

    // 登陆
    @RequestMapping("/login")
    public AbstractResult login(String noOrEmail, String password, HttpSession session) {
        Utils.checkStringLength(noOrEmail, 5, 40);
        Utils.checkStringLength(password, 5, 15);
        User user = userDaoService.login(noOrEmail, password);
        if (user == null) {
            return new MsgResult(-1, "信息不匹配");
        }
        session.setAttribute("user", user);
        return new MsgResult(0, "登陆成功");
    }

    @RequestMapping(value = "/loginout", method = RequestMethod.GET)
    public void loginout(HttpSession session, HttpServletResponse response) {
        session.invalidate();
        try {
            response.sendRedirect("../index");
            // 退出登陆后跳转到首页
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/register")
    public AbstractResult register(@Valid User user, Errors errors, HttpServletRequest request) {
        String code = request.getParameter("code");
        if (StringUtils.isNullOrEmpty(code)) {
            return new MsgResult(-1, "请填写验证码");
        }
        if (errors.hasErrors()) {
            Utils.dealErrors(errors);
            // 处理错误，其中抛出异常
        }
        if (!jedisDao.checkRandomCode(user.getEmail(), code)) {
            return new MsgResult(-1, "验证码不正确");
        }
        MsgResult msgResult = new MsgResult();
        if (userDaoService.addUser(user)) {
            msgResult.setMsg("注册成功");
            msgResult.setCode(0);
            login(user.getEmail(), user.getUserPassword(), request.getSession());
            // 注册成功后登陆
            jedisDao.delCode(user.getEmail());
            // 删除验证码
        } else {
            msgResult.setMsg("注册失败");
            msgResult.setCode(-1);
        }
        return msgResult;
    }

    // 发送验证码
    @RequestMapping("/register/send")
    public AbstractResult send(String email) {
        if (StringUtils.isNullOrEmpty(email) || !Pattern.matches("[a-zA-Z_0-9]{2,}@(([a-zA-z0-9]-*)+\\.){1,3}[a-zA-z\\-]+", email)) {
            return new MsgResult(-1, "邮箱不正确");
        }
        jedisDao.checkEmailSendCode(email);
        // 检测是否发送频繁
        /*if (!jedisDao.checkEmailSendCode(email)) {
            return new MsgResult(-1, "发送频繁");
        }*/
        if (sendEmail(email)) {
            return new MsgResult(0, "发送成功");
        }
        return new MsgResult(-1, "发送失败，请稍后再试");
    }

    @RequestMapping("/login/forget") // 忘记密码
    public AbstractResult forget(String email, String studentNo) {
        Utils.checkStringLength(email, 8, 40);
        Utils.checkStringLength(studentNo, 5, 10);
        // 检查信息规范
        User user = userDaoService.getUserPassword(email, studentNo);
        if (user == null) {
            return new MsgResult(-1, "信息不匹配");
        }
        sendPassword(user); // 发送验证码到邮箱
        return new MsgResult(0, "密码已发送到邮箱");
    }

    // 根据用户id获取用户的头像
    @RequestMapping(value = "/avatar/{id}", method = RequestMethod.GET)
    public void getUserAvatar(@PathVariable int id, HttpServletRequest request, HttpServletResponse response) {
        String avatarUrl = QiNiuConfig.BUCKET_URL + QiniuUtils.AVATAR_SUFFIX + id;
        // 构造用户头像的地址
//        System.out.println(avatarUrl + "_0");
        try {
            if (Utils.qiniuFileExists(avatarUrl + "_0")) { // 上传过头像
                response.sendRedirect(avatarUrl + "_" +
                        (QiniuUtils.getUserAvatarNum(request, QiniuUtils.AVATAR_SUFFIX + id + "_") - 1));
                // 到最新的头像的地址
            } else {
                response.sendRedirect(QiNiuConfig.BUCKET_URL + "avatar_default");
                // 使用默认头像
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    // 编辑框中的图片的上传
    @RequestMapping("/upload")
    public UploadResult uploadImg(HttpServletRequest request, HttpSession session) {
        // 等待确认返回信息
        if (!multipartHttpServletRequest.isMultipart(request)) {
            return new UploadResult();
        }
        User user = (User) session.getAttribute("user");
        String dateTime = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss").format(LocalDateTime.now());
        String fileName = user.getId() + "_" + dateTime;
        UploadResult uploadResult = new UploadResult();
        Map<String, MultipartFile> multipartFileMap = multipartHttpServletRequest.resolveMultipart(request).getFileMap();
        String name = multipartFileMap.keySet().iterator().next();
        String n = multipartFileMap.get(name).getOriginalFilename();
        try {
            fileName += n.substring(n.lastIndexOf('.'));
        } catch (IndexOutOfBoundsException e) {
            e.printStackTrace();
            return new UploadResult();
        }

        if (QiniuUtils.uploadImg(request, fileName).getCode() == 0) {
            uploadResult.add(QiNiuConfig.BUCKET_URL + fileName);
        }
        return uploadResult;

    }

    private boolean sendEmail(String email) {
        String code = Utils.getRandomCode();
        String text = "你正在注册云易校园问答平台，验证码为" + code + "。若非本人操作请忽略。";
        String subject = "云易校园问答平台注册验证码";
        Utils.sendEmail(mailSender, email, subject, text);
        return jedisDao.setRandomCode(email, code);
    }
    private void sendPassword(User user) {
        String text = "你的云易校园问答平台的密码是: " + user.getUserPassword();
        String subject = "云易校园问答平台";
        Utils.sendEmail(mailSender, user.getEmail(), subject, text);
    }
}
