package cn.chen.dao.mysql;
import cn.chen.model.User;

public interface UserDao {
    int addUser(User user);
    User getUserById(int id);
    User getUserByNoOrEmail(String noOrEmail, String password);
    User getUserPassword(String email, String studentNo);
}
