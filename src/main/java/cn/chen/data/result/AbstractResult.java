package cn.chen.data.result;

public abstract class AbstractResult {
    public AbstractResult(int code) {
        this.code = code;
    }
    public AbstractResult() {}
    private int code;

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }
}
