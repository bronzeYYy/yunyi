package cn.chen.service;

import cn.chen.model.User;

public interface UserDaoService {
    boolean addUser(User user);
    User login(String noOrEmail, String password);
    User getUserPassword(String email, String studentNo);
    boolean updateUser(User user);
    User getUserById(int id);

    boolean deleteQuestion(int questionId, int userId);
    boolean deleteAnswer(int answerId, int userId);
    boolean deleteFile(String fileMd5, int userId);
}
