package cn.chen.service.impl;

import cn.chen.dao.mysql.QuestionDao;
import cn.chen.model.Question;
import cn.chen.service.QuestionService;
import org.springframework.stereotype.Service;

@Service
public class QuestionServiceImpl implements QuestionService {
    private QuestionDao questionDao;
    public QuestionServiceImpl(QuestionDao questionDao) {
        this.questionDao = questionDao;
    }
    @Override
    public boolean save(Question question) {
        return false;
    }
}
