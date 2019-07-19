package cn.chen.aop;

import cn.chen.dao.JedisDao;
import cn.chen.dao.mysql.QuestionDao;
import cn.chen.dao.mysql.UserDao;
import cn.chen.data.enums.CommitTypeEnum;
import cn.chen.data.exceptions.YunyiException;
import cn.chen.model.Answer;
import cn.chen.model.Question;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class UserBehaviorAspect {
    private UserDao userDao;
    private JedisDao jedisDao;
    private QuestionDao questionDao;

    public UserBehaviorAspect(UserDao userDao, JedisDao jedisDao, QuestionDao questionDao) {
        this.userDao = userDao;
        this.jedisDao = jedisDao;
        this.questionDao = questionDao;
    }
    @Pointcut(value = "execution(* cn.chen.service.QuestionService.save(cn.chen.model.Question)) && args(question)", argNames = "question")
    public void questionSaveAspect(Question question) {}

    @Pointcut(value = "execution(* cn.chen.service.AnswerDaoService.save(cn.chen.model.Answer)) && args(answer)", argNames = "answer")
    public void AnswerSaveAspect(Answer answer) {}

    @Around("questionSaveAspect(cn.chen.model.Question)")
    public Object updateAskingNum(ProceedingJoinPoint pjp) {
        // 提问之前
        //System.out.println("进入保存问题的切面");
        Question question = (Question) pjp.getArgs()[0];
        Object o;
        try {
            o = pjp.proceed();
        } catch (Throwable throwable) {
            throwable.printStackTrace();
            throw (YunyiException) throwable;
            // 向上抛出异常，回滚
        }
        if (Boolean.TRUE.equals(o)) {
            // 提问成功
            if (userDao.addAskingNum(question.getQuestioner().getId()) != 1) {
                jedisDao.del(question.getQuestioner().getId(), CommitTypeEnum.COMMIT_QUESTION);
                throw new YunyiException("提问失败");
                // 更新个数失败，回滚
            }
        }
        // 提问之后
        return o;
    }

    @Around("AnswerSaveAspect(cn.chen.model.Answer)")
    public Object updateAnswerNum(ProceedingJoinPoint pjp) {
        // 回答之前
        //System.out.println("进入保存回答的切面");
        Answer answer = (Answer) pjp.getArgs()[0];
        Object o;
        try {
            o = pjp.proceed();
        } catch (Throwable throwable) {
            throwable.printStackTrace();
            throw (YunyiException) throwable;
            // 向上抛出异常，回滚
        }
        if (Boolean.TRUE.equals(o)) {
            // 提问成功
            if (questionDao.addCommentNum(answer.getQuestion().getId()) != 1) {
                jedisDao.del(answer.getAnswerUser().getId(), CommitTypeEnum.COMMIT_ANSWER);
                throw new YunyiException("回答失败");
                // 更新个数失败，回滚
            }
            if (userDao.addAnswerNum(answer.getAnswerUser().getId()) != 1) {
                jedisDao.del(answer.getAnswerUser().getId(), CommitTypeEnum.COMMIT_ANSWER);
                throw new YunyiException("回答失败");
                // 更新个数失败，回滚
            }
        }
        // 提问之后
        return o;
    }
}
