package cn.chen.dao;

import cn.chen.data.enums.CommitTypeEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.Transaction;

import java.util.List;

@Component
public class JedisDaoImpl implements JedisDao {
    private JedisPool jedisPool;
    private static final String CODE = ":code";
    private static final String SEND = ":send";
    @Autowired
    public JedisDaoImpl(JedisPool jedisPool) {
        this.jedisPool = jedisPool;
    }
    @Override
    public boolean setRandomCode(String email, String code) {
        Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
            Transaction transaction = jedis.multi();
            transaction.set(email + SEND, "1", "nx", "ex", 120);
            transaction.set(email + CODE, code, "nx", "ex", 120);
            List<Object> objects = transaction.exec();
            for (Object object : objects) {
                if (!"OK".equals(object)) {
                    return false;
                }
            }
            return true;
        } finally {
            close(jedis);
        }
    }

    @Override
    public boolean checkRandomCode(String email, String code) {
        Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
            return code.equals(jedis.get(email + JedisDaoImpl.CODE));
        } finally {
            close(jedis);
        }
    }

    @Override
    public boolean checkCommit(int id, CommitTypeEnum commitTypeEnum) {
        Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
            return jedis.get(id + commitTypeEnum.getType()) == null;
        } finally {
            close(jedis);
        }
    }

    @Override
    public boolean checkCommit(String email, CommitTypeEnum commitTypeEnum) {
        return false;
    }

    @Override
    public boolean checkEmailSendCode(String email) {
        Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
            if (jedis.get(email + JedisDaoImpl.SEND) == null) {
                return true;
            }
        } finally {
            close(jedis);
        }
        return false;
    }

    @Override
    public void setCommitState(int id, CommitTypeEnum commitTypeEnum) {
        Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
            jedis.set(id + commitTypeEnum.getType(), "1", "nx", "ex", 120);
        } finally {
            close(jedis);
        }
    }

    @Override
    public void delCode(String email) {
        Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
            jedis.del(email + SEND);
            jedis.del(email + CODE);
        } finally {
            close(jedis);
        }
    }

    private void close(Jedis jedis) {
        if (jedis != null) {
            jedis.close();
        }
    }
}
