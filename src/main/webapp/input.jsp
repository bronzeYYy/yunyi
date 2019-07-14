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
       

            <p>
                <strong>请简单描述你的问题：</strong>
            </p>
            <p>
                <input type="text" id="title" value="">
            </p>

            <p>
                <strong>说说问题的提出背景：</strong>
            </p>
            <p>
                <textarea id="content" value=""></textarea>
            </p>
            <p>
                <input id="fabu" style="width:50px;height:30px;background-color: #666666; border-radius:3px; color:#FFFFFF" type="submit" value="提交">
            </p>
       
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
  <script>
  	$('#fabu').on('click',function(){
  		var f1 = document.getElementById("title").value;
		var f2 = document.getElementById("content").value;
		$.ajax({
			url:  'question/save',
			type: 'post',
			data: {'questionName':f1,'questionContent':f2},
			success:function(data) {
				if(data.code)
					{
					layer.msg('提交成功');
						window.location('column.jsp');
					} else {
						layer.msg(data.msg);
					}
			}
		})
  	});
  
  </script>
</body>
</html>
