package cn.chen.data.exceptions.login;

public class NeedLoginException extends RuntimeException {
    public NeedLoginException() {
        super("需要登陆");
    }
}
