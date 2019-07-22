package cn.chen.service;

import cn.chen.model.Comment;

import java.util.List;

public interface CommentDaoService {
    boolean save(Comment comment);
    List<Comment> getCommentsByFileMD5(String FileMD5);
    Comment getCommentById(int id);
}
