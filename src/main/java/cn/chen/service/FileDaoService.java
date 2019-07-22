package cn.chen.service;

import cn.chen.model.File;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.util.List;

public interface FileDaoService {
    boolean uploadFile(File file, MultipartHttpServletRequest request);
    File getFileByMD5(String md5);
    List<File> getFilesByUserId(int userId);
    List<File> getFiles(int start, int length, Integer order);
    int getFilesCount();
    List<File> getFilesByName1OrderBy(String name1, Integer order, int start, int length);
    int getFilesByName1Count(String name1);
    boolean upDownloadNumByMD5(String md5);
}
