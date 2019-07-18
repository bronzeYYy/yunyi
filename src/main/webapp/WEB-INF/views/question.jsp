<%--@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" --%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>问题详情页</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <link rel="stylesheet" href="${hello}css/bootstrap.css">
   <script src="${hello}js/jquery-3.3.1.min.js"></script>
   <script src="${hello}js/bootstrap.js"></script>
   <script src="${hello}layer-v3.1.1/layer/layer.js"></script>
   <script src="${hello}css&js/jquery.min.js"></script>
	<script src="${hello}css&js/bootstrap.min.js"></script>
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
                <li class="active"><a class="scroll" href="${hello}user">我的主页</a></li>
            </ul>
            <ul class="nav navbar-nav pull-right">

            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <div style="margin-top:30px" class="row-md-12">
        
        <div class="col-md-12" >
					<br>
					 <p ><strong><h3 style="color:#202020">${Question.questionName}</h3></strong></p>
					 <p ><strong><h4 style="color:#303030">${Question.questionContent}</h4></strong></p>
					
			 <div class="row">
					<div class="col-md-2" >
					<p><br>
					<button style="color:#ffffff;background-color:#505050" id="huida" type="submit" class="btn btn-default"><span class="glyphicon glyphicon-pencil"></span>&nbsp;我来回答</button>
					</div>
					<div class="col-md-10 col-md-pull-1">
					<p align=right><br><br><br><br>
					<span style="color:#202020" class="glyphicon glyphicon-user"></span> <a style="color:	#505050" href="#">${Question.questioner.userName}</a>
					&nbsp;
					<text style="color:#505050">${Question.creationTime}</text>
					</p>
					</div>
			 </div>


			<br>
            <div class="col-md-12" style=" box-shadow: inset 1px -1px 1px #444, inset -1px 1px 1px #444;">
                    <h5><b><p style="color:#202020">评论列表</p></b></h5>
            </div>

            <table>
            <c:forEach var="i" items="${comment}">
      		<tr>
            <div class="row">
                    <br>
                    <div style="width:100px;height:100px;float:left;margin-top:20px;margin-left:30px">
						<p><img src="${hello}user/avatar/${i.answerUser.id}"style=" width:45px ;height:45px"></p>
						<p><a style="color:#202020" href="${hello}others.jsp">${i.answerUser.userName}</a></p>
					</div>
               
				<div style="width:400px;height:100px;float:left;margin-top:20px;margin-left:30px;">
					<h3  style="color:#202020">${i.answerContent}</h3>
				</div>
				<div style="width:100px;height:100px;float:left;margin-top:20px;margin-left:30px;">	
					<h4 style="color:#202020;line-height:80px">第?楼</h4>
				</div>
				<div style="color:#202020;width:300px;height:100px;float:left;margin-top:20px;margin-left:20px;">
					
				<font style="line-height:100px;color:#202020">${i.answerTime}</font>
					&emsp;&emsp;&emsp;
					<img id="dianzan" src="image/dianzan1.png" style="cursor:pointer;height:25px;width:25px">
					&emsp;&emsp;&emsp;
					<a style="color:#202020" id="huifu" href="#"><span class="glyphicon glyphicon-comment"></span></a>
					&emsp;&emsp;&emsp;
					<img id="getdown" src="image/down.png" style="cursor:pointer;height:25px;width:25px">
				</div>
            </div>
           <div id="dpinglun" style="display:none;background-color:#E0E0E0;margin-left:180px;width:70%;height:70px;">
           		<div style="width:50px;float:left">
           			 <img src="${hello}user/avatar/${i.answerUser.id}" style=" width:45px ;height:45px">
           			<br><a href="others.jsp" style="color:#202020">${i.answerUser.userName}</a>
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
          </c:forEach>
          
            <hr style=" height:2px;width:80%;border:none;border-top:2px dotted #808080;" />
          </table>
        </div>
       
    </div>
</div>

<div id="huifa" style="display:none">
	<textarea id="huidaneirong" value="" style="margin-top:20px;margin-left:20px;color:#000000;height: 100px;width:460px">
	</textarea><br><br><br><strong>
	<h3 id='huidafabiao' style="cursor:pointer;color: #000000;margin-top:20px;margin-left: 230px">提交</h3></strong>
</div>

<script>
	$('#huida').on('click',function(){
      //var content = "";
      layer.open({
          type:1,
          title:'回答界面',
          maxmin:true,
          shadeClose:true,
          area:['500px','300px'],
          content:$('#huifa')
      });

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
            data: {'answerContent':f1, 'questionId': ${Question.id}},
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
    
    $('dianzan').on('click',function(){
        $.ajax({
            url:  '${hello}answer/star',
            type: 'post',
            data: {'answerId':${i.answerId}},
            success:function(data) {
                layer.msg(data.msg);
                if(data.code === 0)
                {
                	$(this).attr('src', '${hello}image/dianzan2.png');
                    window.location.href=window.location.href;
                    window.location.reload();
                }
            }
        });
    		
    });
 	
  

</script>
</body>
</html>