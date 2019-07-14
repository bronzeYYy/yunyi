package cn.chen.controller;

import cn.chen.config.QiNiuConfig;
import cn.chen.data.result.AbstractResult;
import cn.chen.data.result.MsgResult;
import cn.chen.utils.Utils;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Map;
import java.util.Set;

@Controller
@RequestMapping("/question")
public class QuestionController {
    private UploadManager uploadManager;
    private Auth auth;
    private StandardServletMultipartResolver servletMultipartResolver;
    @Autowired
    public QuestionController(UploadManager uploadManager, Auth auth, StandardServletMultipartResolver multipartResolver) {
        this.uploadManager = uploadManager;
        this.auth = auth;
        this.servletMultipartResolver = multipartResolver;
    }
    @RequestMapping("/upload")
    @ResponseBody
    public AbstractResult uploadImg(HttpServletRequest request) {
        // 等待确认返回信息
        if (servletMultipartResolver.isMultipart(request)) {
            MultipartHttpServletRequest multipartHttpServletRequest = servletMultipartResolver.resolveMultipart(request);
            Map<String, MultipartFile> multipartFileMap = multipartHttpServletRequest.getFileMap();
            Set<String> strings = multipartFileMap.keySet();
            for (String string : strings) {
                MultipartFile multipartFile = multipartFileMap.get(string);
                if (Utils.isImgFile(multipartFile)) {
                    try {
                        uploadManager.put(multipartFile.getBytes(), multipartFile.getName(), getToken());
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
        return new MsgResult(0, "question");
    }
    private String getToken() {
        return auth.uploadToken(QiNiuConfig.BUCKET);
    }
    /*private String getFileName(int type, MultipartFile file) {
        if (type == 0) {
            return LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd_HH-mm-ss_")) + file.getOriginalFilename();
        }
        return file.getOriginalFilename();
    }*/
}
