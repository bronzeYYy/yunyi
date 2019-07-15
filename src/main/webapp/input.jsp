<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<%-- <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>

<html>
<head>
<meta charset="utf-8">
    <title>发表问题</title>
    <!--引入wangEditor.css-->
    <link rel="stylesheet" type="text/css" href="${hello}dist/css/wangEditor.min.css">
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

</head>
<body align="center">

<div class="container" style="align-content: center">
    <div style="align-items: center"><h1></h1></div>
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
                <textarea id="textarea1" value=""></textarea>
            </p>
            <p>
                <input id="fabu" style="width:50px;height:30px;background-color: #666666; border-radius:3px; color:#FFFFFF" type="submit" value="提交">
            </p>

    </div>
</div>


<script type="text/javascript" src="${hello}dist/js/lib/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${hello}dist/js/wangEditor.min.js"></script>

<script type="text/javascript">
    var editor = new wangEditor('textarea1');
    // 上传图片（举例）

    editor.config.uploadImgFileName = 'myFileName';
    editor.create();
</script>
   <script src="${hello}layer-v3.1.1/layer/layer.js"></script>
  <script>
      var index = parent.layer.getFrameIndex(window.name);
  	$('#fabu').on('click',function(){

  		var f1 = document.getElementById("title").value;
		var f2 = document.getElementById("textarea1").value;
		$.ajax({
			url:  'question/save',
			type: 'post',
			data: {'questionName':f1,'questionContent':f2},
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
