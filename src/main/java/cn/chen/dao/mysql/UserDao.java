package cn.chen.dao.mysql;
import cn.chen.model.User;

public interface UserDao {
    int addUser(User user);
    User getUserById(int id);
    User getUserByNoOrEmail(String noOrEmail, String password);
    User getUserPassword(String email, String studentNo);
    int updateUser(User user);
    int addAskingNum(int userId);
    int addAnswerNum(int userId);
    int addUploadFileNum(int userId);
    int deleteUploadFileNum(int userId);

    int deleteAskingNum(int userId);
    int deleteAnswerNum(int userId);
    int deleteQuestionNum(int questionId);

    int deleteQuestion(int questionId, int userId);
    int deleteAnswer(int answerId, int userId);
    int deleteFile(String fileMd5, int userId);
}
