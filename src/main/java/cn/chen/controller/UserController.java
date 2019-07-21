package cn.chen.controller;

import cn.chen.config.QiNiuConfig;
import cn.chen.dao.JedisDao;
import cn.chen.data.result.AbstractResult;
import cn.chen.data.result.MsgResult;
import cn.chen.model.User;
import cn.chen.service.UserDaoService;
import cn.chen.utils.QiniuUtils;
import cn.chen.utils.Utils;
import com.mysql.jdbc.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.IOException;
import java.util.regex.Pattern;


@RestController
@RequestMapping(value = "/user", method = RequestMethod.POST)
public class UserController {
    private JedisDao jedisDao;
    private MailSender mailSender;
    private UserDaoService userDaoService;
    @Autowired
    public UserController(JedisDao jedisDao, MailSender mailSender, UserDaoService userDaoService) {
        this.jedisDao = jedisDao;
        this.mailSender = mailSender;
        this.userDaoService = userDaoService;
    }

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

    @RequestMapping("/register")
    public AbstractResult register(@Valid User user, Errors errors, HttpServletRequest request) {
        String code = request.getParameter("code");
        if (StringUtils.isNullOrEmpty(code)) {
            return new MsgResult(-1, "请填写验证码");
        }
        if (errors.hasErrors()) {
            Utils.dealErrors(errors);
        }
        if (!jedisDao.checkRandomCode(user.getEmail(), code)) {
            return new MsgResult(-1, "验证码不正确");
        }
        MsgResult msgResult = new MsgResult();
        if (userDaoService.addUser(user)) {
            msgResult.setMsg("注册成功");
            msgResult.setCode(0);
            jedisDao.delCode(user.getEmail());
        } else {
            msgResult.setMsg("注册失败");
            msgResult.setCode(-1);
        }
        return msgResult;
    }

    @RequestMapping("/register/send")
    public AbstractResult send(String email) {
        if (StringUtils.isNullOrEmpty(email) || !Pattern.matches("[a-zA-Z_0-9]{2,}@(([a-zA-z0-9]-*)+\\.){1,3}[a-zA-z\\-]+", email)) {
            return new MsgResult(-1, "邮箱不正确");
        }
        jedisDao.checkEmailSendCode(email);
        /*if (!jedisDao.checkEmailSendCode(email)) {
            return new MsgResult(-1, "发送频繁");
        }*/
        if (sendEmail(email)) {
            return new MsgResult(0, "发送成功");
        }
        return new MsgResult(-1, "发送失败，请稍后再试");
    }

    @RequestMapping("/login/forget")
    public AbstractResult forget(String email, String studentNo) {
        Utils.checkStringLength(email, 8, 40);
        Utils.checkStringLength(studentNo, 5, 10);
        User user = userDaoService.getUserPassword(email, studentNo);
        if (user == null) {
            return new MsgResult(-1, "信息不匹配");
        }
        sendPassword(user);
        return new MsgResult(0, "密码已发送到邮箱");
    }

    @RequestMapping(value = "/avatar/{id}", method = RequestMethod.GET)
    public void getUserAvatar(@PathVariable int id, HttpServletRequest request, HttpServletResponse response) {
        String avatarUrl = QiNiuConfig.BUCKET_URL + QiniuUtils.AVATAR_SUFFIX + id;
//        System.out.println(avatarUrl + "_0");
        try {
            if (Utils.qiniuFileExists(avatarUrl + "_0")) {
                response.sendRedirect(avatarUrl + "_" +
                        (QiniuUtils.getUserAvatarNum(request, QiniuUtils.AVATAR_SUFFIX + id + "_") - 1));
            } else {
                response.sendRedirect(QiNiuConfig.BUCKET_URL + "avatar_default");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

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
