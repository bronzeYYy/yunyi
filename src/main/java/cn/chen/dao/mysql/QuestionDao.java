package cn.chen.dao.mysql;

import cn.chen.model.Answer;
import cn.chen.model.Question;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;

import java.util.List;

public interface QuestionDao {
    int save(Question question);
    List<Question> getQuestions();
    List<Question> getUserQuestionsByUserId(int userId);
    Question getQuestionById(int id);

    int starQuestion(int questionId, int userId) throws DataAccessException;
    List<Question> getQuestionsOrderByStarAndComment();
    int addStarNum(int questionId);
    int addCommentNum(int questionId);

    List<Question> getQuestionsByContentFromNames(@Param("name1") String name1, @Param("name2") String name2,
                                         @Param("content") String content,
                                         @Param("order") String order);
    List<Question> getQuestionsByContentFromName1(@Param("name1") String name1,
                                         @Param("content") String content,
                                         @Param("order") String order);
    List<Question> getQuestionsByContent(@Param("content") String content,
                                         @Param("order") String order);

    List<Question> getQuestionsByName1(@Param("name1") String name1, @Param("order") String order);
    List<Question> getQuestionsByName1AndName2(@Param("name1") String name1,
                                               @Param("name2") String name2,
                                               @Param("order") String order);

    List<Question> getQuestionsByKeywords(@Param("sql") String sql, @Param("order") String order);
    List<Question> getQuestionsByKeywordsAndName1(@Param("sql") String sql, @Param("name1") String name1, @Param("order") String order);
    List<Question> getQuestionsByKeywordsAndName1AndName2(@Param("sql") String sql,
                                                          @Param("name1") String name1,
                                                          @Param("name2") String name2,
                                                          @Param("order") String order);
}
