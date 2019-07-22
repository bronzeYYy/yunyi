package cn.chen.dao.mysql;

import cn.chen.model.Answer;
import cn.chen.model.Comment;
import org.springframework.dao.DataAccessException;

import java.util.List;

public interface CommentDao {
    int save(Comment comment);
    List<Comment> getCommentsByFileMD5(String FileMD5);
    Comment getCommentById(int id);
}
