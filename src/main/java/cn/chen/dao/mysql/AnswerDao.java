package cn.chen.dao.mysql;

import cn.chen.model.Answer;
import org.springframework.dao.DataAccessException;

import java.util.List;

public interface AnswerDao {
    int save(Answer answer);
    List<Answer> getAnswersByQuestionId(int questionId);
    Answer getAnswerById(int id);
    List<Answer> getUserAnswersByUserId(int userId);

    int starAnswer(int answerId, int userId) throws DataAccessException;
    List<Answer> getAnswersByQuestionIdOrderByStar(int questionId);
    int addStarNum(int answerId);
}
