package cn.chen.data.result;

import java.util.LinkedList;
import java.util.List;

public class UploadResult {
    private int errno = -1;
    private List<String> data;

    public UploadResult() {
        data = new LinkedList<>();
    }

    public void add(String s) {
        errno = 0;
        this.data.add(s);
    }

    public int getErrno() {
        return errno;
    }

    public void setErrno(int errno) {
        this.errno = errno;
    }

    public List<String> getData() {
        return data;
    }

    public void setData(List<String> data) {
        this.data = data;
    }
}
