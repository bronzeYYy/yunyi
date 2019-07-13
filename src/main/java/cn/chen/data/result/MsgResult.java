package cn.chen.data.result;

public class MsgResult extends AbstractResult {
    public MsgResult(int code, String msg) {
        super(code);
        this.msg = msg;
    }
    public MsgResult() {}
    private String msg;

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
