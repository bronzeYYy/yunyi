package cn.chen.config;

import com.qiniu.common.Zone;
import com.qiniu.storage.BucketManager;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class QiNiuConfig {
    private static final String AK = "";
    private static final String SK = "";

    public static final String BUCKET = "yunyi_img";
    public static final String FILE_BUCKET = "yunyi_file";
    public static final String BUCKET_URL = "http://yunyi-img.chen1234.cn/";
    public static final String FILE_BUCKET_URL = "http://yunyi-file.chen1234.cn/";

    @Bean
    public Auth auth () {
        return Auth.create(AK, SK);
    }
    @Bean
    public Zone zone() {
        return Zone.autoZone();
    }
    @Bean
    public com.qiniu.storage.Configuration configuration(Zone zone) {
        return new com.qiniu.storage.Configuration(zone);
    }
    @Bean
    public UploadManager uploadManager(com.qiniu.storage.Configuration configuration) {
        return new UploadManager(configuration);
    }
    @Bean
    public BucketManager bucketManager(Auth auth, com.qiniu.storage.Configuration configuration) {
        return new BucketManager(auth, configuration);
    }
}

