package cn.chen.controller;

import cn.chen.data.exceptions.NoSuchDataException;
import cn.chen.model.File;
import cn.chen.model.User;
import cn.chen.service.AnswerDaoService;
import cn.chen.service.FileDaoService;
import cn.chen.service.QuestionService;
import cn.chen.service.UserDaoService;
import cn.chen.utils.Utils;
import com.mysql.jdbc.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
import java.util.List;
import java.util.Set;


// 需要数据的页面，如首页，专栏等等
@Controller
public class IndexController {
    private QuestionService questionService;
    private AnswerDaoService answerDaoService;
    private FileDaoService fileDaoService;
    private UserDaoService userDaoService;
    public IndexController(QuestionService questionService, AnswerDaoService answerDaoService, FileDaoService fileDaoService,
                           UserDaoService userDaoService) {
        this.questionService = questionService;
        this.answerDaoService = answerDaoService;
        this.fileDaoService = fileDaoService;
        this.userDaoService = userDaoService;
    }

    // 用户个人信息页面，根据session获取
    @RequestMapping("/user")
    public String user(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        model.addAttribute("hello", "");
        model.addAttribute("answers", answerDaoService.getUserAnswersByUserId(user.getId()));
        model.addAttribute("questions", questionService.getUserQuestionsByUserId(user.getId()));
        model.addAttribute("files", fileDaoService.getFilesByUserId(user.getId()));
        return "personal";
    }

    // 根据用户的id到其他用户页面
    @RequestMapping("/other/{id}")
    public String other(@PathVariable("id") int userId, Model model) {
        User user = userDaoService.getUserById(userId);
        if (user == null) {
            throw new NoSuchDataException();
        }
        model.addAttribute("hello", "../");
        model.addAttribute("user", user);
        model.addAttribute("answers", answerDaoService.getUserAnswersByUserId(userId));
        model.addAttribute("questions", questionService.getUserQuestionsByUserId(userId));
        model.addAttribute("files", fileDaoService.getFilesByUserId(userId));
        return "others";
    }
    /*@RequestMapping("/")
    public void testException(HttpServletRequest request) {
        //throw new FrequencyException(CommitTypeEnum.SEND_RANDOM_CODE);
        //return null;
        System.out.println("getRequestURI: " + request.getRequestURI());
        System.out.println("getServletPath: " + request.getServletPath());
    }*/

    // 热门页面
    @RequestMapping("/hot")
    public String hot(Model model) {
        int start = 0;
        int length = 10;
        model.addAttribute("questions", questionService.getQuestionsOrderByStarAndComment(start, length));
        model.addAttribute("hello", "");
        model.addAttribute("columnName", "热门");
        model.addAttribute("columnDetail", Utils.getString("热门"));
        return "hot";
    }

    // 推荐页面
    @RequestMapping("/recommend")
    public String recommend(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        int id = -1;
        if (user != null) {
            id = user.getId();
        }
        model.addAttribute("questions", questionService.getRecommendQuestionsByName1(id));
        model.addAttribute("hello", "");
        model.addAttribute("columnName", "推荐");
        model.addAttribute("columnDetail", Utils.getString("推荐"));
        return "hot";
    }

    // 专栏页面
    @RequestMapping("/column")
    public String column(@RequestParam(required = false) Integer order, Model model,
                         @RequestParam(required = false) String name1, @RequestParam(required = false) String name2,
                         @RequestParam(required = false) String searchContent,
                         @RequestParam(required = false) Integer page) {
        int start = 0;
        int length = 10;
        if (page != null && page > 0) {
            start = (page - 1) * 10;
            length = start + 10;
        }

        if (!StringUtils.isNullOrEmpty(name1)) {
            return name1Column(order, model, name1, name2, searchContent, start, length);
        }
        if (!StringUtils.isNullOrEmpty(searchContent)) {
            if (null != order && order == 1) {
                model.addAttribute("questions", questionService.getQuestionsByKeywords(searchContent, 1, start, length));
            } else {
                model.addAttribute("questions", questionService.getQuestionsByKeywords(searchContent, 2, start, length));
            }
            model.addAttribute("pages", Utils.getPageNum(questionService.getQuestionsByKeywordsCount(searchContent)));
        } else {
            if (null != order && order == 1) {
                model.addAttribute("questions", questionService.getQuestions(start, length));
            } else {
                model.addAttribute("questions", questionService.getQuestionsOrderByStarAndComment(start, length));
            }
            model.addAttribute("pages", Utils.getPageNum(questionService.getQuestionsCount()));
        }
        model.addAttribute("hello", "");
        model.addAttribute("columnName", "所有");
        model.addAttribute("columnDetail", Utils.getString("所有"));
        return "column";
    }

