package cn.chen.service;

import cn.chen.model.Question;

import java.util.List;

public interface QuestionService {
    boolean save(Question question);
    List<Question> getQuestions();
    List<Question> getQuestionsOrderByStarAndComment();
    Question  getQuestionById(int id);
    List<Question> getUserQuestionsByUserId(int userId);

    boolean starQuestion(int questionId, int userId);

}
