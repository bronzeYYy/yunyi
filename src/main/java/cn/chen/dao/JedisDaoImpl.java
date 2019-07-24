package cn.chen.dao;

import cn.chen.data.enums.CommitTypeEnum;
import cn.chen.data.exceptions.FrequencyException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.Transaction;

import java.util.List;
import java.util.Set;

@Component
public class JedisDaoImpl implements JedisDao {
    private JedisPool jedisPool;
    private static final String CODE = ":code";
    private static final String SEND = ":send";
    private static final int TIME = 30;
    @Autowired
    public JedisDaoImpl(JedisPool jedisPool) {
        this.jedisPool = jedisPool;
    }
    @Override
    public boolean setRandomCode(String email, String code) {
        Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
            if (jedis.exists(email + SEND)) {
                jedis.del(email + SEND);
            }
            if (jedis.exists(email + CODE)) {
                jedis.del(email + CODE);
            }
            Transaction transaction = jedis.multi();
            transaction.set(email + SEND, "1", "nx", "ex", TIME);
            transaction.set(email + CODE, code, "nx", "ex", TIME + 200);
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

    /*
     * create by: chen
     * description: 判断用户是否可以提交
     * create time: 13:22 2019-07-14
     * @param id: 用户id
     * @param commitTypeEnum: 提交类型
     */
    @Override
    public void checkCommit(int id, CommitTypeEnum commitTypeEnum) {
        Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
            if (jedis.get(id + ":" + commitTypeEnum.getCode()) != null) {
                throw new FrequencyException(CommitTypeEnum.COMMIT_UPLOAD);
            }
        } finally {
            close(jedis);
        }
    }

    @Override
    public boolean checkCommit(String email, CommitTypeEnum commitTypeEnum) {
        return false;
    }

    @Override
    public void checkEmailSendCode(String email) {
        Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
            if (jedis.get(email + JedisDaoImpl.SEND) != null) {
                throw new FrequencyException(CommitTypeEnum.SEND_RANDOM_CODE);
            }
        } finally {
            close(jedis);
        }

    }

    /*
     * create by: chen
     * description: 设置用户提交状态，有效期为两分钟，即两分钟内不能再次提问（回答）
     * create time: 13:23 2019-07-14
     * @param id: 用户id
     * @param commitTypeEnum: 提交类型
     * @return boolean: 设置结果
     */
    @Override
    public boolean setCommitState(int id, CommitTypeEnum commitTypeEnum) {
        Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
            return "OK".equals(jedis.set(id + ":" + commitTypeEnum.getCode(), "1", "nx", "ex", TIME));
        } finally {
            close(jedis);
        }
    }

    public void del(int id, CommitTypeEnum commitTypeEnum) {
        Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
            jedis.del(id + ":" + commitTypeEnum.getCode());
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

    @Override
    public void addNumByName(int id, String name) {
        Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
            Double s = jedis.zscore(id + "", name);
            if (s == null) {
                jedis.zadd(id + "", 1, name);
            } else {
                jedis.zincrby(id + "", s + 1, name);
            }
        } finally {
            close(jedis);
        }
    }

    @Override
    public Set<String> getNamesById(int id) {
        Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
            return jedis.zrevrange(id + "", 0, 2);
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
