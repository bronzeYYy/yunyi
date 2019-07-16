package cn.chen.dao;

import cn.chen.config.RootConfig;
import cn.chen.model.Question;
import cn.chen.model.User;
import cn.chen.service.QuestionService;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import java.util.List;

public class QuestionServiceTest {
    @Test
    public void test() {
        AnnotationConfigApplicationContext annotationConfigApplicationContext = new AnnotationConfigApplicationContext(RootConfig.class);
        QuestionService questionService = annotationConfigApplicationContext.getBean(QuestionService.class);
        /*Question question = new Question();
        question.setQuestionContent("1");
        question.setQuestionName("你好");
        User user = new User();
        user.setId(1);
        question.setQuestioner(user);
        System.out.println(questionService.save(question));*/
        List<Question> q = questionService.getQuestions();
        q.forEach(e -> System.out.println(e.getCreationTime()));
//        System.out.println(q.getQuestionName());
//        System.out.println(q.getQuestioner().getUserName());
    }
}
