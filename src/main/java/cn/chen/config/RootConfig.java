package cn.chen.config;

import org.apache.ibatis.datasource.pooled.PooledDataSource;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.mapper.MapperScannerConfigurer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import redis.clients.jedis.JedisPool;

import javax.sql.DataSource;
import java.io.File;
import java.io.IOException;
import java.util.Properties;

@Configuration
@ComponentScan(value = "cn.chen", excludeFilters = @ComponentScan.Filter(value = EnableWebMvc.class))
public class RootConfig {
    @Bean
    public DataSource dataSource(Properties properties) {
        PooledDataSource dataSource = new PooledDataSource();
        dataSource.setDriver(properties.getProperty("driver"));
        dataSource.setUrl(properties.getProperty("url"));
        dataSource.setUsername(properties.getProperty("user"));
        dataSource.setPassword(properties.getProperty("password"));
        return dataSource;
    }
    @Bean
    public SqlSessionFactoryBean sqlSessionFactoryBean(DataSource dataSource, Resource[] resources) {
        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
        sqlSessionFactoryBean.setDataSource(dataSource);
        sqlSessionFactoryBean.setMapperLocations(resources);
        sqlSessionFactoryBean.setConfigLocation(new ClassPathResource("mybatis-config.xml"));
        return sqlSessionFactoryBean;
    }
    @Bean
    public MapperScannerConfigurer mapperScannerConfigurer() {
        MapperScannerConfigurer mapperScannerConfigurer = new MapperScannerConfigurer();
        mapperScannerConfigurer.setSqlSessionFactoryBeanName("sqlSessionFactoryBean");
        mapperScannerConfigurer.setBasePackage("cn.chen.dao.mysql");
        return mapperScannerConfigurer;
    }
    @Bean
    public Properties properties() {
        Properties properties = new Properties();
        try {
            properties.load(new ClassPathResource("jdbc.properties").getInputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }
        return properties;
    }
    @Bean
    public Resource[] resources() {
        ClassPathResource resource = new ClassPathResource("mapper");
        try {
            File[] files = resource.getFile().listFiles();
            ClassPathResource[] classPathResources = new ClassPathResource[files.length];
            for (int i = 0; i < files.length; i++) {
                classPathResources[i] = new ClassPathResource("mapper/" + files[i].getName());
            }
            return classPathResources;
        } catch (IOException | NullPointerException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Bean
    public JedisPool jedisPool() {
        return new JedisPool("192.168.190.130");
    }

    @Bean
    public MailSender mailSender() {
        JavaMailSenderImpl javaMailSender = new JavaMailSenderImpl();
        javaMailSender.setHost("smtp.163.com");
        javaMailSender.setUsername("chensuwei0@163.com");
        javaMailSender.setPassword("123123");
        javaMailSender.setPort(465);
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", false);
        properties.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
        javaMailSender.setJavaMailProperties(properties);
        return javaMailSender;
    }
}
