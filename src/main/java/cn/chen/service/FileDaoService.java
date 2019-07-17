package cn.chen.service;

import cn.chen.model.File;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.util.List;

public interface FileDaoService {
    boolean uploadFile(File file, MultipartHttpServletRequest request);
    File getFileByMD5(String md5);
    List<File> getFilesByUserId(int userId);
    List<File> getFiles();
}
