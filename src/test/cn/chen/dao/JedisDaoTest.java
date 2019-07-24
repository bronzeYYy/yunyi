package cn.chen.dao;

import cn.chen.config.RootConfig;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import redis.clients.jedis.Jedis;

public class JedisDaoTest {
    static AnnotationConfigApplicationContext annotationConfigApplicationContext;
    static {
        annotationConfigApplicationContext = new AnnotationConfigApplicationContext(RootConfig.class);
    }
    @Test
    public void test() {
        //JedisDao jedisDao = annotationConfigApplicationContext.getBean(JedisDao.class);
        /*jedisDao.addNumByName(1, "计算机系");
        jedisDao.addNumByName(1, "计算机系");
        jedisDao.addNumByName(1, "农牧");
        jedisDao.addNumByName(1, "农牧");
        jedisDao.addNumByName(1, "农牧");*/
        Jedis jedis = new Jedis("192.168.190.130");
        System.out.println(jedis.set("1", "3", "nx|xx", "ex", 122));
        jedis.close();
    }
}
