package cn.chen.dao.mysql;

import cn.chen.model.File;
import org.springframework.dao.DataAccessException;

import java.util.List;

public interface FileDao {
    int uploadFile(File file) throws DataAccessException;
    File getFileByMD5(String md5);
    List<File> getFilesByUserId(int userId);
    List<File> getFiles();

    //int upStarNumByMD5(String md5);
    int upDownloadNumByMD5(String md5);
}
