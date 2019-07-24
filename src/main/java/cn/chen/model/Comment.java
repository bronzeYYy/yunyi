package cn.chen.model;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class Comment {
    private int id;
    private User commentUser;
    private File file;
    @NotNull (message = "评论内容必须填")
    @Size (min = 15, message = "评论内容有点短")
    private String commentContent;
    private String commentTime;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getCommentUser() {
        return commentUser;
    }

    public void setCommentUser(User commentUser) {
        this.commentUser = commentUser;
    }

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    public String getCommentTime() {
        return commentTime;
    }

    public void setCommentTime(String commentTime) {
        this.commentTime = commentTime;
    }
}
