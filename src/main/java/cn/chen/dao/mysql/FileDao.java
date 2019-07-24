package cn.chen.dao.mysql;

import cn.chen.model.File;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;

import java.util.List;

public interface FileDao {
    int uploadFile(File file) throws DataAccessException;
    File getFileByMD5(String md5);
    List<File> getFilesByUserId(int userId);
    List<File> getFiles(int start, int length);
    List<File> getFilesOrderByDownloadNum(int start, int length);
    int getFilesCount();
    List<File> getFilesByName1OrderBy(@Param("name1") String name1, @Param("order") String order,
                                      @Param("start") int start, @Param("length") int length);
    int getFilesByName1Count(@Param("name1") String name1);

    //int upStarNumByMD5(String md5);
    int upDownloadNumByMD5(String md5);

}
