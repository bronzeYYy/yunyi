package cn.chen.controller;

import cn.chen.model.User;
import cn.chen.service.AnswerDaoService;
import cn.chen.service.FileDaoService;
import cn.chen.service.QuestionService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
    private FileDaoService fileDaoService;
    public IndexController(QuestionService questionService, AnswerDaoService answerDaoService, FileDaoService fileDaoService) {
        this.questionService = questionService;
        this.answerDaoService = answerDaoService;
        this.fileDaoService = fileDaoService;
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
    public String column(@RequestParam(required = false) Integer type, @RequestParam(required = false) Integer order,  Model model) {
        if (null != type && type == 1) {
            if (null != order && order == 1) {
                model.addAttribute("questions", questionService.getQuestionsOrderByStarAndComment());
            } else {
                model.addAttribute("questions", questionService.getQuestions());
            }
        } else {
            model.addAttribute("files", fileDaoService.getFiles());
        }

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
