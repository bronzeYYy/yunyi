package cn.chen.service.impl;

import cn.chen.model.Answer;
import cn.chen.service.AnswerDaoService;
import org.springframework.stereotype.Service;

@Service
public class AnswerDaoServiceImpl implements AnswerDaoService {
    @Override
    public boolean save(Answer answer) {
        return false;
    }
}
