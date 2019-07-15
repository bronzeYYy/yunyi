package cn.chen.dao;
import cn.chen.data.enums.CommitTypeEnum;

public interface JedisDao {
    boolean setRandomCode(String email, String code);
    boolean checkRandomCode(String email, String code);
    boolean checkCommit(int id, CommitTypeEnum commitTypeEnum);
    boolean checkCommit(String email, CommitTypeEnum commitTypeEnum);
    boolean checkEmailSendCode(String email);
    boolean setCommitState(int id, CommitTypeEnum commitTypeEnum);
    void delCode(String email);
    void del(int id, CommitTypeEnum commitTypeEnum);
}