package cn.chen.service;

import cn.chen.model.Question;

import java.util.List;

public interface QuestionService {
    boolean save(Question question);
    List<Question> getQuestions();
    Question  getQuestionById(int id);
}
