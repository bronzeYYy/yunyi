package cn.chen.service;

import cn.chen.model.User;

public interface UserDaoService {
    boolean addUser(User user);
    User login(String noOrEmail, String password);
    User getUserPassword(String email, String studentNo);
    boolean updateUser(User user);
    User getUserById(int id);
    int addAskingNum(int userId);
    int addAnswerNum(int userId);
}
