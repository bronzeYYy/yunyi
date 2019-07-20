package cn.chen.service.impl;

import cn.chen.dao.JedisDao;
import cn.chen.dao.mysql.QuestionDao;
import cn.chen.data.enums.CommitTypeEnum;
import cn.chen.data.exceptions.FrequencyException;
import cn.chen.data.exceptions.YunyiException;
import cn.chen.model.Question;
import cn.chen.service.QuestionService;
import cn.chen.utils.Utils;
import com.hankcs.hanlp.HanLP;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import java.util.Collections;
import java.util.LinkedList;
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

    @Override
    public List<Question> getQuestionsByKeywords(String searchContent, int order) {
        List<String> list = Utils.getResultList(searchContent);
        String column = Utils.getOrder(order);
        List<Question> questions;
        if (list.size() == 0) {
            list = Collections.singletonList(searchContent);
            questions = questionDao.getQuestionsByContent("%" + searchContent + "%", column);
        } else {
            questions = questionDao.getQuestionsByKeywords(Utils.getSql(searchContent, list), column);
        }
        Utils.highAll(questions, list);
        return questions;
    }

    @Override
    public List<Question> getQuestionsByKeywordsAndName1(String searchContent, String name1, int order) {
        String column = Utils.getOrder(order);
        List<String> list = Utils.getResultList(searchContent);
        List<Question> questions;
        if (list.size() == 0) {
            list = Collections.singletonList(searchContent);
            questions = questionDao.getQuestionsByContentFromName1(name1, "%" + searchContent + "%", column);
        } else {
            questions = questionDao.getQuestionsByKeywordsAndName1(Utils.getSql(searchContent, list), name1, column);
        }
        Utils.highAll(questions, list);
        return questions;
    }

    @Override
    public List<Question> getQuestionsByKeywordsAndName1AndName2(String searchContent, String name1, String name2, int order) {
        List<String> list = Utils.getResultList(searchContent);
        String column = Utils.getOrder(order);
        List<Question> questions;
        if (list.size() == 0) {
            list = Collections.singletonList(searchContent);
            questions = questionDao.getQuestionsByContentFromNames(name1, name2, "%" + searchContent + "%", column);
        } else {
            questions = questionDao.getQuestionsByKeywordsAndName1AndName2(Utils.getSql(searchContent, list), name1, name2, column);
        }
        Utils.highAll(questions, list);
        return questions;
    }

    @Override
    public List<Question> getQuestionsByName1(String name1, int order) {
        String column = Utils.getOrder(order);
        return questionDao.getQuestionsByName1(name1, column);
    }

    @Override
    public List<Question> getQuestionsByName1AndName2(String name1, String name2, int order) {
        String column = Utils.getOrder(order);
        return questionDao.getQuestionsByName1AndName2(name1, name2, column);
    }

    private List<Question> getQuestionsByContent(String name1, String name2, String content, int order) {
        return null;
    }
}
