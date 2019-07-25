package cn.chen.dao;

import cn.chen.config.RootConfig;
import cn.chen.model.Answer;
import cn.chen.model.Question;
import cn.chen.model.User;
import cn.chen.service.AnswerDaoService;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;


public class AnswerDaoServiceTest {
    /*@Test
    public void test() {
        *//*AnnotationConfigApplicationContext annotationConfigApplicationContext = new AnnotationConfigApplicationContext(RootConfig.class);
        AnswerDaoService answerDaoService = annotationConfigApplicationContext.getBean(AnswerDaoService.class);
        Question question = new Question();
        question.setId(2);
        *//**//*uestion.setQuestionContent("1");
        question.setQuestionName("你好");*//**//*
        User user = new User();
        user.setId(15);
        question.setQuestioner(user);
        Answer answer = new Answer();
        answer.setAnswerContent("testtestetst");
        answer.setAnswerUser(user);
        answer.setQuestion(question);
        System.out.println(answerDaoService.save(answer));*//*
        //System.out.println(answerDaoService.getUserAnswersByUserId(14).size());
        //System.out.println(answerDaoService.save(answer));
        *//*List<Answer> q = answerDaoService.getAnswersByQuestionId(1);
        System.out.println();
        System.out.println();*//*
    }
    @Test
    public void test1() {
        AnnotationConfigApplicationContext annotationConfigApplicationContext = new AnnotationConfigApplicationContext(RootConfig.class);
        AnswerDaoService answerDaoService = annotationConfigApplicationContext.getBean(AnswerDaoService.class);
        answerDaoService.getAnswersByQuestionId(1).forEach(e -> System.out.println(e.getId()));
        //System.out.println(answerDaoService.getUserAnswersByUserId(14).size());
        //System.out.println(answerDaoService.save(answer));
        *//*List<Answer> q = answerDaoService.getAnswersByQuestionId(1);
        System.out.println();
        System.out.println();*//*
    }
    @Test
    public void test2() {
        AnnotationConfigApplicationContext annotationConfigApplicationContext = new AnnotationConfigApplicationContext(RootConfig.class);
        AnswerDaoService answerDaoService = annotationConfigApplicationContext.getBean(AnswerDaoService.class);
        answerDaoService.getUserAnswersByUserId(15).forEach(e -> System.out.println(e.getId()));
        //System.out.println(answerDaoService.getUserAnswersByUserId(14).size());
        //System.out.println(answerDaoService.save(answer));
        *//*List<Answer> q = answerDaoService.getAnswersByQuestionId(1);
        System.out.println();
        System.out.println();*//*
    }*/
}
