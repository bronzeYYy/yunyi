package cn.chen.dao.mysql;

import cn.chen.model.Answer;
import java.util.List;

public interface AnswerDao {
    int save(Answer answer);
    List<Answer> getAnswersByQuestionId(int questionId);
    Answer getAnswerById(int id);
    List<Answer> getUserAnswersByUserId(int userId);
}
