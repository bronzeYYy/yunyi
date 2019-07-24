package cn.chen.controller;

import cn.chen.dao.JedisDao;
import cn.chen.data.enums.CommitTypeEnum;
import cn.chen.data.exceptions.NoSuchDataException;
import cn.chen.data.exceptions.YunyiException;
import cn.chen.data.result.AbstractResult;
import cn.chen.data.result.MsgResult;
import cn.chen.model.*;
import cn.chen.service.CommentDaoService;
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
    private CommentDaoService commentDaoService;
    private JedisDao jedisDao;
    // private UserDaoService userDaoService;
    private StandardServletMultipartResolver multipartResolver;
    public FileController(FileDaoService fileDaoService, StandardServletMultipartResolver multipartResolver, JedisDao jedisDao,
                          CommentDaoService commentDaoService) {
        this.fileDaoService = fileDaoService;
        this.multipartResolver = multipartResolver;
        this.jedisDao = jedisDao;
        this.commentDaoService = commentDaoService;
    }


    @RequestMapping("/upload") // 文件上传
    @ResponseBody
    public AbstractResult upload(@Valid File file, Errors errors, HttpServletRequest request, HttpSession session) {
        if (errors.hasErrors()) {
            Utils.dealErrors(errors);
        }
        if (!multipartResolver.isMultipart(request)) {
            return new MsgResult(-1, "请选择文件");
        }
        User user = (User) session.getAttribute("user");
        jedisDao.checkCommit(user.getId(), CommitTypeEnum.COMMIT_UPLOAD); // 检测是否上传频繁
        file.setUploader(user);
        MsgResult msgResult = new MsgResult();
        if (fileDaoService.uploadFile(file, multipartResolver.resolveMultipart(request))) {
            msgResult.setCode(0);
            msgResult.setMsg("上传成功");
            jedisDao.setCommitState(user.getId(), CommitTypeEnum.COMMIT_UPLOAD);
            user.setUploadNumber(user.getUploadNumber() + 1);
            session.setAttribute("user", user);
        } else {
            msgResult.setCode(-1);
            msgResult.setMsg("上传失败");
        }
        return msgResult;
    }

    // 通过文件的md5下载文件给客户端
    @RequestMapping(value = "/download/{md5}", method = RequestMethod.GET)
    public void download(@PathVariable String md5, HttpServletRequest request, HttpServletResponse response) {
        File file = fileDaoService.getFileByMD5(md5);
        if (file == null) {
            throw new NoSuchDataException();
        }
        try {
            QiniuUtils.download(request, response, file);
            fileDaoService.upDownloadNumByMD5(md5);
        } catch (IndexOutOfBoundsException e) {
            e.printStackTrace();
            throw new YunyiException("文件有点问题");
        }
    }


    @RequestMapping("/save") // 评论文件
    @ResponseBody
    public AbstractResult save(@Valid Comment comment, Errors errors, HttpSession session, String md5) {
        if (errors.hasErrors()) {
            Utils.dealErrors(errors);
        }
        comment.setCommentUser((User) session.getAttribute("user"));
        File file = new File();
        file.setMd5(md5);
        comment.setFile(file);
        MsgResult msgResult = new MsgResult();
        if (commentDaoService.save(comment)) {
            msgResult.setCode(0);
            msgResult.setMsg("回复成功");
        } else {
            msgResult.setCode(-1);
            msgResult.setMsg("回复失败");
        }
        return msgResult;
    }


    // 根据MD5获取文件的具体信息，添加数据并返回具体的视图
    @RequestMapping(value = "/detail/{md5}", method = RequestMethod.GET)
    public String detail(@PathVariable String md5, Model model) {
        File file = fileDaoService.getFileByMD5(md5);
        if (file == null) {
            throw new NoSuchDataException();
        }
        model.addAttribute("file", file);
        model.addAttribute("comment", commentDaoService.getCommentsByFileMD5(md5));
        model.addAttribute("hello", "../../");
        return "ziliao";
    }
}
