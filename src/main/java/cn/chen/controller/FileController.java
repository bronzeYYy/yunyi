package cn.chen.controller;

import cn.chen.data.exceptions.NoSuchDataException;
import cn.chen.data.result.AbstractResult;
import cn.chen.data.result.MsgResult;
import cn.chen.model.File;
import cn.chen.model.User;
import cn.chen.service.FileDaoService;
import cn.chen.utils.QiniuUtils;
import cn.chen.utils.Utils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@RequestMapping(value = "/file", method = RequestMethod.POST)
public class FileController {
    private FileDaoService fileDaoService;
    // private UserDaoService userDaoService;
    private StandardServletMultipartResolver multipartResolver;
    public FileController(FileDaoService fileDaoService, StandardServletMultipartResolver multipartResolver) {
        this.fileDaoService = fileDaoService;
        this.multipartResolver = multipartResolver;
    }

    @RequestMapping("/upload")
    @ResponseBody
    public AbstractResult upload(@Valid File file, Errors errors, HttpServletRequest request, HttpSession session) {
        if (errors.hasErrors()) {
            Utils.dealErrors(errors);
        }
        if (!multipartResolver.isMultipart(request)) {
            return new MsgResult(-1, "请选择文件");
        }
        file.setUploader((User) session.getAttribute("user"));
        MsgResult msgResult = new MsgResult();
        if (fileDaoService.uploadFile(file, multipartResolver.resolveMultipart(request))) {
            msgResult.setCode(0);
            msgResult.setMsg("上传成功");
        } else {
            msgResult.setCode(-1);
            msgResult.setMsg("上传失败");
        }
        return msgResult;
    }

    @RequestMapping(value = "/download", method = RequestMethod.GET)
    public void download(String md5, HttpServletRequest request, HttpServletResponse response) {
        File file = fileDaoService.getFileByMD5(md5);
        if (file == null) {
            throw new NoSuchDataException();
        }
        QiniuUtils.download(request, response, file);
    }

    @RequestMapping("/detail/{md5}")
    public String detail(@PathVariable String md5, Model model) {
        model.addAttribute("file", fileDaoService.getFileByMD5(md5));
        return "";
    }
}
