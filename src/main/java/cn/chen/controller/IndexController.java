package cn.chen.controller;

import cn.chen.data.enums.CommitTypeEnum;
import cn.chen.data.exceptions.FrequencyException;
import cn.chen.data.result.AbstractResult;
import cn.chen.data.result.MsgResult;
import cn.chen.model.User;
import cn.chen.service.AnswerDaoService;
import cn.chen.service.QuestionService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

@Controller
public class IndexController {
    private QuestionService questionService;
    private AnswerDaoService answerDaoService;
    public IndexController(QuestionService questionService, AnswerDaoService answerDaoService) {
        this.questionService = questionService;
        this.answerDaoService = answerDaoService;
    }
    @RequestMapping("/user")
    public String user(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        model.addAttribute("hello", "");
        model.addAttribute("answers", answerDaoService.getUserAnswersByUserId(user.getId()));
        model.addAttribute("questions", questionService.getUserQuestionsByUserId(user.getId()));
        return "personal";
    }
    @RequestMapping("/test")
    public String testException() {
        //throw new FrequencyException(CommitTypeEnum.SEND_RANDOM_CODE);
        //return null;
        return "test";
    }
    @RequestMapping("/column")
    public String column(Model model) {
        model.addAttribute("questions", questionService.getQuestions());
        model.addAttribute("hello", "");
        return "column";
    }
    @RequestMapping(value = {"", "/index"})
    public String questions(Model model) {
        model.addAttribute("questions", questionService.getQuestions());
        model.addAttribute("hello", "");
        return "index";
    }
}
