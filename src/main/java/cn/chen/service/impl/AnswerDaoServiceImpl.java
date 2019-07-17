package cn.chen.service.impl;

import cn.chen.dao.JedisDao;
import cn.chen.dao.mysql.AnswerDao;
import cn.chen.data.enums.CommitTypeEnum;
import cn.chen.data.exceptions.FrequencyException;
import cn.chen.data.exceptions.YunyiException;
import cn.chen.model.Answer;
import cn.chen.service.AnswerDaoService;
import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import java.util.List;

@Service
public class AnswerDaoServiceImpl implements AnswerDaoService {
    private AnswerDao answerDao;
    private JedisDao jedisDao;
    public AnswerDaoServiceImpl(AnswerDao answerDao, JedisDao jedisDao) {
        this.answerDao = answerDao;
        this.jedisDao = jedisDao;
    }

    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public boolean save(Answer answer) {
        if (answerDao.save(answer) == 0) {
            return false;
        }
        if (!jedisDao.setCommitState(answer.getAnswerUser().getId(), CommitTypeEnum.COMMIT_ANSWER)) {
            //TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            throw new FrequencyException(CommitTypeEnum.COMMIT_ANSWER);
        }
        return true;
    }

    @Override
    public List<Answer> getAnswersByQuestionId(int questionId) {
        return answerDao.getAnswersByQuestionId(questionId);
    }

    @Override
    public Answer getAnswerById(int id) {
        return answerDao.getAnswerById(id);
    }

    @Override
    public List<Answer> getUserAnswersByUserId(int userId) {
        return answerDao.getUserAnswersByUserId(userId);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public boolean starAnswer(int answerId, int userId) {
        try {
            if (answerDao.starAnswer(answerId, userId) != 1) {
                return false;
            }
            if (answerDao.addStarNum(answerId) != 1) {
                throw new YunyiException("点赞失败");
            }
        } catch (DataAccessException e) {
            if (e instanceof DuplicateKeyException) {
                throw new YunyiException("你已经赞过");
            }
            throw new YunyiException("点赞失败");
        }
        return true;
    }


    @Override
    public List<Answer> getAnswersByQuestionIdOrderByStar(int questionId) {
        return answerDao.getAnswersByQuestionIdOrderByStar(questionId);
    }
}
