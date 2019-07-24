package cn.chen.model;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class Answer {
    private int id;
    private User answerUser;
    private Question question;
    @NotNull(message = "回答内容必须填")
    @Size(min = 15, message = "回答内容有点短")
    private String answerContent;
    private int likenum;
    private String answerTime;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getAnswerUser() {
        return answerUser;
    }

    public void setAnswerUser(User answerUser) {
        this.answerUser = answerUser;
    }

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

    public String getAnswerContent() {
        return answerContent;
    }

    public void setAnswerContent(String answerContent) {
        this.answerContent = answerContent;
    }

    public String getAnswerTime() {
        return answerTime;
    }

    public void setAnswerTime(String answerTime) {
        this.answerTime = answerTime;
    }

    public int getLikenum() {
        return likenum;
    }

    public void setLikenum(int likenum) {
        this.likenum = likenum;
    }
}
