package cn.chen.controller;

import cn.chen.data.enums.CommitTypeEnum;
import cn.chen.data.exceptions.FrequencyException;
import cn.chen.data.result.AbstractResult;
import cn.chen.data.result.MsgResult;
import cn.chen.service.QuestionService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class IndexController {
    private QuestionService questionService;
    public IndexController(QuestionService questionService) {
        this.questionService = questionService;
    }
    @RequestMapping("/user")
    public AbstractResult getUser() {
        return new MsgResult(1, "失败");
    }
    @RequestMapping("/test")
    public AbstractResult testException() {
        throw new FrequencyException(CommitTypeEnum.SEND_RANDOM_CODE);
        //return null;
    }
    @RequestMapping("/column")
    public String column(Model model) {
        model.addAttribute("questions", questionService.getQuestions());
        model.addAttribute("hello", "../");
        return "column";
    }
    @RequestMapping(value = {"", "/index"})
    public String questions(Model model) {
        model.addAttribute("questions", questionService.getQuestions());
        model.addAttribute("hello", "../");
        return "index";
    }
}
