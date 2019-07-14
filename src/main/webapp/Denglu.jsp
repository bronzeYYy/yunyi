<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户登录</title>
<link rel="stylesheet" href="css&js/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="css&js/login.css" type="text/css" />
<script src="layer-v3.1.1/layer/layer.js"></script> 
<script src="css&js/jquery.min.js"></script>
<script src="css&js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {
		//关闭
		//去 找回
		$("#fergot").on('click',function(){
			$("#login_container").hide(500);
			$("#find_container").show(500);
		});
		//找回后登陆
		$("#gologin").on('click',function(){
			$("#find_container").hide(500);
			$("#login_container").show(500);
		});
		//去 注册
		$("#toRegist").click(function(){
			$("#login_container").hide(500);
			$("#regist_container").show(500);
		});
		//去 登录
		$("#toLogin").click(function(){
			$("#regist_container").hide(500);
			$("#login_container").show(500);
		});
	});
</script>
</head>
<body style="background-image:url(images/denglu.jpg)">

<!-- 登录 -->
<div id="login_container" style="background:#E6E6FA;margin:80px auto;width:400px;height:550px">
	<div>
	    <span style="font-size:23px;color:#708090"><img src="image/timg.png" style="width:90px;height:90px"/> 
	              云 易，让问答变得很容易
	    </span>
	    <hr style="height:5px;border:none;border-top:5px groove skyblue;" />
	</div>	 
	<div style="width:300px;height:300px">
		<p style="font-size:20px;text-align:center;color:#708090">用户登录</p>
		<form action="Login" method="post">
			<input type="text" class="form-control" placeholder="账号"  name="d_userid" />
			<br>
			<input type="password" style="margin-top:10px" class="form-control" placeholder="密码" name="d_userpass" />
		<br><br>
		<span>
			<span>
			<input id="remember" type="checkbox">
			</span>
			<span style="color:#000000">
			记住密码&emsp;&emsp;&emsp;&emsp;
		    </span>
		</span>
		<span>
		&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<a style="cursor:pointer" id="fergot">忘记密码?</a>
		</span>
		<br><br>
		<input type="submit" class="btn btn-success" style="width:300px;color:white;text-align:center" value="登录" />
		</form>
		<br>
		<span>
		<a style="cursor:pointer">QQ登录</a>
		&emsp;&emsp;&emsp;&emsp;&emsp;<a style="cursor:pointer">微信登录</a>
		</span>
	</div>
	<hr style="height:1px;border:none;border-top:1px solid white;" />
	<div style="font-size:16px;text-align:center">
	    <br>
	    <span >
			还没有账号？&nbsp;
			<span id='toRegist' style="color:#888888;cursor: pointer;">立即注册</span>
		</span>
	</div>
</div>

<!-- 密码找回 -->

<div  id="find_container"  style="background:#E6E6FA;margin:80px auto;width:400px;height:350px;display:none">
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
			<span style="cursor: pointer;"><a id='gologin'>立即登录</a></span>
		</span>
	</div>
	</div>

</div>

<!-- 注册 -->

<div id="regist_container" style="background:#E6E6FA;margin:80px auto;width:400px;height:550px;display:none">
	<div>
	    <span style="font-size:23px;color:#708090"><img src="image/timg.png" style="width:90px;height:90px"/> 
	              云 易，让问答变得很容易
	    </span>
	    <hr style="height:5px;border:none;border-top:5px groove skyblue;" />
	</div>	 
	<div style="width:300px;height:310px">
		<p style="font-size:20px;text-align:center;color:#708090">用户注册</p>
		<form action="Login" method="post">
			<input type="text" class="form-control" placeholder="账号"  name="d_userid" />
			<input type="password" style="margin-top:10px" class="form-control" placeholder="密码" name="d_userpass" />
			<input type="password" style="margin-top:10px" class="form-control" placeholder="确认密码" name="d_userpass" />
			<br>
			<input type="text" class="form-control" placeholder="邮箱"  name="e-mail" />
			<br>
			<div>
			  <div  style="heighgt:50px;float:left">
			    <input type="text"  class="form-control" style="width:195px" placeholder="验证码"  name="veri-code" />
			  </div>
			  <div style="heighgt:50px;float:left;margin-left:5px">
			    <button id="get_code" type="button" class="btn btn-info">获取验证码</button>
			  </div>
			</div>
		    <br><br>
		    <input type="submit" class="btn btn-success" style="width:300px;color:white;text-align:center" value="注册" />
		</form>
	</div>
	<hr style="height:1px;border:none;border-top:1px solid white;" />
	<div style="font-size:16px;text-align:center">
	    <br>
	    <span >
			已有账号？&nbsp;
			<span id='toLogin' style="color:red;cursor: pointer;">立即登录</span>
		</span>
	</div>
</div>
</body>
</html>