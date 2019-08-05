<%--@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" --%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<title>问题详情-${Question.questionName}</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <link rel="stylesheet" href="${hello}css/bootstrap.css">
   <script src="${hello}js/jquery-3.3.1.min.js"></script>
   <script src="${hello}js/bootstrap.js"></script>
   <script src="${hello}layer-v3.1.1/layer/layer.js"></script>
<%--	<script src="${hello}css&js/bootstrap.min.js"></script>--%>
	<script>
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
		/*$(document).ready(function() {
			//关闭

		});*/
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

<body style="background-color:#F0F0F0; height: 100%">
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
                <li class="active"><a class="scroll" href="${hello}user">我的主页</a></li>
            </ul>
					<ul class="nav navbar-nav pull-right">
						<li>
							<a style="color:#FFFFFF" href="${hello}user">${not empty user.userName ? user.userName:'登陆'}</a>
						</li>
					</ul>
        </div>
    </div>
</nav>
<div class="container">
    <div style="margin-top:30px" class="row-md-12">
        
        <div class="col-md-12" >
					<br>
					 <p style="margin-top: 20px"><strong><h3 style="color:#202020">${Question.questionName}</h3></strong></p>
					<br>
					 <div style="color:#303030">${Question.questionContent}</div>
					<div>

						<button style="color:#ffffff;background-color:#505050" id="huida" type="submit" class="btn btn-default"><span class="glyphicon glyphicon-pencil"></span>&nbsp;我来回答</button>
					</div>
					<div>
						<p align=right>
							<span style="color:#202020"></span>
							<img alt="上传者头像" title="上传者头像" width="16px" height="16px" style="color:#202020" src="${hello}user/avatar/${Question.questioner.id}">
							<a style="color:	#505050" href="${hello}other/${Question.questioner.id}">${Question.questioner.userName}</a>
							&nbsp
							<text style="color:#505050">${Question.creationTime}</text>
						</p>
					</div>
					<div id="editorDiv" style="color: #000000; display: none">
						<div id="editor">

						</div>
						<div style="margin-top: 10px" >
							<button id="answer" class="btn btn-primary">回答</button>
							<span id="answer-cancel" style="margin-left: 10px; cursor: pointer">取消</span>
						</div>
					</div>
			<br>
            <div style="height: 50px; padding: 15px; box-shadow: inset 1px -1px 1px #444, inset -1px 1px 1px #444;">
							<b><p style="color:#202020">评论列表(${Question.commentNum})
								<c:choose>
									<c:when test="${not empty param.order}">
										<a style="margin-left: 5px; color: #646464;"
											 href="${hello}question/detail/${Question.id}">
											<small>按时间排序</small></a>
									</c:when>
									<c:otherwise>
										<a style="margin-left: 5px; color: #646464;"
															href="${hello}question/detail/${Question.id}?order=2"><small>按热度排序</small></a>
									</c:otherwise>
								</c:choose>
							</p></b>

            </div>

            <table>
							<c:set var="j" value="1" scope="page"/>
            <c:forEach var="i" items="${comment}">
      		<tr>
            <div class="row">
							<br>
							<div style="width:100px;height:100px;float:left;margin-top:20px;margin-left:30px">
								<p><img src="${hello}user/avatar/${i.answerUser.id}"style=" width:45px ;height:45px">
								</p>
								<p><a style="color:#202020" href="${hello}other/${i.answerUser.id}">${i.answerUser.userName}</a></p>
							</div>
							<div style="width:480px;float:left;margin-top:20px;margin-left:30px;">
								<div  style="color:#202020">${i.answerContent}</div>
							</div>
							<div style="width:100px;height:100px;float:left;margin-top:20px;margin-left:30px;">
								<h4 style="color:#202020;line-height:80px">第${j}楼</h4>
							</div>
							<div style="color:#202020;width:300px;height:100px;float:left;margin-top:20px;margin-left:20px;">
								<font style="line-height:100px;color:#202020">${i.answerTime}</font>
					&emsp;&emsp;&emsp;<span>
								<img onclick="star($(this), '${i.id}')" id="dianzan" src="${hello}image/dianzan1.png" style="cursor:pointer;height:25px;width:25px">
								<span id="likenum">${i.likenum}</span>
							</span>
