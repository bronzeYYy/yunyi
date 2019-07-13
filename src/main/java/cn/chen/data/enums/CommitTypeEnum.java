package cn.chen.data.enums;

public enum CommitTypeEnum {
    SEND_RANDOM_CODE(1, "发送验证码"),
    COMMIT_QUESTION(2, "提问"),
    COMMIT_ANSWER(3, "回答");
    private int code;
    private String type;
    CommitTypeEnum(int code, String type) {
        this.code = code;
        this.type = type;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
