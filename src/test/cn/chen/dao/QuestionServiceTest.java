package cn.chen.dao;

import cn.chen.config.RootConfig;
import cn.chen.dao.mysql.QuestionDao;
import cn.chen.model.Question;
import cn.chen.model.User;
import cn.chen.service.QuestionService;
import cn.chen.utils.Utils;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import java.util.List;

public class QuestionServiceTest {
    @Test
    public void test() {
        AnnotationConfigApplicationContext annotationConfigApplicationContext = new AnnotationConfigApplicationContext(RootConfig.class);
        QuestionService questionService = annotationConfigApplicationContext.getBean(QuestionService.class);
        QuestionDao questionDao = annotationConfigApplicationContext.getBean(QuestionDao.class);
        /*Question question = new Question();
        question.setQuestionContent("1");
        question.setQuestionName("你好");
        User user = new User();
        user.setId(1);
        question.setQuestioner(user);
        System.out.println(questionService.save(question));*/
        List<Question> q = questionService.getQuestionsByName1("其它", 1, 0, 10);
        q.forEach(e -> System.out.println(e.getCreationTime()));
//        System.out.println(q.getQuestionName());
//        System.out.println(q.getQuestioner().getUserName());
    }

    @Test
    public void test1() {
        AnnotationConfigApplicationContext annotationConfigApplicationContext = new AnnotationConfigApplicationContext(RootConfig.class);
        QuestionService questionService = annotationConfigApplicationContext.getBean(QuestionService.class);
//        questionService.getQuestionsByKeywordsAndName1("大学生", "计算机系", 2).forEach(e -> System.out.println(e.getId()));
//        questionService.getQuestionsByName1("大学生", "计算机系", 2).forEach(e -> System.out.println(e.getId()));
        System.out.println(Utils.getPageNum(7));
        /*QuestionDao questionDao = annotationConfigApplicationContext.getBean(QuestionDao.class);
        System.out.println(questionService.getQuestionsByName1Count("计算机系"));
        */
        /*questionService.getQuestionsByName1AndName2("其它", "其它", 1, 0, 10)
                .forEach(e -> System.out.println(e.getId()));*/
    }
}
