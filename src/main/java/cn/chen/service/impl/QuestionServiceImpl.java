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

import java.util.*;

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
    public List<Question> getQuestions(int start, int length) {
        return questionDao.getQuestions(start, length);
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
    public List<Question> getQuestionsOrderByStarAndComment(int start, int length) {
        return questionDao.getQuestionsOrderByStarAndComment(start, length);
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
    public List<Question> getQuestionsByKeywords(String searchContent, int order, int start, int length) {
        List<String> list = Utils.getResultList(searchContent);
        String column = Utils.getOrder(order);
        List<Question> questions;
        if (list.size() == 0) {
            list = Collections.singletonList(searchContent);
            questions = questionDao.getQuestionsByContent("%" + searchContent + "%", column, start, length);
        } else {
            questions = questionDao.getQuestionsByKeywords(Utils.getSql(searchContent, list), column, start, length);
        }
        Utils.highAll(questions, list);
        return questions;
    }

    @Override
    public List<Question> getQuestionsByKeywordsAndName1(String searchContent, String name1, int order, int start, int length) {
        String column = Utils.getOrder(order);
        List<String> list = Utils.getResultList(searchContent);
        List<Question> questions;
        if (list.size() == 0) {
            list = Collections.singletonList(searchContent);
            questions = questionDao.getQuestionsByContentFromName1(name1, "%" + searchContent + "%", column, start, length);
        } else {
            questions = questionDao.getQuestionsByKeywordsAndName1(Utils.getSql(searchContent, list), name1, column, start, length);
        }
        Utils.highAll(questions, list);
        return questions;
    }

    @Override
    public List<Question> getQuestionsByKeywordsAndName1AndName2(String searchContent, String name1, String name2, int order,
                                                                 int start, int length) {
        List<String> list = Utils.getResultList(searchContent);
        String column = Utils.getOrder(order);
        List<Question> questions;
        if (list.size() == 0) {
            list = Collections.singletonList(searchContent);
            questions = questionDao.getQuestionsByContentFromNames(name1, name2, "%" + searchContent + "%", column, start, length);
        } else {
            questions = questionDao.getQuestionsByKeywordsAndName1AndName2(Utils.getSql(searchContent, list), name1, name2, column,
                    start, length);
        }
        Utils.highAll(questions, list);
        return questions;
    }

    @Override
    public List<Question> getQuestionsByName1(String name1, int order, int start, int length) {
        String column = Utils.getOrder(order);
        return questionDao.getQuestionsByName1(name1, column, start, length);
    }

    @Override
    public List<Question> getQuestionsByName1AndName2(String name1, String name2, int order, int start, int length) {
        String column = Utils.getOrder(order);
        return questionDao.getQuestionsByName1AndName2(name1, name2, column, start, length);
    }

    @Override
    public int getQuestionsCount() {
        return questionDao.getQuestionsCount();
    }

    @Override
    public int getQuestionsByContentFromNamesCount(String name1, String name2, String content) {
        return questionDao.getQuestionsByContentFromNamesCount(name1, name2, content);
    }

    @Override
    public int getQuestionsByContentFromName1Count(String name1, String content) {
        return questionDao.getQuestionsByContentFromName1Count(name1, content);
    }

    @Override
    public int getQuestionsByContentCount(String content) {
        return questionDao.getQuestionsByContentCount(content);
    }

    @Override
    public int getQuestionsByName1Count(String name1) {
        return questionDao.getQuestionsByName1Count(name1);
    }

    @Override
    public int getQuestionsByName1AndName2Count(String name1, String name2) {
        return questionDao.getQuestionsByName1AndName2Count(name1, name2);
    }

    @Override
    public int getQuestionsByKeywordsCount(String searchContent) {
        return questionDao.getQuestionsByKeywordsCount(Utils.getSql(searchContent));
    }

    @Override
    public int getQuestionsByKeywordsAndName1Count(String searchContent, String name1) {
        return questionDao.getQuestionsByKeywordsAndName1Count(Utils.getSql(searchContent), name1);
    }

    @Override
    public int getQuestionsByKeywordsAndName1AndName2Count(String searchContent, String name1, String name2) {
        return questionDao.getQuestionsByKeywordsAndName1AndName2Count(Utils.getSql(searchContent), name1, name2);
    }

    /*
    @Override
    public List<Question> getRecommendQuestionsByName1(int id) {
        Set<String> strings = jedisDao.getNamesById(id);
        StringBuilder sb = new StringBuilder("1 = 1 and ( ");
        Iterator<String> iterator = strings.iterator();
        while (iterator.hasNext()) {
            sb.append(" name1 = '");
            sb.append(iterator.next());
            sb.append("'   or");
        }
        sb.append(")");

        sb.delete(sb.length() - 5, sb.length() - 1);
        return questionDao.getRecommendQuestionsByName1(sb.toString());
    }
    */

    @Override
    public List<Question> getRecommendQuestionsByName1(int id) {
        int deleteChar = 1;
        Set<String> strings = jedisDao.getNamesById(id);
        StringBuilder sb = new StringBuilder("1 = 1");
        Iterator<String> iterator = strings.iterator();
        if (iterator.hasNext()) {
           sb.append(" and (");
           deleteChar = 3;
        }
        while (iterator.hasNext()) {
            sb.append(" name1 = '");
            sb.append(iterator.next());
            sb.append("' or");
        }
        if (deleteChar == 3) {
            sb.append(")");
        }

        sb.delete(sb.length() - deleteChar, sb.length() - 1);
        System.out.println(sb);
        return questionDao.getRecommendQuestionsByName1(sb.toString());
    }
}
