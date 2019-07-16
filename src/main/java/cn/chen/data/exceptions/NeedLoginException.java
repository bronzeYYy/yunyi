package cn.chen.data.exceptions;

public class NeedLoginException extends RuntimeException {
    public NeedLoginException() {
        super("需要登陆");
    }
}
