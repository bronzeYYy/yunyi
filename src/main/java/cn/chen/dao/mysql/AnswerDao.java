package cn.chen.dao.mysql;

import cn.chen.model.Answer;
import org.springframework.dao.DataAccessException;

import java.util.List;

public interface AnswerDao {
    int save(Answer answer); // 保存回答
    List<Answer> getAnswersByQuestionId(int questionId);
    Answer getAnswerById(int id);
    List<Answer> getUserAnswersByUserId(int userId);

    int starAnswer(int answerId, int userId) throws DataAccessException; // 插入点赞的数据

    List<Answer> getAnswersByQuestionIdOrderByStar(int questionId);
    int addStarNum(int answerId); // 给回答点赞，点赞数 + 1
}
