<%@ page import="java.net.InetAddress" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
				 pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head> 
<meta charset="utf-8" /> 
<title>页面不存在</title>
	<%String path = request.getContextPath();%>
<style>

@font-face{
	font-family: "piliti";
	src: url("/<%=path%>fonts/das.ttf");
}
	.select {
		cursor: pointer;
		font-size:20px;
		color:#FFFFFF;
		border-style: none;
		border-radius: 20px;
		width: 10%;
		height:50px;
	}
</style> 
</head>
<body style="text-align:center;background-color: #E8E8E8">
<div>
	<img src="/<%=path%>images/6FHvzK.png" style="margin-left:80px;width: 25%;height:304px">
	<img src="/<%=path%>images/not.png" style="margin-bottom:70px;width: 10%;height:60px">
	<br>
	<a style="font-family: piliti;font-size: 50px">The page you are currently visiting does not exist</a><br>
</div>
<div style="margin-top:50px;" class="text-center">
	<button style="margin-right: 5%; background-color: #75AF74" class="select" onclick="window.location='/<%=path%>user'">个人中心</button>
	<button style="margin-left: 5%; background-color: #0074E8" class="select" onclick="window.location='/<%=path%>column'">返回首页</button>
</div>
</body>
</html> 