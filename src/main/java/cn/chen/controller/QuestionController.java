package cn.chen.controller;

import cn.chen.config.QiNiuConfig;
import cn.chen.data.exceptions.NoSuchDataException;
import cn.chen.data.result.AbstractResult;
import cn.chen.data.result.MsgResult;
import cn.chen.model.Answer;
import cn.chen.model.Question;
import cn.chen.model.User;
import cn.chen.service.AnswerDaoService;
import cn.chen.service.QuestionService;
import cn.chen.service.UserDaoService;
import cn.chen.utils.QiniuUtils;
import cn.chen.utils.Utils;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/question")
public class QuestionController {
    private UploadManager uploadManager;
    private Auth auth;
    private StandardServletMultipartResolver servletMultipartResolver;
    private QuestionService questionService;
    private AnswerDaoService answerDaoService;
    private UserDaoService userDaoService;
    @Autowired
    public QuestionController(UploadManager uploadManager, Auth auth, StandardServletMultipartResolver multipartResolver,
                              QuestionService questionService, AnswerDaoService answerDaoService, UserDaoService userDaoService) {
        this.uploadManager = uploadManager;
        this.auth = auth;
        this.servletMultipartResolver = multipartResolver;
        this.questionService = questionService;
        this.answerDaoService = answerDaoService;
        this.userDaoService = userDaoService;
    }

    @RequestMapping("/detail/{id}")
    public String questionDetail(@PathVariable int id, Model model, @RequestParam(required = false) String answerOrderType) {
        Question question = questionService.getQuestionById(id);
        if (question == null) {
            throw new NoSuchDataException();
        }
        model.addAttribute("Question", question);
        model.addAttribute("hello", "../../");
        List<Answer> answers;
        if (answerOrderType != null) {
            answers = answerDaoService.getAnswersByQuestionIdOrderByStar(id);
        } else {
            answers = answerDaoService.getAnswersByQuestionId(id);
        }
        model.addAttribute("comment", answers);
        return "question";
    }

    @RequestMapping("/upload")
    @ResponseBody
    public AbstractResult uploadImg(HttpServletRequest request) {
        // 等待确认返回信息
        return QiniuUtils.uploadImg(request, "");

    }
    @RequestMapping("/star")
    @ResponseBody
    public AbstractResult star(int questionId, HttpSession session) {
        MsgResult msgResult = new MsgResult();
        if (questionService.starQuestion(questionId, ((User) session.getAttribute("user")).getId())) {
            msgResult.setCode(0);
            msgResult.setMsg("ok");
        } else {
            msgResult.setCode(-1);
            msgResult.setMsg("点赞失败");
        }
        return msgResult;

    }

    @RequestMapping("/save")
    @ResponseBody
    public AbstractResult save(@Valid Question question, Errors errors, HttpSession session) {
        if (errors.hasErrors()) {
            Utils.dealErrors(errors);
        }
        User user = (User) session.getAttribute("user");
        question.setQuestioner(user);
        MsgResult msgResult = new MsgResult();
        if (questionService.save(question)) { // save方法抛出的异常传到此处之后ExceptionHandler进行处理
            msgResult.setCode(0);
            msgResult.setMsg("提问成功");
            session.setAttribute("user", userDaoService.getUserById(user.getId()));
        } else {
            msgResult.setCode(0);
            msgResult.setMsg("提问失败，请重试");
        }
        return msgResult;
    }
    private String getToken() {
        return auth.uploadToken(QiNiuConfig.BUCKET);
    }
    /*private String getFileName(int type, MultipartFile file) {
        if (type == 0) {
            return LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd_HH-mm-ss_")) + file.getOriginalFilename();
        }
        return file.getOriginalFilename();
    }*/
}
