package cn.chen.dao;

import cn.chen.config.RootConfig;
import cn.chen.dao.mysql.FileDao;
import cn.chen.model.File;
import cn.chen.model.User;
import cn.chen.service.FileDaoService;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import java.util.List;

public class FIleDaoTest {
    @Test
    public void test1() {
        AnnotationConfigApplicationContext annotationConfigApplicationContext = new AnnotationConfigApplicationContext(RootConfig.class);
        FileDao fileDao = annotationConfigApplicationContext.getBean(FileDao.class);
        FileDaoService fileDaoService = annotationConfigApplicationContext.getBean(FileDaoService.class);
        /*File file = new File();
        file.setMd5("1");
        file.setFileName("1");
        file.setFileDetail("1");
        User user = new User();
        user.setId(1);
        file.setUploader(user);*/
        Integer a = null;
        test(a);
        //fileDaoService.getFiles(a);
        /*List<File> files = fileDao.getFiles();
        System.out.println();*/
    }
    public void test(Integer a) {
        System.out.println(a == 2);
    }
}
