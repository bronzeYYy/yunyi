<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<%-- <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>

<html>
<head>
    <meta charset="utf-8">
    <title>回复</title>
    <!--引入wangEditor.css-->
    <link rel="stylesheet" type="text/css" href="dist/css/wangEditor.min.css">
    <style type="text/css">
        .contain{
            width: 800px;
            height: auto;
            margin: 50px auto;
        }
        .contain textarea{
            height: 400px;
        }
    </style>
    <script src="layer-v3.1.1/layer/layer.js"></script>
</head>
<body align="center" style="height: 100%">

<div class="contain" style="margin-top: 100px">
    <div><h1></h1></div>
    <div>


            <p>
                <strong>评论内容：</strong>
            </p>
            <p>
                <textarea id="textarea1" name="content" value=""></textarea>
            </p>
            <p>
                <input id="tijiao" style="width:50px;height:30px;background-color: #666666; border-radius:3px; color:#FFFFFF" type="submit" value="提交">
            </p>
    </div>
</div>


<script type="text/javascript" src="dist/js/lib/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="dist/js/wangEditor.min.js"></script>

<script type="text/javascript">
    var editor = new wangEditor('textarea1');
    // 上传图片（举例）

    editor.config.uploadImgFileName = 'myFileName';
    editor.create();
</script>

<script src="layer-v3.1.1/layer/layer.js"></script>
<script>
    var index = parent.layer.getFrameIndex(window.name);

    $('#tijiao').on('click',function(){
        var f1 = document.getElementById("textarea1").value;
        $.ajax({
            url:  'answer/save',
            type: 'post',
            data: {'answerContent':f1, 'questionId': '${param.questionId}'},
            success:function(data) {
                layer.msg(data.msg);
                if(data.code === 0)
                {
                    parent.layer.close(index);

                }
            }
        })
    });

</script>

</body>
</html>
