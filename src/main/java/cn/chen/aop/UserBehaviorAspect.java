package cn.chen.aop;

import cn.chen.dao.JedisDao;
import cn.chen.dao.mysql.AnswerDao;
import cn.chen.dao.mysql.QuestionDao;
import cn.chen.dao.mysql.UserDao;
import cn.chen.data.enums.CommitTypeEnum;
import cn.chen.data.exceptions.YunyiException;
import cn.chen.model.Answer;
import cn.chen.model.Question;
import cn.chen.service.UserDaoService;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class UserBehaviorAspect {
    private UserDao userDao;
    private JedisDao jedisDao;
    private QuestionDao questionDao;
    private AnswerDao answerDao;

    private UserDaoService userDaoService;

    public UserBehaviorAspect(UserDao userDao, JedisDao jedisDao, QuestionDao questionDao, AnswerDao answerDao, UserDaoService userDaoService) {
        this.userDao = userDao;
        this.jedisDao = jedisDao;
        this.questionDao = questionDao;
        this.answerDao = answerDao;
        this.userDaoService = userDaoService;
    }
    @Pointcut(value = "execution(* cn.chen.service.QuestionService.save(cn.chen.model.Question)) && args(question)", argNames = "question")
    public void questionSaveAspect(Question question) {}

    @Pointcut(value = "execution(* cn.chen.service.AnswerDaoService.save(cn.chen.model.Answer)) && args(answer)", argNames = "answer")
    public void AnswerSaveAspect(Answer answer) {}

    @Pointcut(value = "execution(* cn.chen.service.UserDaoService.deleteQuestion(int, int)) && args(questionId, userId)",
            argNames = "questionId, userId")
    public void questionDeleteAspect(int questionId, int userId) {}

    @Pointcut(value = "execution(* cn.chen.service.UserDaoService.deleteAnswer(int, int)) && args(answerId, userId)",
            argNames = "answerId, userId")
    public void AnswerDeleteAspect(int answerId, int userId) {}

    @Around("questionSaveAspect(cn.chen.model.Question)")
    public Object addAskingNum(ProceedingJoinPoint pjp) {
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
    public Object addAnswerNum(ProceedingJoinPoint pjp) {
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

    @Around("questionDeleteAspect(int, int)")
    public Object deleteAskingNum(ProceedingJoinPoint pjp) {
        // 提问之前
        //System.out.println("进入保存问题的切面");
        int userId = (int) pjp.getArgs()[1];
        int questionId = (int) pjp.getArgs()[0];

        answerDao.getAnswersByQuestionId(questionId).forEach(e -> {
            if (!userDaoService.deleteAnswer(e.getId(), e.getAnswerUser().getId())) {
                throw new YunyiException("删除失败");
            }
        });
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
            if (userDao.deleteAskingNum(userId) != 1) {
                throw new YunyiException("删除失败");
                // 更新个数失败，回滚
            }
        }
        // 提问之后
        return o;
    }

    @Around("AnswerDeleteAspect(int, int)")
    public Object deleteAnswerNum(ProceedingJoinPoint pjp) {
        // 回答之前
        int userId = (int) pjp.getArgs()[1];
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
            if (userDao.deleteAnswerNum(userId) != 1) {
                throw new YunyiException("删除失败");
                // 更新个数失败，回滚
            }
        }
        // 提问之后
        return o;
    }
}
