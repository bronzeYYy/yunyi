package cn.chen.service.impl;

import cn.chen.dao.mysql.FileDao;
import cn.chen.data.exceptions.FileMd5ExistsException;
import cn.chen.data.exceptions.YunyiException;
import cn.chen.model.File;
import cn.chen.service.FileDaoService;
import cn.chen.utils.QiniuUtils;
import cn.chen.utils.Utils;
import com.qiniu.util.Md5;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.IOException;
import java.util.List;

@Service
public class FileDaoServiceImpl implements FileDaoService {
    private FileDao fileDao;
    public FileDaoServiceImpl(FileDao fileDao) {
        this.fileDao = fileDao;
    }
    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public boolean uploadFile(File fileInfo, MultipartHttpServletRequest request) {
        try {
            MultipartFile multipartFile = Utils.getFirstPartFile(request);
            String fileName = multipartFile.getOriginalFilename();
            String md5 = Md5.md5(multipartFile.getBytes());
            fileInfo.setMd5(md5);
            fileInfo.setFileName(fileName);
            if (fileDao.uploadFile(fileInfo) == 1) {
                // 添加信息成功, 向七牛云上传文件
                if (QiniuUtils.uploadFile(request, fileInfo.getMd5()
                        + fileName.substring(fileName.lastIndexOf('.'))).getCode() == 0) {
                    return true;
                }
                throw new YunyiException("上传失败");
            }
        } catch (IOException e) {
            throw new YunyiException("文件有些问题，请稍后再试");
        } catch (IndexOutOfBoundsException e) {
            throw new YunyiException("请上传有后缀名的文件");
        } catch (DataAccessException e) {
            e.printStackTrace();
            if (e instanceof DuplicateKeyException) {
                fileInfo.setUploader(null);
                throw new FileMd5ExistsException("文件信息已存在", fileInfo);
            }
        }
        return false;
    }

    @Override
    public File getFileByMD5(String md5) {
        return fileDao.getFileByMD5(md5);
    }

    @Override
    public List<File> getFilesByUserId(int userId) {
        return fileDao.getFilesByUserId(userId);
    }

    @Override
    public List<File> getFiles() {
        return fileDao.getFiles();
    }
}
