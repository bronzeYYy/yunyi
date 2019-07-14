package cn.chen.service.impl;

import cn.chen.dao.mysql.QuestionDao;
import cn.chen.model.Question;
import cn.chen.service.QuestionService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QuestionServiceImpl implements QuestionService {
    private QuestionDao questionDao;
    public QuestionServiceImpl(QuestionDao questionDao) {
        this.questionDao = questionDao;
    }
    @Override
    public boolean save(Question question) {
        return questionDao.save(question) == 1;
    }
    @Override
    public List<Question> getQuestions() {
        return questionDao.getQuestions();
    }

    @Override
    public Question getQuestionById(int id) {
        return questionDao.getQuestionById(id);
    }
}
