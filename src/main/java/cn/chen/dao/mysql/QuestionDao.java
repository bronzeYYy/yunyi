package cn.chen.dao.mysql;

import cn.chen.model.Answer;
import cn.chen.model.Question;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;

import java.util.List;

public interface QuestionDao {
    int save(Question question);
    List<Question> getQuestions(int start, int length);
    int getQuestionsCount();
    List<Question> getUserQuestionsByUserId(int userId);
    Question getQuestionById(int id);

    int starQuestion(int questionId, int userId) throws DataAccessException;
    List<Question> getQuestionsOrderByStarAndComment(int start, int length);
    int addStarNum(int questionId);
    int addCommentNum(int questionId);

    List<Question> getRecommendQuestionsByName1(@Param("sql") String sql);

    List<Question> getQuestionsByContentFromNames(@Param("name1") String name1, @Param("name2") String name2,
                                         @Param("content") String content,
                                         @Param("order") String order, @Param("start") int start, @Param("length") int length);
    int getQuestionsByContentFromNamesCount(@Param("name1") String name1, @Param("name2") String name2,
                                            @Param("content") String content);
    List<Question> getQuestionsByContentFromName1(@Param("name1") String name1,
                                         @Param("content") String content,
                                         @Param("order") String order, @Param("start") int start, @Param("length") int length);
    int getQuestionsByContentFromName1Count(@Param("name1") String name1,
                                            @Param("content") String content);
    List<Question> getQuestionsByContent(@Param("content") String content,
                                         @Param("order") String order, @Param("start") int start, @Param("length") int length);
    int getQuestionsByContentCount(@Param("content") String content);

    List<Question> getQuestionsByName1(@Param("name1") String name1, @Param("order") String order,
                                       @Param("start") int start, @Param("length") int length);
    int getQuestionsByName1Count(@Param("name1") String name1);
    List<Question> getQuestionsByName1AndName2(@Param("name1") String name1,
                                               @Param("name2") String name2,
                                               @Param("order") String order, @Param("start") int start, @Param("length") int length);
    int getQuestionsByName1AndName2Count(@Param("name1") String name1,
                                         @Param("name2") String name2);
    List<Question> getQuestionsByKeywords(@Param("sql") String sql, @Param("order") String order,
                                          @Param("start") int start, @Param("length") int length);
    int getQuestionsByKeywordsCount(@Param("sql") String sql);
    List<Question> getQuestionsByKeywordsAndName1(@Param("sql") String sql, @Param("name1") String name1, @Param("order") String order,
                                                  @Param("start") int start, @Param("length") int length);
    int getQuestionsByKeywordsAndName1Count(@Param("sql") String sql, @Param("name1") String name1);
    List<Question> getQuestionsByKeywordsAndName1AndName2(@Param("sql") String sql,
                                                          @Param("name1") String name1,
                                                          @Param("name2") String name2,
                                                          @Param("order") String order, @Param("start") int start, @Param("length") int length);
    int getQuestionsByKeywordsAndName1AndName2Count(@Param("sql") String sql,
                                                    @Param("name1") String name1,
                                                    @Param("name2") String name2);
}
