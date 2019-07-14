package cn.chen.service.impl;

import cn.chen.dao.mysql.UserDao;
import cn.chen.model.User;
import cn.chen.service.UserDaoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserDaoServiceImpl implements UserDaoService {
    private UserDao userDao;
    @Autowired
    public UserDaoServiceImpl(UserDao userDao) {
        this.userDao = userDao;
    }
    @Override
    public boolean addUser(User user) {
        return userDao.addUser(user) == 1;
    }

    @Override
    public User login(String noOrEmail, String password) {
        return userDao.getUserByNoOrEmail(noOrEmail, password);
    }

    @Override
    public User getUserPassword(String email, String studentNo) {
        return userDao.getUserPassword(email, studentNo);
    }

    @Override
    public boolean updateUser(User user) {
        return userDao.updateUser(user) == 1;
    }

    @Override
    public User getUserById(int id) {
        return userDao.getUserById(id);
    }
}