    // 文件列表页面
    @RequestMapping("/files")
    public String files(@RequestParam(required = false) Integer order, Model model,
                         @RequestParam(required = false) String name1, @RequestParam(required = false) Integer page) {
        int start = 0;
        int length = 10;
        if (page != null && page > 0) {
            start = (page - 1) * 10;
            length = start + 10;
        }
        List<File> files;
        int count;
        if (!StringUtils.isNullOrEmpty(name1)) {
            String columnDetail = Utils.getString(name1);
            if (columnDetail == null) {
                throw new NoSuchDataException();
            }
            model.addAttribute("columnName", name1);
            model.addAttribute("columnDetail", columnDetail);
            files = fileDaoService.getFilesByName1OrderBy(name1, order, start, length);
            count = fileDaoService
                    .getFilesByName1Count(name1);
        } else {
            files = fileDaoService.getFiles(start, length, order);
            count = fileDaoService.getFilesCount();
            model.addAttribute("columnName", "文件");
            model.addAttribute("columnDetail", Utils.getString("文件"));
        }
        model.addAttribute("files", files);
        model.addAttribute("hello", "");
        model.addAttribute("pages", Utils.getPageNum(count));
        return "files";
    }

    // 主页
    @RequestMapping(value = {"", "/index"})
    public String questions(Model model) {
        /*int start = 0;
        int length = 10;
        model.addAttribute("questions", questionService.getQuestions(start, length));*/
        model.addAttribute("hello", "");
        return "index";
    }

    private String name1Column(Integer order, Model model, String name1, String name2, String searchContent, int start, int length) {
        String columnDetail = Utils.getString(name1);
        if (!StringUtils.isNullOrEmpty(name2)) {
            return name2Column(order, model, name1, name2, searchContent, start, length);
        }
        if (!StringUtils.isNullOrEmpty(searchContent)) {
            if (null != order && order == 1) {
                model.addAttribute("questions", questionService.getQuestionsByKeywordsAndName1(searchContent, name1, 1,
                        start, length));
            } else {
                model.addAttribute("questions", questionService.getQuestionsByKeywordsAndName1(searchContent, name1, 2,
                        start, length));
            }
            model.addAttribute("pages", Utils.getPageNum(questionService.getQuestionsByKeywordsAndName1Count(searchContent, name1)));
        } else {
            if (null != order && order == 1) {
                model.addAttribute("questions", questionService.getQuestionsByName1(name1, 1, start, length));
            } else {
                model.addAttribute("questions", questionService.getQuestionsByName1(name1, 2, start, length));
            }
            model.addAttribute("pages", Utils.getPageNum(questionService.getQuestionsByName1Count(name1)));
        }
        model.addAttribute("columnName", name1);
        model.addAttribute("columnDetail", columnDetail);
        model.addAttribute("hello", "");
        return "column";
    }
    private String name2Column(Integer order, Model model, String name1, String name2, String searchContent, int start, int length) {
        String columnDetail = Utils.getString(name1);
        if (!StringUtils.isNullOrEmpty(searchContent)) {
            return searchColumn(order, model, name1, name2, searchContent, start, length);
        }
        if (null != order && order == 1) {
            model.addAttribute("questions", questionService.getQuestionsByName1AndName2(name1, name2, 1, start, length));
        } else {
            model.addAttribute("questions", questionService.getQuestionsByName1AndName2(name1, name2, 2, start, length));
        }
        model.addAttribute("pages", Utils.getPageNum(questionService.getQuestionsByName1AndName2Count(name1, name2)));
        model.addAttribute("columnName", name1);
        model.addAttribute("columnDetail", columnDetail);
        model.addAttribute("hello", "");
        return "column";
    }
    private String searchColumn(Integer order, Model model, String name1, String name2, String searchContent, int start, int length) {
        if (null != order && order == 1) {
            model.addAttribute("questions", questionService.getQuestionsByKeywordsAndName1AndName2(searchContent, name1, name2, 1,
                    start, length));
        } else {
            model.addAttribute("questions", questionService.getQuestionsByKeywordsAndName1AndName2(searchContent, name1, name2, 2,
                    start, length));
        }
        String columnDetail = Utils.getString(name1);
        model.addAttribute("columnName", name1);
        model.addAttribute("columnDetail", columnDetail);
        model.addAttribute("pages", Utils.getPageNum(questionService.getQuestionsByKeywordsAndName1AndName2Count(searchContent,
                name1, name2)));
        model.addAttribute("hello", "");
        return "column";
    }

}
