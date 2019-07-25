package cn.chen.service.impl;

import cn.chen.dao.JedisDao;
import cn.chen.dao.mysql.FileDao;
import cn.chen.data.exceptions.FileMd5ExistsException;
import cn.chen.data.exceptions.NoSuchDataException;
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
            long size = multipartFile.getSize();
            if (size > Utils.maxFileSize) {
                throw new YunyiException("上传文件最大为200M");
            }
            String fileName = multipartFile.getOriginalFilename();
            String fileType = fileName.substring(fileName.lastIndexOf('.') + 1);
            String md5 = Md5.md5(multipartFile.getBytes());
            fileInfo.setMd5(md5);
            fileInfo.setFileName(fileName);
            fileInfo.setFileType(fileType);
            int type = Utils.getSizeUnitType(size);
            fileInfo.setFileSize(Utils.getSize(type, size));
            fileInfo.setSizeUnit(Utils.SIZE_UNITS[type]);
            if (fileDao.uploadFile(fileInfo) == 1) {
                // 添加信息成功, 向七牛云上传文件
                if (QiniuUtils.uploadFile(request, fileInfo.getMd5()
                        + "." + fileType).getCode() == 0) {
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
        File file = fileDao.getFileByMD5(md5);
        if (file == null) {
            throw new NoSuchDataException();
        }
        return file;
    }

    @Override
    public List<File> getFilesByUserId(int userId) {
        return fileDao.getFilesByUserId(userId);
    }

    @Override
    public List<File> getFiles(int start, int length, Integer order) {
        if (order == null || order != 2) {
            return fileDao.getFiles(start, length);
        }
        return fileDao.getFilesOrderByDownloadNum(start, length);
    }

    @Override
    public int getFilesCount() {
        return fileDao.getFilesCount();
    }

    @Override
    public List<File> getFilesByName1OrderBy(String name1, Integer order, int start, int length) {
        String column = "download_num";
        if (order == null || order != 2) {
            column = "file.creation_time";
        }
        return fileDao.getFilesByName1OrderBy(name1, column, start, length);
    }

    @Override
    public int getFilesByName1Count(String name1) {
        return fileDao.getFilesByName1Count(name1);
    }

    @Override
    public boolean upDownloadNumByMD5(String md5) {
        return fileDao.upDownloadNumByMD5(md5) == 1;
    }
}
