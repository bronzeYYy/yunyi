package cn.chen.service;
import cn.chen.model.Answer;

import java.util.List;

public interface AnswerDaoService {
    boolean save(Answer answer);
    List<Answer> getAnswersByQuestionId(int questionId);
}