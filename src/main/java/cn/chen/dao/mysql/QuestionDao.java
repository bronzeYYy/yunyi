package cn.chen.dao.mysql;

import cn.chen.model.Question;
import java.util.List;

public interface QuestionDao {
    int save(Question question);
    List<Question> getQuestions();
    List<Question> getUserQuestionsByUserId(int userId);
    Question getQuestionById(int id);
}
