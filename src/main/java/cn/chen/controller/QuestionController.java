package cn.chen.controller;

import cn.chen.config.QiNiuConfig;
import cn.chen.data.exceptions.NoSuchDataException;
import cn.chen.data.result.AbstractResult;
import cn.chen.data.result.MsgResult;
import cn.chen.model.Question;
import cn.chen.model.User;
import cn.chen.service.AnswerDaoService;
import cn.chen.service.QuestionService;
import cn.chen.utils.Utils;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.IOException;
import java.util.Map;
import java.util.Set;

@Controller
@RequestMapping("/question")
public class QuestionController {
    private UploadManager uploadManager;
    private Auth auth;
    private StandardServletMultipartResolver servletMultipartResolver;
    private QuestionService questionService;
    private AnswerDaoService answerDaoService;
    @Autowired
    public QuestionController(UploadManager uploadManager, Auth auth, StandardServletMultipartResolver multipartResolver,
                              QuestionService questionService, AnswerDaoService answerDaoService) {
        this.uploadManager = uploadManager;
        this.auth = auth;
        this.servletMultipartResolver = multipartResolver;
        this.questionService = questionService;
        this.answerDaoService = answerDaoService;
    }

    @RequestMapping("")
    public String questions(Model model) {
        model.addAttribute("questions", questionService.getQuestions());
        return "index";
    }

    @RequestMapping("/detail/{id}")
    public String questionDetail(@PathVariable int id, Model model) {
        Question question = questionService.getQuestionById(id);
        if (question == null) {
            throw new NoSuchDataException();
        }
        model.addAttribute("Question", question);
        model.addAttribute("comment", answerDaoService.getAnswersByQuestionId(id));
        return "index";
    }

    @RequestMapping("/upload")
    @ResponseBody
    public AbstractResult uploadImg(HttpServletRequest request) {
        // 等待确认返回信息
        if (servletMultipartResolver.isMultipart(request)) {
            MultipartHttpServletRequest multipartHttpServletRequest = servletMultipartResolver.resolveMultipart(request);
            Map<String, MultipartFile> multipartFileMap = multipartHttpServletRequest.getFileMap();
            Set<String> strings = multipartFileMap.keySet();
            for (String string : strings) {
                MultipartFile multipartFile = multipartFileMap.get(string);
                if (Utils.isImgFile(multipartFile)) {
                    try {
                        uploadManager.put(multipartFile.getBytes(), multipartFile.getName(), getToken());
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
        return new MsgResult(0, "question");
    }
    @RequestMapping("/save")
    @ResponseBody
    public AbstractResult save(@Valid Question question, Errors errors, HttpSession session) {
        if (errors.hasErrors()) {
            return Utils.dealErrors(errors);
        }
        User user = (User) session.getAttribute("user");
        question.setQuestioner(user);
        MsgResult msgResult = new MsgResult();
        if (questionService.save(question)) { // save方法抛出的异常传到此处之后ExceptionHandler进行处理
            msgResult.setCode(0);
            msgResult.setMsg("提问成功");
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
