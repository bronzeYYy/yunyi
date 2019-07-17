package cn.chen.service.impl;

import cn.chen.dao.JedisDao;
import cn.chen.dao.mysql.QuestionDao;
import cn.chen.data.enums.CommitTypeEnum;
import cn.chen.data.exceptions.FrequencyException;
import cn.chen.data.exceptions.YunyiException;
import cn.chen.model.Question;
import cn.chen.service.QuestionService;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import java.util.List;

@Service
public class QuestionServiceImpl implements QuestionService {
    private QuestionDao questionDao;
    private JedisDao jedisDao;
    public QuestionServiceImpl(QuestionDao questionDao, JedisDao jedisDao) {
        this.questionDao = questionDao;
        this.jedisDao = jedisDao;
    }

    /*
     * create by: chen
     * description: 保存问题，保存成功并且设置用户提交状态成功才为true，否则为false并回滚
     * create time: 13:24 2019-07-14
     * @param question: 问题
     * @return boolean: 保存结果
     */
    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public boolean save(Question question) {
        if (questionDao.save(question) == 0) {
            return false;
        }
        System.out.println("保存到数据库成功");
        if (!jedisDao.setCommitState(question.getQuestioner().getId(), CommitTypeEnum.COMMIT_QUESTION)) {
            //TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            throw new FrequencyException(CommitTypeEnum.COMMIT_QUESTION); // 抛出异常自动回滚
        }
        return true;
    }
    @Override
    public List<Question> getQuestions() {
        return questionDao.getQuestions();
    }

    @Override
    public Question getQuestionById(int id) {
        return questionDao.getQuestionById(id);
    }

    @Override
    public List<Question> getUserQuestionsByUserId(int userId) {
        return questionDao.getUserQuestionsByUserId(userId);
    }

    @Override
    public List<Question> getQuestionsOrderByStarAndComment() {
        return questionDao.getQuestionsOrderByStarAndComment();
    }

    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public boolean starQuestion(int questionId, int userId) {
        try {
            if (questionDao.starQuestion(questionId, userId) != 1) {
                return false;
            }
            if (questionDao.addStarNum(questionId) != 1) {
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
}
