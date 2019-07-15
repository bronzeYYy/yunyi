<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>修改个人信息</title>
	<link rel="stylesheet" href="${hello}css&js/bootstrap.min.css" type="text/css" />
	<link rel="stylesheet" href="${hello}css&js/login.css" type="text/css" />
	<script src="${hello}layer-v3.1.1/layer/layer.js"></script>
	<script src="${hello}css&js/jquery.min.js"></script>
	<script src="${hello}css&js/bootstrap.min.js"></script>
</head>
<body style="background-image:url(${hello}images/denglu.jpg)">
<div id="regist_container" style="background:#E6E6FA;width:400px;height:460px">
	<div>
	    <span style="font-size:23px;color:#708090"><img src="${hello}image/timg.png" style="width:90px;height:90px"/> 
	              云 易，让问答变得很容易
	    </span>
		<hr style="height:5px;border:none;border-top:5px groove skyblue;" />
	</div>
	<div style="width:300px;height:310px">
		<p style="font-size:20px;text-align:center;color:#708090">修改用户信息</p>
		<form action="${path}/user/update" method="post">
			<input type="text" class="form-control" placeholder="新用户名"  name="userName" value="${user.userName}" />
			<input type="password" style="margin-top:10px" class="form-control" placeholder="新密码" name="userPassword" value="${user.userPassword}" />
			<input type="password" style="margin-top:10px" class="form-control" placeholder="确认密码" name="userPassword1" value="${user.userPassword}" />
			<input type="text" style="margin-top:10px" class="form-control" placeholder="新班级"  name="userClass" value="${user.userClass}" />
			<input type="submit" class="btn btn-success" style="width:300px;color:white;text-align:center;margin-top:10px" value="保存信息" />
		</form>
	</div>
</div>
</body>
</html>