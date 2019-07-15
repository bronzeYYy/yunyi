package cn.chen.dao;

import cn.chen.config.RootConfig;
import cn.chen.model.Answer;
import cn.chen.model.Question;
import cn.chen.service.AnswerDaoService;
import cn.chen.service.QuestionService;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import java.util.List;


public class AnswerDaoServiceTest {
    @Test
    public void test() {
        AnnotationConfigApplicationContext annotationConfigApplicationContext = new AnnotationConfigApplicationContext(RootConfig.class);
        AnswerDaoService answerDaoService = annotationConfigApplicationContext.getBean(AnswerDaoService.class);
        /*Question question = new Question();
        question.setQuestionContent("1");
        question.setQuestionName("你好");
        User user = new User();
        user.setId(1);
        question.setQuestioner(user);*/
        List<Answer> q = answerDaoService.getAnswersByQuestionId(1);
        System.out.println();
        System.out.println();
    }
}
