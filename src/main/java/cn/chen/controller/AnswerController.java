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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@RequestMapping(value = "/answer", method = RequestMethod.POST)
public class AnswerController {
    private AnswerDaoService answerDaoService;
    public AnswerController(AnswerDaoService answerDaoService) {
        this.answerDaoService = answerDaoService;
    }

    @RequestMapping("/save")  // 保存回答
    @ResponseBody
    public AbstractResult save(@Valid Answer answer, Errors errors, HttpSession session, int questionId) {
        if (errors.hasErrors()) {
            Utils.dealErrors(errors);
        }
        User user = (User) session.getAttribute("user");
        answer.setAnswerUser(user);
        Question question = new Question();
        question.setId(questionId);
        answer.setQuestion(question);
        MsgResult msgResult = new MsgResult();
        if (answerDaoService.save(answer)) {
            msgResult.setCode(0);
            msgResult.setMsg("回复成功");
            user.setAnswerNumber(user.getAnswerNumber() + 1);
            session.setAttribute("user", user);
        } else {
            msgResult.setCode(-1);
            msgResult.setMsg("回复失败");
        }
        return msgResult;
    }
    @RequestMapping("/star")  // 给回答点赞
    @ResponseBody
    public AbstractResult star(int answerId, HttpSession session) {
        MsgResult msgResult = new MsgResult();
        if (answerDaoService.starAnswer(answerId, ((User) session.getAttribute("user")).getId())) {
            msgResult.setCode(0);
            msgResult.setMsg("ok");
        } else {
            msgResult.setCode(-1);
            msgResult.setMsg("点赞失败");
        }
        return msgResult;
    }
}
