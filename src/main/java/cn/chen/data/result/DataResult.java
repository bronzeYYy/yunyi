package cn.chen.data.result;

public class DataResult<T> extends AbstractResult {
    private T data;
    public DataResult(int code, T data) {
        super(code);
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
