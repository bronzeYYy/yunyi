package cn.chen.model;

import com.qiniu.util.StringMap;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class File {
    private String md5;
    private String fileName;
    @NotNull(message = "文件描述必须填")
    @Size(min = 8, message = "文件描述应大于8个字符")
    private String fileDetail;
    private User uploader;
    private String creationTime;
    private int likenum;

    public int getLikenum() {
        return likenum;
    }

    public void setLikenum(int likenum) {
        this.likenum = likenum;
    }

    public String getMd5() {
        return md5;
    }

    public void setMd5(String md5) {
        this.md5 = md5;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFileDetail() {
        return fileDetail;
    }

    public void setFileDetail(String fileDetail) {
        this.fileDetail = fileDetail;
    }

    public User getUploader() {
        return uploader;
    }

    public void setUploader(User uploader) {
        this.uploader = uploader;
    }

    public String getCreationTime() {
        return creationTime;
    }

    public void setCreationTime(String creationTime) {
        this.creationTime = creationTime;
    }
}
