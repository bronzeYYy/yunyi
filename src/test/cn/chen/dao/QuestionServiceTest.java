package cn.chen.dao;

import cn.chen.config.RootConfig;
import cn.chen.dao.mysql.QuestionDao;
import cn.chen.model.Question;
import cn.chen.model.User;
import cn.chen.service.QuestionService;
import cn.chen.utils.Utils;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import java.util.HashSet;
import java.util.List;

public class QuestionServiceTest {
    @Test
    public void test() {
        AnnotationConfigApplicationContext annotationConfigApplicationContext = new AnnotationConfigApplicationContext(RootConfig.class);
        QuestionService questionService = annotationConfigApplicationContext.getBean(QuestionService.class);
        QuestionDao questionDao = annotationConfigApplicationContext.getBean(QuestionDao.class);
        questionDao.getRecommendQuestionsByName1("name1 = '计算机系' or name1 = '机械学院'").forEach(e -> System.out.println(e.getId()));
        /*Question question = new Question();
        question.setQuestionContent("1");
        question.setQuestionName("你好");
        User user = new User();
        user.setId(1);
        question.setQuestioner(user);
        System.out.println(questionService.save(question));*/
        /*List<Question> q = questionService.getQuestionsByName1("其它", 1, 0, 10);
        q.forEach(e -> System.out.println(e.getCreationTime()));*/
//        System.out.println(q.getQuestionName());
//        System.out.println(q.getQuestioner().getUserName());
    }

    @Test
    public void test1() {
        AnnotationConfigApplicationContext annotationConfigApplicationContext = new AnnotationConfigApplicationContext(RootConfig.class);
        QuestionService questionService = annotationConfigApplicationContext.getBean(QuestionService.class);
//        questionService.getQuestionsByKeywordsAndName1("大学生", "计算机系", 2).forEach(e -> System.out.println(e.getId()));
//        questionService.getQuestionsByName1("大学生", "计算机系", 2).forEach(e -> System.out.println(e.getId()));
//        System.out.println(Utils.getPageNum(7));
        System.out.println(questionService.getRecommendQuestionsByName1(15).size());
        /*QuestionDao questionDao = annotationConfigApplicationContext.getBean(QuestionDao.class);
        System.out.println(questionService.getQuestionsByName1Count("计算机系"));
        */
        /*questionService.getQuestionsByName1AndName2("其它", "其它", 1, 0, 10)
                .forEach(e -> System.out.println(e.getId()));*/
    }

    @Test
    public void test3() {
        StringBuilder sb = new StringBuilder("'   or)");
        System.out.println(sb.delete(sb.length() - 6, sb.length() - 1));
    }

}
