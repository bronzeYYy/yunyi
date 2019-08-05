<%--@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" --%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<title>资料详情-${file.fileName}</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <link rel="stylesheet" href="${hello}css/bootstrap.css">
<%--   <script src="${hello}js/jquery-3.3.1.min.js"></script>--%>
   <script src="${hello}js/bootstrap.js"></script>
   <script src="${hello}layer-v3.1.1/layer/layer.js"></script>
   <script src="${hello}css&js/jquery.min.js"></script>
<%--	<script src="${hello}css&js/bootstrap.min.js"></script>--%>
	<script>
		$(document).ready(function() {
			//关闭
				var test = 1;
			var zan = 1;
			$("#getdown").on('click',function(){
				if(test === 1)
				{
					$(this).attr('src', '${hello}image/up.png');
					$("#dpinglun").show(500);
					test = 0;
				} else {
					$(this).attr('src', '${hello}image/down.png');
					$("#dpinglun").hide(500);
					test = 1;
				}
			});
		});
	</script>
<style>
body{
color:white;
}
a{ 
text-decoration:none; 

color:white; 
} 
    a:link {color: #FFFFFF;} /* 未访问的链接 */

    a:hover{color: #CCFFFF;} /*鼠标在链接上 */ 

</style>
</head>

<body style="background-color:#F0F0F0">
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" style="font-size:20px" href="${hello}index">云易</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">

                <li class="active"><a class="scroll" href="${hello}column" id="test">专栏</a></li>
                <li class="active"><a class="scroll" href="#" id = "yuan">发现</a></li>
                <li class="active"><a class="scroll" href="#lianxi">联系我们</a></li>
<%--                <li class="active"><a class="scroll" href="${hello}user">我的主页</a></li>--%>
            </ul>
					<ul class="nav navbar-nav pull-right">
						<li>
							<a style="color:#FFFFFF" href="${hello}user">${not empty user.userName ? user.userName:'登陆'}</a>
						</li>
					</ul>
        </div>
    </div>
</nav>
<div class="container">             <!--资料详情 -->
    <div style="margin-top:30px" class="row-md-12">
        
        <div class="col-md-12" >
					<div style="background-color: #DDDDDD;margin-top: 4%">
					 <h3 style="background-color: #cccccc;color: #000000;padding: 15px; border-top-left-radius: 5px; border-top-right-radius: 5px">
						 <img alt="图标" width="50px" src="${hello}images/ge/${file.fileType}.png">
						 &nbsp;${file.fileName}</h3>
					 <div style="font-size: 16px;color:#202020; padding: 15px">${file.fileDetail}</div>

						<p align=right style="padding: 15px">
							<span style="color: #000000; float: left">
								<span>下载：${file.downloadNum}</span>
								<span style="margin-left: 10px">大小：${file.fileSize}${file.sizeUnit}</span>
							</span>
							<img alt="上传者头像" title="上传者头像" width="16px" height="16px" style="color:#202020" src="${hello}user/avatar/${file.uploader.id}">
							<a style="color:	#505050" href="${hello}other/${file.uploader.id}">${file.uploader.userName}</a>
							&nbsp;
							<text style="color:#505050">${file.creationTime}</text>
						</p>
					</div>
					<div style="margin-bottom: 10px">
						<button class="btn btn-default" id="huida" type="submit">
							<span class="glyphicon glyphicon-pencil"></span>&nbsp;我来评价</button>
						<a class="btn btn-primary" href="${hello}file/download/${file.md5}" style="height: 34px; margin-left: 10px">
							<img width="20px" height="20px" id="download" src="${hello}image/download.png">
							下载</a>
					</div>
					<div id="editorDiv" style="color: #000000; margin-bottom: 10px; display: none">
						<div id="editor">

						</div>
						<div style="margin-top: 10px" >
							<button id="answer" class="btn btn-primary">回答</button>
							<span id="answer-cancel" style="margin-left: 10px; cursor: pointer">取消</span>
						</div>

					</div>
                                               <!-- 资料评价 -->
					<div style="height: 50px; padding: 15px; box-shadow: inset 1px -1px 1px #444, inset -1px 1px 1px #444;">
						<b><p style="color:#202020">评论列表
							<%--<c:choose>
								<c:when test="${not empty param.order}">
									<a style="margin-left: 5px; color: #646464;"
										 href="${hello}file/detail/${file.md5}?order=1">
										<small>按时间排序</small></a>
								</c:when>
								<c:otherwise>
									<a style="margin-left: 5px; color: #646464;"
										 href="${hello}file/detail/${file.md5}?order=2"><small>按热度排序</small></a>
								</c:otherwise>
							</c:choose>--%>
						</p></b>

					</div>
            <table>
							<c:set var="j" value="1" scope="page"/>
            <c:forEach var="i" items="${comment}">
      		<tr>
            <div class="row">
                    <br>
                    <div style="width:100px;height:100px;float:left;margin-top:20px;margin-left:30px">
						<p><img src="${hello}user/avatar/${i.commentUser.id}"style=" width:45px ;height:45px"></p>
						<p><a style="color:#202020" href="${hello}other/${file.uploader.id}">${i.commentUser.userName}</a></p>
					</div>
               
				<div style="width:500px;height:100px;float:left;margin-top:20px;margin-left:30px;">
					<div  style="color:#202020">${i.commentContent}</div>
				</div>
				<div style="width:100px;height:100px;float:left;margin-top:20px;margin-left:30px;">	
					<h4 style="color:#202020;line-height:80px">第${j}楼</h4>
				</div>
				<div style="color:#202020;width:300px;height:100px;float:left;margin-top:20px;margin-left:20px;">
					
				<font style="line-height:100px;color:#202020">${i.commentTime}</font>
					&emsp;&emsp;&emsp;
					<%--<img id="dianzan" src="${hello}image/dianzan1.png" style="cursor:pointer;height:25px;width:25px">
					&emsp;&emsp;&emsp;
					<a style="color:#202020" id="huifu" href="#"><span class="glyphicon glyphicon-comment"></span></a>--%>
					&emsp;&emsp;&emsp;
				</div>
            </div>
            </tr>
							<br><hr style=" height:2px;width:80%;border:none;border-top:2px dotted #808080;" />
							<c:set scope="page" value="${j + 1}" var="j" />
          </c:forEach>
          

          </table>
        </div>
       
    </div>
</div>

<div id="huifa" style="display:none">
	<textarea id="huidaneirong" value="" style="margin-top:20px;margin-left:20px;color:#000000;height: 100px;width:460px">
	</textarea><br><br><br><strong>
	<h3 id='huidafabiao' style="cursor:pointer;color: #000000;margin-top:20px;margin-left: 230px">提交</h3></strong>
</div>
<script type="text/javascript" src="${hello}js/wangEditor.min.js"></script>
<script>
	// 上传图片（举例）var E = window.wangEditor
	var E = window.wangEditor;
	var editor = new E('#editor');
	// 或者 var editor = new E( document.getElementById('editor') )
  let l;
  editor.customConfig.uploadImgHooks = {
      before: function (xhr, editor, files) {
          // 图片上传之前触发
          // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象，files 是选择的图片文件

          // 如果返回的结果是 {prevent: true, msg: 'xxxx'} 则表示用户放弃上传
          // return {
          //     prevent: true,
          //     msg: '放弃上传'
          // }
          l = layer.load();
      },

      error: function (xhr, editor) {
          // 图片上传出错时触发
          // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象
          layer.msg('上传错误');
          layer.close(l);
      },
      timeout: function (xhr, editor) {
          // 图片上传超时时触发
          // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象
          layer.msg('上传超时，请检查网络');
          layer.close(l);
      },
      fail: function (xhr, editor, result) {
          // 图片上传并返回结果，但图片插入错误时触发
          // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象，result 是服务器端返回的结果
          layer.msg(JSON.parse(xhr.responseText).msg);
          layer.close(l);
      },
      success: function (xhr, editor, result) {
          // 图片上传并返回结果，图片插入成功之后触发
          // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象，result 是服务器端返回的结果
          layer.close(l);
      },
  };
  editor.customConfig.customAlert = function (info) {
      // info 是需要提示的内容
  };
	editor.create();
	$('#answer').on('click', function () {
		$.ajax({
			url: '${hello}file/save',
			type: 'post',
			data: {'md5': '${file.md5}', 'commentContent': editor.txt.html()},
			success: function (data) {
				layer.msg(data.msg);
				if (data.code == 0) {
					window.location.reload();
				}
			}
		});
	});
	$('#answer-cancel').on('click', function () {
		$('#editorDiv').css('display', 'none');
	});
</script>

<script>
	$('#huida').on('click',function(){
		$('#editorDiv').css('display', 'block');
      //var content = "";
      /*layer.open({
          type:1,
          title:'回答界面',
          maxmin:true,
          shadeClose:true,
          area:['500px','300px'],
          content:$('#huifa')
      });*/
	
  });	
	/*$('#download').on('click',function(){
		
		 $.ajax({
	            url:  '${hello}download/${file.md5}',
	            type: 'GET'
	        });
	});*/

	$('#huifu').on('click',function(){
	    var content = "<textarea id='neirong' value='' style='background:transparent;" +
          "margin-top:20px;margin-left:20px;" +
          "color:#000000;height: 100px;width:460px'></textarea><br><br><br>" +
          "<strong><h3 id='fabiao' style='cursor:pointer;color: #000000;margin-top:20px;margin-left: 230px'>发表</h3></strong>";
		layer.open({
   			type:1,
   			title:'回复界面',
   			maxmin:true,
   			shadeClose:true,
   			area:['500px','300px'],
   			content:content
   		});

});

//var index = parent.layer.getFrameIndex(window.name);
$('#fabiao').on('click',function(){
	  var f1 = document.getElementById("neirong").value;
	 
      $.ajax({
    //      url:  'answer/save',
                  type: 'post',
                  data: {'answerContent':f1, 'answerId': 1},
              success:function(data) {
                  layer.msg(data.msg);
                  if(data.code === 0)
                  {
                      window.location.href=window.location.href;
                      window.location.reload();
                  }
          }
      })
});
    //var index = parent.layer.getFrameIndex(window.name);
  $('#huidafabiao').on('click',function(){
        var f1 = document.getElementById("huidaneirong").value;
        $.ajax({
            url:  '${hello}answer/save',
            type: 'post',
            data: {'answerContent':f1, 'ziliaoId': '${file.md5}'},
            success:function(data) {
                layer.msg(data.msg);
                if(data.code === 0)
                {
                    window.location.href=window.location.href;
                    window.location.reload();
                }
           	 }
        });
    });
    

</script>
</body>
</html>