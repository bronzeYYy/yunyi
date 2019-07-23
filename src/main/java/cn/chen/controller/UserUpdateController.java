package cn.chen.controller;


import cn.chen.data.exceptions.IllegalParamException;
import cn.chen.data.result.AbstractResult;
import cn.chen.data.result.MsgResult;
import cn.chen.model.User;
import cn.chen.service.UserDaoService;
import cn.chen.utils.QiniuUtils;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

// 用户更新的操作
@RestController
@RequestMapping("/user")
public class UserUpdateController {
    private UserDaoService userDaoService;
    public UserUpdateController(UserDaoService userDaoService) {
        this.userDaoService = userDaoService;
    }

    // 更新用户信息
    @RequestMapping ("/update")
    public AbstractResult update(@Valid User user, Errors errors, HttpSession session) {
        if (errors.hasErrors()) {
            return new MsgResult(-1, errors.getAllErrors().get(0).getDefaultMessage());
        }
        if (user.getId() != 0 && user.getId() != ((User) session.getAttribute("user")).getId()) {
            throw new IllegalParamException("用户想做坏事");
        }
        MsgResult msgResult = new MsgResult();
        if (userDaoService.updateUser(user)) {
            msgResult.setCode(0);
            msgResult.setMsg("修改成功");
            session.setAttribute("user", user);
        } else {
            msgResult.setCode(-1);
            msgResult.setMsg("修改失败");
        }
        return msgResult;
    }

    // 更改用户头像
    @RequestMapping("/update/avatar")
    public AbstractResult updateAvatar(HttpServletRequest request, HttpSession session) {
        User user = (User) session.getAttribute("user");
        return QiniuUtils.uploadAvatar(request, "avatar_" + user.getId() + "_");
    }

    @ModelAttribute
    public User getUser(HttpSession session) {
        User user = (User) session.getAttribute("user");
        return userDaoService.getUserById(user.getId());
    }
}
