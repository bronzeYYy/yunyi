package cn.chen.data.exceptions;
import cn.chen.data.enums.CommitTypeEnum;

public class FrequencyException extends YunyiException {
    private static final String msg = "频繁!";
    public FrequencyException(CommitTypeEnum commitTypeEnum) {
        super(commitTypeEnum.getType() + msg);
    }
}
