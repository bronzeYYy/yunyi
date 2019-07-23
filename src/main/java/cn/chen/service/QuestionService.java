package cn.chen.service;

import cn.chen.model.Question;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;

import java.util.List;
import java.util.Set;

public interface QuestionService {
    boolean save(Question question);
    List<Question> getQuestions(int start, int length);
    List<Question> getQuestionsByName1(String name1, int order, int start, int length);
    List<Question> getQuestionsByName1AndName2(String name1, String name2, int order, int start, int length);
    List<Question> getQuestionsOrderByStarAndComment(int start, int length);
    Question  getQuestionById(int id);
    List<Question> getUserQuestionsByUserId(int userId);

    boolean starQuestion(int questionId, int userId);
    List<Question> getQuestionsByKeywords(String searchContent, int order, int start, int length);
    List<Question> getQuestionsByKeywordsAndName1(String searchContent, String name1, int order, int start, int length);
    List<Question> getQuestionsByKeywordsAndName1AndName2(String searchContent, String name1, String name2, int order, int start, int length);

    int getQuestionsCount();

    int getQuestionsByContentFromNamesCount(String name1, String name2, String content);

    int getQuestionsByContentFromName1Count(String name1, String content);

    int getQuestionsByContentCount(String content);

    int getQuestionsByName1Count(String name1);

    int getQuestionsByName1AndName2Count(String name1, String name2);

    int getQuestionsByKeywordsCount(String sql);

    int getQuestionsByKeywordsAndName1Count(String sql, String name1);

    int getQuestionsByKeywordsAndName1AndName2Count(String sql, String name1, String name2);

    List<Question> getRecommendQuestionsByName1(int id);
}
