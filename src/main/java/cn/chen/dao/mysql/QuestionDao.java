package cn.chen.dao.mysql;

import cn.chen.model.Answer;
import cn.chen.model.Question;
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
}
