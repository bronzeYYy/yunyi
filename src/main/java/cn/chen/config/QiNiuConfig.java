package cn.chen.config;

import com.qiniu.common.Zone;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class QiNiuConfig {
    private static final String AK = "R7TaJghShAbqOFxRY4uvxAvAwaDshaXT1msvW2Nx";
    private static final String SK = "ixYbz5nAdt7C0sNJEONG5CQN4dNz4DioPnnetWr9";

    public static final String BUCKET = "yunyi_img";



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
}

