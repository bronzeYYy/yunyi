<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>找回密码</title>
<link rel="stylesheet" href="css&js/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="css&js/login.css" type="text/css" />
<script src="layer-v3.1.1/layer/layer.js"></script> 
<script src="css&js/jquery.min.js"></script>
<script src="css&js/bootstrap.min.js"></script>
</head>
<body  style="background-image:url(css&js/denglu.jpg)">
<div  id="login_container"  style="background:#E6E6FA;margin:80px auto;width:400px;height:350px">
	<div>
	    <span style="font-size:23px;color:#708090"><img src="image/timg.png" style="width:90px;height:90px"/> 
	              云 易，让问答变得很容易
	    </span>
	    <hr style="height:5px;border:none;border-top:5px groove skyblue;" />
	</div>	 
	<div style="width:300px;height:310px">
		<p style="font-size:20px;text-align:center;color:#708090">找回密码</p>
		<form action="find" method="post">
			<input type="text" class="form-control" placeholder="账号"  name="d_userid" />
			<br>
			<div>
			  <div  style="heighgt:50px;float:left">
			    <input type="text"  class="form-control" style="width:210px" placeholder="邮箱"  name="e-mail" />
			  </div>
			  <div style="heighgt:50px;float:left;margin-left:5px">
			    <button id="get_passwd" type="button" class="btn btn-info">找回密码</button>
			  </div>
			</div>
		</form>
			<hr style="height:1px;border:none;border-top:1px solid white;" />
	<div style="font-size:16px;text-align:center">
	    <br>
	    <span >
			密码已找回？&nbsp;
			<span style="cursor: pointer;"><a href="Denglu.jsp">立即登录</a></span>
		</span>
	</div>
	</div>

</div>
<script type="text/javascript">
	$('#get_passwd').on('click',function(){
		alert('密码已发送至您的邮箱！请注意查收');
	});
</script>
</body>
</html>