package cn.chen.service.impl;

import cn.chen.config.QiNiuConfig;
import cn.chen.dao.mysql.FileDao;
import cn.chen.dao.mysql.UserDao;
import cn.chen.data.exceptions.YunyiException;
import cn.chen.model.File;
import cn.chen.model.User;
import cn.chen.service.UserDaoService;
import cn.chen.utils.QiniuUtils;
import com.qiniu.common.QiniuException;
import com.qiniu.storage.BucketManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserDaoServiceImpl implements UserDaoService {
    private UserDao userDao;
    private FileDao fileDao;
    private BucketManager bucketManager;
    @Autowired
    public UserDaoServiceImpl(UserDao userDao, BucketManager bucketManager, FileDao fileDao) {
        this.userDao = userDao;
        this.bucketManager = bucketManager;
        this.fileDao = fileDao;
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

    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public boolean deleteQuestion(int questionId, int userId) {
        return userDao.deleteQuestion(questionId, userId) == 1;
    }

    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public boolean deleteAnswer(int answerId, int userId) {
        return userDao.deleteAnswer(answerId, userId) == 1;
    }

    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public boolean deleteFile(String fileMd5, int userId) {
        File file = fileDao.getFileByMD5(fileMd5);
        if (file != null && userDao.deleteFile(fileMd5, userId) == 1) {
            try {
                bucketManager.delete(QiNiuConfig.FILE_BUCKET, file.getMd5() + "." + file.getFileType());
            } catch (QiniuException e) {
                e.printStackTrace();
                throw new YunyiException("删除文件失败");
            }
        } else {
            return false;
        }
        return true;
    }
}
