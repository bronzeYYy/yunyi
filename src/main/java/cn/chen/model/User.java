package cn.chen.model;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class User {
    private int id;
    @NotNull(message = "用户名必须得填")
    @Size(min = 2, max = 10, message = "用户名长度需在2到10之间")
    private String userName;
    @NotNull(message = "密码必须得填")
    @Size(min = 5, max = 15, message = "密码长度需在5到15之间")
    private String userPassword;
    @NotNull(message = "班级必须得填")
    @Size(min = 2, max = 10, message = "班级长度需在2到10之间")
    private String userClass;
    private int integral;
    private int askingNumber;
    private int answerNumber;
    @NotNull(message = "邮箱必须得填")
    @Size(min = 8, max = 40, message = "邮箱长度需在8到20之间")
    private String email;
    private String creationTime;
    @NotNull(message = "学号必须得填")
    @Size(min = 5, max = 10, message = "学号长度需在5到10之间")
    private String studentNo;
    private int uploadNumber;
    @NotNull
    @Size(min = 5, max = 10, message = "为了尽快解决您的问题，请正确填写QQ")
    private String userQq;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserClass() {
        return userClass;
    }

    public void setUserClass(String userClass) {
        this.userClass = userClass;
    }

    public int getIntegral() {
        return integral;
    }

    public void setIntegral(int integral) {
        this.integral = integral;
    }

    public int getAskingNumber() {
        return askingNumber;
    }

    public void setAskingNumber(int askingNumber) {
        this.askingNumber = askingNumber;
    }

    public int getAnswerNumber() {
        return answerNumber;
    }

    public void setAnswerNumber(int answerNumber) {
        this.answerNumber = answerNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCreationTime() {
        return creationTime;
    }

    public void setCreationTime(String creationTime) {
        this.creationTime = creationTime;
    }

    public String getStudentNo() {
        return studentNo;
    }

    public void setStudentNo(String studentNo) {
        this.studentNo = studentNo;
    }

    public int getUploadNumber() {
        return uploadNumber;
    }

    public void setUploadNumber(int uploadNumber) {
        this.uploadNumber = uploadNumber;
    }

    public String getUserQq() {
        return userQq;
    }

    public void setUserQq(String userQq) {
        this.userQq = userQq;
    }
}
