package cn.chen.utils;

import cn.chen.config.QiNiuConfig;
import cn.chen.data.exceptions.YunyiException;
import cn.chen.data.result.AbstractResult;
import cn.chen.data.result.MsgResult;
import cn.chen.model.File;
import com.qiniu.http.Response;
import com.qiniu.storage.BucketManager;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.FileInfo;
import com.qiniu.util.Auth;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
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
        return uploadFile(request, fileName, isAvatar);
    }

    public static AbstractResult uploadFile(MultipartHttpServletRequest request, String fileName) {
        return uploadFile(request, fileName, false, false);
    }

    private static AbstractResult uploadFile(MultipartHttpServletRequest request, String fileName, boolean isImg, boolean isAvatar) {
        UploadManager uploadManager = BeanUtils.getBean(request, UploadManager.class);
        Map<String, MultipartFile> multipartFileMap = request.getFileMap();
        if (multipartFileMap.size() != 1) {
            // 上传的文件个数不为1
            return new MsgResult(-1, "请选择一个文件");
        }
        Set<String> strings = multipartFileMap.keySet();
        String token;
        if (isImg) {
            token = getToken(request);
        } else {
            token = getFileToken(request);
        }
        for (String string : strings) {
            MultipartFile multipartFile = multipartFileMap.get(string);
            if (isImg && !Utils.isImgFile(multipartFile)) {
                // 不是图片
                return new MsgResult(-1, "请选择图片");
            }
            try {
                //String token = isAvatar ? getAvatarToken(request, fileName) : getToken(request);
                if (isAvatar) {
                    fileName = fileName +
                            getUserAvatarNum(request, fileName);
                }
                Response response = uploadManager.put(multipartFile.getBytes(), fileName, token);
                //System.out.println(response.bodyString());
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
        return new MsgResult(-1, "上传失败");
    }

    private static AbstractResult uploadFile(HttpServletRequest request, String fileName, boolean isAvatar) {
        StandardServletMultipartResolver servletMultipartResolver = BeanUtils.getBean(request, StandardServletMultipartResolver.class);
        if (servletMultipartResolver.isMultipart(request)) {
            MultipartHttpServletRequest multipartHttpServletRequest = servletMultipartResolver.resolveMultipart(request);
            return uploadFile(multipartHttpServletRequest, fileName, true, isAvatar);
        }
        return new MsgResult(-1, "请选择文件");
    }
    public static int getUserAvatarNum(HttpServletRequest request, String prefix) {
        BucketManager bucketManager = BeanUtils.getBean(request, BucketManager.class);
        BucketManager.FileListIterator iterator = bucketManager.createFileListIterator(QiNiuConfig.BUCKET, prefix);
        int max = -1;
        while (iterator.hasNext()) {
            FileInfo[] fileInfos = iterator.next();
            for (FileInfo fileInfo : fileInfos) {
                int i = Integer.valueOf(fileInfo.key.substring(prefix.length()));
                if (i > max) {
                    max = i;
                }
            }
        }
        return max + 1;
    }

    public static void download(HttpServletRequest request, HttpServletResponse response, File file) {
        String downloadUrl = getDownloadUrl(request, file);
        download(downloadUrl, response, file.getFileName());
    }

    private static String getDownloadUrl(HttpServletRequest request, File file) {
        Auth auth = BeanUtils.getBean(request, Auth.class);
        return auth.privateDownloadUrl(QiNiuConfig.FILE_BUCKET_URL + file.getMd5()
                + file.getFileName().substring(file.getFileName().lastIndexOf('.')));
    }

    private static void download(String url, HttpServletResponse response, String filename) {
        if (!Utils.qiniuFileExists(url)) {
            throw new YunyiException("文件不存在");
        }
        try {
            response.addHeader("Content-Disposition", "attachment;filename="
                    + new String(filename.getBytes(StandardCharsets.UTF_8), StandardCharsets.ISO_8859_1));
            HttpURLConnection httpURLConnection = (HttpURLConnection) new URL(url).openConnection();
            httpURLConnection.connect();
//            InputStreamReader reader = new InputStreamReader(httpURLConnection.getInputStream(), StandardCharsets.UTF_8);
            InputStream reader = httpURLConnection.getInputStream();
            OutputStream printWriter = response.getOutputStream();
            int a;
            while ((a = reader.read()) != -1) {
                printWriter.write(a);
            }
            reader.close();
            printWriter.close();
        } catch (IOException e) {
            e.printStackTrace();
            throw new YunyiException("下载文件失败");
        }
    }

    private static String getToken(HttpServletRequest request) {
        Auth auth = BeanUtils.getBean(request, Auth.class);
        return auth.uploadToken(QiNiuConfig.BUCKET);
    }
    private static String getFileToken(HttpServletRequest request) {
        Auth auth = BeanUtils.getBean(request, Auth.class);
        return auth.uploadToken(QiNiuConfig.FILE_BUCKET);
    }
    /*private static String getAvatarToken(HttpServletRequest request, String filename) {
        Auth auth = BeanUtils.getBean(request, Auth.class);

        return auth.uploadToken(QiNiuConfig.BUCKET, filename);
    }

    public static String getResponseBodyToken(HttpServletRequest request) {
        Auth auth = BeanUtils.getBean(request, Auth.class);
        StringMap stringMap = new StringMap();
        stringMap.put("returnBody", "{\"key\":\"$(key)\",\"hash\":\"$(hash)\",\"md5\":\"$(md5)\",\"size\":$(fsize)}");
        return auth.uploadToken(QiNiuConfig.BUCKET, null, 3600L, stringMap);
    }*/
}
