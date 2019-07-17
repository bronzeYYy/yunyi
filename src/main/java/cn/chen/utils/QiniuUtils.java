package cn.chen.utils;

import cn.chen.config.QiNiuConfig;
import cn.chen.data.result.AbstractResult;
import cn.chen.data.result.MsgResult;
import com.qiniu.http.Response;
import com.qiniu.storage.BucketManager;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.FileInfo;
import com.qiniu.util.Auth;
import com.qiniu.util.StringMap;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Map;
import java.util.Set;


public final class QiniuUtils {
    public static final String AVATAR_SUFFIX = "avatar_";
    public static AbstractResult uploadAvatar(HttpServletRequest request, String fileName) {
        return uploadImg(request, fileName, true);
    }
    public static AbstractResult uploadImg(HttpServletRequest request, String fileName) {
        return uploadImg(request, fileName, false);
    }

    private static AbstractResult uploadImg(HttpServletRequest request, String fileName, boolean isAvatar) {
        WebApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(request.getServletContext());
        StandardServletMultipartResolver servletMultipartResolver = applicationContext.getBean(StandardServletMultipartResolver.class);
        UploadManager uploadManager = applicationContext.getBean(UploadManager.class);
        if (servletMultipartResolver.isMultipart(request)) {
            MultipartHttpServletRequest multipartHttpServletRequest = servletMultipartResolver.resolveMultipart(request);
            Map<String, MultipartFile> multipartFileMap = multipartHttpServletRequest.getFileMap();
            if (multipartFileMap.size() != 1) {
                // 上传的文件个数不为1
                return new MsgResult(-1, "请选择一个图片");
            }
            Set<String> strings = multipartFileMap.keySet();
            for (String string : strings) {
                MultipartFile multipartFile = multipartFileMap.get(string);
                if (!Utils.isImgFile(multipartFile)) {
                    // 不是图片
                    return new MsgResult(-1, "请选择图片");
                }
                try {
                    //String token = isAvatar ? getAvatarToken(request, fileName) : getToken(request);
                    Response response = uploadManager.put(multipartFile.getBytes(), fileName + "_" +
                            getUserAvatarNum(request, fileName), getResponseBodyToken(request));
                    System.out.println(response.bodyString());
                    if (response.isOK()) {
                        // 上传成功
                        return new MsgResult(0, "ok");
                    } else {
                        // 上传失败
                        break;
                        // return new MsgResult(-1, "上传失败");
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return new MsgResult(-1, "上传失败");
    }
    public static int getUserAvatarNum(HttpServletRequest request, String prefix) {
        BucketManager bucketManager = BeanUtils.getBean(request, BucketManager.class);
        BucketManager.FileListIterator iterator = bucketManager.createFileListIterator(QiNiuConfig.BUCKET, prefix);
        int max = -1;
        while (iterator.hasNext()) {
            FileInfo[] fileInfos = iterator.next();
            for (FileInfo fileInfo : fileInfos) {
                int i = Integer.valueOf(fileInfo.key.substring(prefix.length() + 1));
                if (i > max) {
                    max = i;
                }
            }
        }
        return max + 1;
    }

    private static String getToken(HttpServletRequest request) {
        Auth auth = BeanUtils.getBean(request, Auth.class);
        return auth.uploadToken(QiNiuConfig.BUCKET);
    }
    private static String getAvatarToken(HttpServletRequest request, String filename) {
        Auth auth = BeanUtils.getBean(request, Auth.class);
        return auth.uploadToken(QiNiuConfig.BUCKET, filename);
    }

    public static String getResponseBodyToken(HttpServletRequest request) {
        Auth auth = BeanUtils.getBean(request, Auth.class);
        StringMap stringMap = new StringMap();
        stringMap.put("returnBody", "{\"key\":\"$(key)\",\"hash\":\"$(hash)\",\"md5\":\"$(md5)\",\"size\":$(fsize)}");
        return auth.uploadToken(QiNiuConfig.BUCKET, null, 3600L, stringMap);
    }
}
