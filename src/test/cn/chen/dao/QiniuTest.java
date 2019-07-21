package cn.chen.dao;

import cn.chen.config.QiNiuConfig;
import cn.chen.config.RootConfig;
import com.qiniu.storage.BucketManager;
import com.qiniu.storage.model.FileInfo;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class QiniuTest {
    @Test
    public void test() {
        AnnotationConfigApplicationContext annotationConfigApplicationContext = new AnnotationConfigApplicationContext(RootConfig.class);
        BucketManager bucketManager = annotationConfigApplicationContext.getBean(BucketManager.class);
        BucketManager.FileListIterator iterator = bucketManager.createFileListIterator(QiNiuConfig.BUCKET, "avatar_15");
        while (iterator.hasNext()) {
            FileInfo[] f = iterator.next();
            System.out.println("length: " + f.length);
            for (FileInfo fileInfo : f) {
                System.out.println("name: " + fileInfo.key);
                System.out.println("md5: " + fileInfo.md5);
                System.out.println("hash: " + fileInfo.hash);
                System.out.println();
            }
        }
    }
    @Test
    public void test1() {
        AnnotationConfigApplicationContext annotationConfigApplicationContext = new AnnotationConfigApplicationContext(RootConfig.class);
        BucketManager bucketManager = annotationConfigApplicationContext.getBean(BucketManager.class);
        BucketManager.FileListIterator iterator = bucketManager.createFileListIterator(QiNiuConfig.BUCKET, "avatar_15");
        int max = -1;
        while (iterator.hasNext()) {
            FileInfo[] fileInfos = iterator.next();
            for (FileInfo fileInfo : fileInfos) {
                int i = Integer.valueOf(fileInfo.key.substring("avatar_15".length() + 1));
                if (i > max) {
                    max = i;
                }
            }
        }
        System.out.println(max + 1);
    }
}