<%--					&emsp;&emsp;&emsp;<a style="color:#202020" id="huifu"><span class="glyphicon glyphicon-comment"></span></a>--%>
<%--					&emsp;&emsp;&emsp;<img id="getdown" src="${hello}image/down.png" style="cursor:pointer;height:25px;width:25px">--%>
							</div>
						</div>
           <div id="dpinglun" style="display:none;background-color:#E0E0E0;margin-left:180px;width:70%;height:70px;">
           		<div style="width:50px;float:left">
           			 <img src="${hello}user/avatar/${i.answerUser.id}" style=" width:45px ;height:45px">
           			<br><a href="${hello}other/${i.answerUser.id}" style="color:#202020">${i.answerUser.userName}</a>
           		</div>
           		<div style="margin-left:50px;float:left;width:60%;height:70px;">
           			 <font style="line-height:80px;color:#202020">${i.answerTime}</font>
           		</div>
           		<div style="margin-left:50px;float:left;width:20%;height:70px">
           			 <font style="line-height:80px;color:#202020">${i.answerTime}</font>
           			&emsp;
					<a  style="color:#202020;cursor:pointer"id="doubleclick"><span class="glyphicon glyphicon-thumbs-up"></span></a><text></text>
           		</div>	
           </div>
            </tr>
							<hr style=" height:2px;width:80%;border:none;border-top:2px dotted #808080;" />
							<c:set scope="page" value="${j + 1}" var="j" />
          </c:forEach>
          </table>
        </div>
       
    </div>
</div>

<script type="text/javascript" src="${hello}js/wangEditor.min.js"></script>
<script>
	// 上传图片（举例）var E = window.wangEditor
	let E = window.wangEditor;
  let editor = new E('#editor');
  editor.customConfig.uploadImgServer = '${hello}user/upload';
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
	// 或者 var editor = new E( document.getElementById('editor') )
	editor.create();
	$('#answer').on('click', function () {
		$.ajax({
			url: '${hello}answer/save',
			type: 'post',
			data: {'questionId': ${Question.id}, 'answerContent': editor.txt.html()},
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
	$(document).ready(function () {

	$('#huida').on('click',function(){

		$('#editorDiv').css('display', 'block');
      /*var content = "<div id=\"huifa\">\n" +
					"\t<textarea id=\"huidaneirong\" style=\"margin-top:20px;margin-left:20px;color:#000000;height: 100px;width:460px\">\n" +
					"\t</textarea><br><br><br><strong>\n" +
					"\t<h3 id='huidafabiao' style=\"cursor:pointer;color: #000000;margin-top:20px;margin-left: 230px\">提交</h3></strong>\n" +
					"</div>";
      layer.open({
          type:1,
          title:'回答界面',
          maxmin:true,
          shadeClose:true,
          area:['500px','300px'],
          content:content
      });*/

  });

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
                  data: {'answerContent':f1, 'questionId': ${Question.id}},
              		success:function(data) {
                  layer.msg(data.msg);
                  if(data.code === 0)
                  {
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
            data: {'answerContent':f1, 'questionId': ${Question.id}},
            success:function(data) {
                layer.msg(data.msg);
                if(data.code === 0)
                {
                    window.location.reload();
                }
            }
        });
    });
	});
	var star = function star (img, id) {
		var n = img.next();

		$.ajax({
			url:  '${hello}answer/star',
			type: 'post',
			data: {'answerId':id},
			success:function(data) {
				layer.msg(data.msg);
				if(data.code === 0)
				{
					img.attr('src', '${hello}image/dianzan2.png');
					n.text(parseInt(n.text()) + 1);
				}
			}
		});
	};

</script>
</body>
</html>