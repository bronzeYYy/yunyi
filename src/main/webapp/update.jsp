<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>修改个人信息</title>
	<link rel="stylesheet" href="css&js/bootstrap.min.css" type="text/css" />
	<link rel="stylesheet" href="css&js/login.css" type="text/css" />
	<script src="layer-v3.1.1/layer/layer.js"></script>
	<script src="css&js/jquery.min.js"></script>
	<script src="css&js/bootstrap.min.js"></script>
</head>
<body style="background-image:url(${hello}images/denglu.jpg)">
<div style="background:#E6E6FA;width:400px;height:460px">
	<div>
	    <span style="font-size:23px;color:#708090"><img src="image/timg.png" style="width:90px;height:90px"/>
	              云 易，让问答变得很容易
	    </span>
		<hr style="height:5px;border:none;border-top:5px groove skyblue;" />
	</div>
	<div style="width:300px;height:310px">
		<p style="font-size:20px;text-align:center;color:#708090">修改用户信息</p>
		<%--<form action="/user/update" method="post" class="form-horizontal">
			<div class="form-group">
				<label class="control-label">用户名</label>
				<input type="text" style="width: 50%" class="form-control" placeholder="新用户名"  name="userName" value="${user.userName}" />
			</div>
			<input type="password" style="margin-top:10px" class="form-control" placeholder="新密码" name="userPassword" value="${user.userPassword}" />
			<input type="password" style="margin-top:10px" class="form-control" placeholder="确认密码" name="userPassword1" value="${user.userPassword}" />
			<input type="text" style="margin-top:10px" class="form-control" placeholder="新班级"  name="userClass" value="${user.userClass}" />
			<input type="submit" class="btn btn-success" style="width:300px;color:white;text-align:center;margin-top:10px" value="保存信息" />
		</form>--%>
		<form class="form text-left" action="/user/update" method="post">
			<div class="form-group">
				<small class="control-label">用户名</small>
				<input type="text" class="form-control" placeholder="Email" name="userName" value="${user.userName}">
			</div>
			<div class="form-group">
				<small class="control-label">新密码</small>
				<input type="password" class="form-control" placeholder="Email" name="userPassword" value="${user.userPassword}">
			</div>
			<div class="form-group">
				<small class="control-label">新班级</small>
				<input type="text" class="form-control" placeholder="Email" name="userClass" value="${user.userClass}">
			</div>
			<div class="form-group">
				<input type="submit" class="btn btn-block btn-primary" value="修改">
			</div>
		</form>
	</div>
</div>
</body>
</html>