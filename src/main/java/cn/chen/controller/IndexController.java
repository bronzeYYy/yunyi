package cn.chen.controller;

import cn.chen.model.User;
import cn.chen.service.AnswerDaoService;
import cn.chen.service.QuestionService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.charset.StandardCharsets;

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
    /*@RequestMapping("/")
    public void testException(HttpServletRequest request) {
        //throw new FrequencyException(CommitTypeEnum.SEND_RANDOM_CODE);
        //return null;
        System.out.println("getRequestURI: " + request.getRequestURI());
        System.out.println("getServletPath: " + request.getServletPath());
    }*/
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
