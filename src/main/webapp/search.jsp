 <%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>搜索结果</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="css&js/bootstrap.min.css" type="text/css" />
<link href="css/style.css" type="text/css" rel="stylesheet" media="all">
    <script src="${hello}js/jquery-3.3.1.min.js"></script>
    <script src="${hello}layer-v3.1.1/layer/layer.js"></script> 
<script>
		$(document).ready(function() {

			$("#data").on('click',function(){
				$("#search").hide();
				$("#searchData").show();
			});
		
			$("#question").on('click',function(){
				$("#searchData").hide();
				$("#search").show();
			});
			
		});
	</script>
</head>
<body>
 <!-- banner -->
   	<!-- Header -->
		
		<!-- 导航栏 -->
<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" style="font-size:20px" href="#">云易</a>
		</div>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
			  <li class="active"><a class="scroll" href="${hello}column" id="test">专栏</a></li>
			  <li class="active"><a class="scroll" href="#" id = "yuan">发现</a></li>
			  <li class="active"><a class="scroll" href="#" id ="wenjian">联系我们</a></li>
			  <li class="active"><a class="scroll" href="#" id ="person">我的主页</a></li>
			</ul>
			<ul class="nav navbar-nav pull-right">
			  <li>
				<a id="Login_start_" href="Denglu.jsp" class="danger" style="background-color: #666666; border-radius:3px; color:#FFFFFF" onclick="window.location='Denglu.jsp'">登录</a>
			  </li>
			</ul>
		 </div>
	</div>
</nav>
<div style="margin-top:52px;background:#F5F5F5;height:105px">
	  <span>
	    <span  style="float:left;margin-top:30px;margin-left:100px">
		  <input type="text"  class="form-control" style="height:50px;width:700px" placeholder="(请输入关键字)找回答/查资料/找专业大牛"  name="search" />
		</span>
		<span style="float:left;margin-left:5px;margin-top:35px">
	      <input id="get_search" type="submit" class="btn btn-info" style="height:40px;width:50px" value="搜索">
		</span>
	  </span>
</div>
<c:choose>
<c:when test="${not empty param.type and param.type eq 1}">

<div id="search" style="background:#F5F5F5;height:45px">
	  <p style="font-size:16px">
	  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;<a style="cursor:pointer">问 答</a>
	  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<a id="data" href="${hello}search.jsp?type=2" style="cursor:pointer">资 料</a>
	  </p>
	  <hr style="margin-left:100px;margin-top:2px;width:34px;border: 1px solid #004B97" />
	  <hr style="margin-top:0px;border:1px solid #BEBEBE" />
	  <div id="left" style="width:55%;margin-left:50px;float:left">
  <table>
    <c:forEach var="i" items="${questions}">
			<tr>
				<div style="margin-top:20px">
				  <a href="${hello}question/detail/${i.id}"><h2 style="color:#000000">${i.questionName }</h2></a>
				  <br>
				  <h4 style="color:#989898">${i.questionContent }</h4><br>
				  <font style="size:10px;color:#989898">${i.questionerId.userName}&emsp;${i.creationTime}&emsp;回答数：？</font>
				</div>
				<hr>
				<div style="background:#F5F5F5;height:150px">
				  <br>
				  <font style="size:10px;color:#989898">${i.questionId.responderId.userName}&emsp;${i.questionId.answerTime}</font>
				  <br><br>
				  <font style="size:20px">${i.questionId.answerContent}</font>
				</div>
				<div style="background:#F5F5F5;height:50px">
				
				</div>
				<hr>
			</tr>
    </c:forEach>
  </table>
</div>
	  
	  
</div>
</c:when>
<c:otherwise>

<div id="searchData" style="background:#F5F5F5;height:45px;display:none">
	  <p style="font-size:16px">
	  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;<a id="question" href="${hello}search.jsp?type=1" style="cursor:pointer">问 答</a>
	  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<a   style="cursor:pointer">资 料</a>
	  
	  </p>
	  <hr style="margin-left:255px;margin-top:2px;width:34px;border: 1px solid #004B97" />
	  <hr style="margin-top:0px;border:1px solid #BEBEBE" />
	  <div id="right" style="width:55%;margin-left:50px;float:left">
  <table>
    <c:forEach var="i" items="${files}">
			<tr>
				<div style="margin-top:20px">
				  <a href="${hello}question/detail/${i.id}"><h2 style="color:#000000">{i.fileName }</h2></a>
				  <br>
				  <h4 style="color:#989898">${i.fileDetail}</h4><br>
				  <font style="size:10px;color:#989898">${i.uploader.userName}&emsp;${i.creationTime}&emsp;评论数：？</font>
				</div>
				<hr>
				<div style="background:#F5F5F5;height:150px">
				  <br>
				  <font style="size:10px;color:#989898">${i.questionId.responderId.userName}&emsp;${i.questionId.answerTime}</font>
				  <br><br>
				  <font style="size:20px">${i.questionId.answerContent}</font>
				</div>
				<div style="background:#F5F5F5;height:50px">
				
				</div>
				<hr>
			</tr>
    </c:forEach>
  </table>
</div>
	  
	  
</div>
</c:otherwise>
</c:choose>

</body>
</html>