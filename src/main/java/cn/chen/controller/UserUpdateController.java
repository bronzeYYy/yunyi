package cn.chen.controller;


import cn.chen.data.result.AbstractResult;
import cn.chen.data.result.MsgResult;
import cn.chen.model.User;
import cn.chen.service.UserDaoService;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@RestController
public class UserUpdateController {
    private UserDaoService userDaoService;
    public UserUpdateController(UserDaoService userDaoService) {
        this.userDaoService = userDaoService;
    }
    @RequestMapping ("/update")
    public AbstractResult update(@Valid User user, Errors errors) {
        if (errors.hasErrors()) {
            return new MsgResult(1, errors.getAllErrors().get(0).getDefaultMessage());
        }
        MsgResult msgResult = new MsgResult();
        if (userDaoService.updateUser(user)) {
            msgResult.setCode(0);
            msgResult.setMsg("修改成功");
        } else {
            msgResult.setCode(-1);
            msgResult.setMsg("修改失败");
        }
        return msgResult;
    }
    @ModelAttribute
    public User getUser(HttpSession session) {
        User user = (User) session.getAttribute("user");
        return userDaoService.getUserById(user.getId());
    }
}
