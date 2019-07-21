package cn.chen.controller;

import cn.chen.data.exceptions.NoSuchDataException;
import cn.chen.model.User;
import cn.chen.service.AnswerDaoService;
import cn.chen.service.FileDaoService;
import cn.chen.service.QuestionService;
import cn.chen.utils.Utils;
import com.mysql.jdbc.StringUtils;
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
    public String column(@RequestParam(required = false) Integer order, Model model,
                         @RequestParam(required = false) String name1, @RequestParam(required = false) String name2,
                         @RequestParam(required = false) String searchContent) {
        if (!StringUtils.isNullOrEmpty(name1)) {
            return name1Column(order, model, name1, name2, searchContent);
        }
        if (!StringUtils.isNullOrEmpty(searchContent)) {
            if (null != order && order == 1) {
                model.addAttribute("questions", questionService.getQuestionsByKeywords(searchContent, 1));
            } else {
                model.addAttribute("questions", questionService.getQuestionsByKeywords(searchContent, 2));
            }
        } else {
            if (null != order && order == 1) {
                model.addAttribute("questions", questionService.getQuestions());
            } else {
                model.addAttribute("questions", questionService.getQuestionsOrderByStarAndComment());
            }
        }
        model.addAttribute("hello", "");
        model.addAttribute("columnName", "所有");
        model.addAttribute("columnDetail", Utils.getString("所有"));
        return "column";
    }
    @RequestMapping("/files")
    public String files(@RequestParam(required = false) Integer order, Model model,
                         @RequestParam(required = false) String name1, @RequestParam(required = false) String name2) {
        if (!StringUtils.isNullOrEmpty(name1)) {
            String columnDetail = Utils.getString(name1);
            if (columnDetail == null) {
                throw new NoSuchDataException();
            }
            model.addAttribute("columnName", name1);
            model.addAttribute("columnDetail", columnDetail);
        }
        model.addAttribute("files", fileDaoService.getFiles());
        model.addAttribute("hello", "");
        return "files";
    }

    @RequestMapping(value = {"", "/index"})
    public String questions(Model model) {
        model.addAttribute("questions", questionService.getQuestions());
        model.addAttribute("hello", "");
        return "index";
    }

    private String name1Column(Integer order, Model model, String name1, String name2, String searchContent) {
        String columnDetail = Utils.getString(name1);
        if (!StringUtils.isNullOrEmpty(name2)) {
            return name2Column(order, model, name1, name2, searchContent);
        }
        if (!StringUtils.isNullOrEmpty(searchContent)) {
            if (null != order && order == 1) {
                model.addAttribute("questions", questionService.getQuestionsByKeywordsAndName1(searchContent, name1, 1));
            } else {
                model.addAttribute("questions", questionService.getQuestionsByKeywordsAndName1(searchContent, name1, 2));
            }
        } else {
            if (null != order && order == 1) {
                model.addAttribute("questions", questionService.getQuestionsByName1(name1, 1));
            } else {
                model.addAttribute("questions", questionService.getQuestionsByName1(name1, 2));
            }
        }
        model.addAttribute("columnName", name1);
        model.addAttribute("columnDetail", columnDetail);
        model.addAttribute("hello", "");
        return "column";
    }
    private String name2Column(Integer order, Model model, String name1, String name2, String searchContent) {
        String columnDetail = Utils.getString(name1);
        if (!StringUtils.isNullOrEmpty(searchContent)) {
            return searchColumn(order, model, name1, name2, searchContent);
        }
        if (null != order && order == 1) {
            model.addAttribute("questions", questionService.getQuestionsByName1AndName2(name1, name2, 1));
        } else {
            model.addAttribute("questions", questionService.getQuestionsByName1AndName2(name1, name2, 2));
        }
        model.addAttribute("columnName", name1);
        model.addAttribute("columnDetail", columnDetail);
        model.addAttribute("hello", "");
        return "column";
    }
    private String searchColumn(Integer order, Model model, String name1, String name2, String searchContent) {
        if (null != order && order == 1) {
            model.addAttribute("questions", questionService.getQuestionsByKeywordsAndName1AndName2(searchContent, name1, name2, 1));
        } else {
            model.addAttribute("questions", questionService.getQuestionsByKeywordsAndName1AndName2(searchContent, name1, name2, 2));
        }
        String columnDetail = Utils.getString(name1);
        model.addAttribute("columnName", name1);
        model.addAttribute("columnDetail", columnDetail);
        model.addAttribute("hello", "");
        return "column";
    }

}
