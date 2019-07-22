package cn.chen.service.impl;

import cn.chen.dao.mysql.CommentDao;
import cn.chen.model.Comment;
import cn.chen.model.File;
import cn.chen.service.CommentDaoService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentDaoServiceImpl implements CommentDaoService {
    private CommentDao commentDao;
    public CommentDaoServiceImpl(CommentDao commentDao) {
        this.commentDao = commentDao;
    }

    public boolean save(Comment comment) {
        return commentDao.save(comment) == 1;
    }
    public List<Comment> getCommentsByFileMD5(String FileMD5) {
        return commentDao.getCommentsByFileMD5(FileMD5);
    }
    public Comment getCommentById(int id) {
        return commentDao.getCommentById(id);
    }
}
