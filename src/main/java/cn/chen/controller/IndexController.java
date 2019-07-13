package cn.chen.controller;

import cn.chen.data.enums.CommitTypeEnum;
import cn.chen.data.exceptions.FrequencyException;
import cn.chen.data.result.AbstractResult;
import cn.chen.data.result.MsgResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class IndexController {
    @RequestMapping("/user")
    public AbstractResult getUser() {

        return new MsgResult(1, "失败");
    }
    @RequestMapping("/test")
    public AbstractResult testException() {
        throw new FrequencyException(CommitTypeEnum.SEND_RANDOM_CODE);
        //return null;
    }
}
