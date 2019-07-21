package cn.chen.data.exceptions;

import cn.chen.model.File;

public class FileMd5ExistsException extends RuntimeException {
    private File file;
    public FileMd5ExistsException(String msg) {
        super(msg);
    }
    public FileMd5ExistsException(String msg, File file) {
        super(msg);
        this.file = file;
    }

    public File getFile() {
        return file;
    }
}
