package cn.chen.controller;

import cn.chen.data.result.AbstractResult;
import cn.chen.data.result.MsgResult;
import cn.chen.model.Answer;
import cn.chen.model.Question;
import cn.chen.model.User;
import cn.chen.service.AnswerDaoService;
import cn.chen.service.UserDaoService;
import cn.chen.utils.Utils;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@RequestMapping("/answer")
public class AnswerController {
    private AnswerDaoService answerDaoService;
    private UserDaoService userDaoService;
    public AnswerController(AnswerDaoService answerDaoService, UserDaoService userDaoService) {
        this.answerDaoService = answerDaoService;
        this.userDaoService = userDaoService;
    }
    @RequestMapping("/save")
    @ResponseBody
    public AbstractResult save(@Valid Answer answer, Errors errors, HttpSession session, int questionId) {
        if (errors.hasErrors()) {
            return Utils.dealErrors(errors);
        }
        answer.setAnswerUser((User) session.getAttribute("user"));
        Question question = new Question();
        question.setId(questionId);
        answer.setQuestion(question);
        MsgResult msgResult = new MsgResult();
        if (answerDaoService.save(answer)) {
            msgResult.setCode(0);
            msgResult.setMsg("回复成功");
            session.setAttribute("user", userDaoService.getUserById(answer.getAnswerUser().getId()));
        } else {
            msgResult.setCode(0);
            msgResult.setMsg("回复失败");
        }
        return msgResult;
    }
}
