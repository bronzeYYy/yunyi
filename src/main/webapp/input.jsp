<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<%-- <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>

<html>
<head>
<meta charset="utf-8">
    <title>发表问题</title>
    <!--引入wangEditor.css-->
    <link rel="stylesheet" type="text/css" href="dist/css/wangEditor.min.css">
    <style type="text/css">
        .container{
            width: 800px;
            height: auto;
            margin: 50px auto;
        }
        .container textarea{
            height: 400px;
        }
    </style>
     <script src="layer-v3.1.1/layer/layer.js"></script>
</head>
<body align="center">

<div class="container">
    <div><h1></h1></div>
    <div>
        <form action="function.php" method="post">

            <p>
                <strong>标题：</strong>
            </p>
            <p>
                <input type="text" name="title">
            </p>

            <p>
                <strong>内容：</strong>
            </p>
            <p>
                <textarea id="textarea1" name="content"></textarea>
            </p>
            <p>
                <input style="width:50px;height:30px;background-color: #666666; border-radius:3px; color:#FFFFFF" type="submit" value="提交">
            </p>
        </form>
    </div>
</div>


<script type="text/javascript" src="dist/js/lib/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="dist/js/wangEditor.min.js"></script>

<script type="text/javascript">
    var editor = new wangEditor('textarea1');
    // 上传图片（举例）
    editor.config.uploadImgUrl = '/upload.php';
    editor.config.uploadImgFileName = 'myFileName';
    editor.create();
</script>
   <script src="layer-v3.1.1/layer/layer.js"></script>
  
</body>
</html>
