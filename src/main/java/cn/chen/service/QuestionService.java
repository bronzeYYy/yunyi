package cn.chen.service;

import cn.chen.model.Question;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface QuestionService {
    boolean save(Question question);
    List<Question> getQuestions();
    List<Question> getQuestionsByName1(String name1, int order);
    List<Question> getQuestionsByName1AndName2(String name1, String name2, int order);
    List<Question> getQuestionsOrderByStarAndComment();
    Question  getQuestionById(int id);
    List<Question> getUserQuestionsByUserId(int userId);

    boolean starQuestion(int questionId, int userId);
    List<Question> getQuestionsByKeywords(String searchContent, int order);
    List<Question> getQuestionsByKeywordsAndName1(String searchContent, String name1, int order);
    List<Question> getQuestionsByKeywordsAndName1AndName2(String searchContent, String name1, String name2, int order);
}
