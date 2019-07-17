package cn.chen.data.result;

public class DataResult<T> extends MsgResult {
    private T data;
    public DataResult(int code, T data, String msg) {
        super(code, msg);
        this.data = data;
    }
    private DataResult() {}

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
