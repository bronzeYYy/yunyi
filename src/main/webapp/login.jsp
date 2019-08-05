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
<%--	<script src="layer-v3.1.1/layer/layer.js"></script>--%>
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
		$(document).keydown(function (event) {
			if(event.keyCode === 13)
			{
				$("#tijiao").trigger('click');
			}
		});
	</script>
</head>
<body style="background-image:url(images/denglu.jpg)">

<!-- 登录 -->
<div id="login_container" style="background:#E6E6FA;margin:80px auto;width:400px;height:550px">
	<div onclick="window.location = 'index'">
	    <span style="font-size:23px;color:#708090"><img src="image/timg.png" style="width:90px;height:90px"/>
	              云 易，让问答变得很容易
	    </span>
		<hr style="height:5px;border:none;border-top:5px groove skyblue;" />
	</div>
	<div style="width:300px;height:300px">
		<p style="font-size:20px;text-align:center;color:#708090">用户登录</p>

		<input type="text" id="zhanghao" class="form-control" placeholder="学号或邮箱"  name="noOrEmail" value="" />
		<br>
		<input type="password" id="mima" style="margin-top:10px" class="form-control" placeholder="密码" name="password" value="" />
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
		<input type="submit" id="tijiao" class="btn btn-success" style="width:300px;color:white;text-align:center" value="登录" />

		<br>
		<span>
		<br>
		<a id="QQ" style="cursor:pointer">QQ登录</a>
		&emsp;&emsp;&emsp;&emsp;&emsp;<a id="weibo" style="cursor:pointer">微信登录</a>
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
		<input type="text" id="fzhanghao" class="form-control" placeholder="学号"  name="d_userid" value="" />
		<br>
		<div>
			<div  style="heighgt:50px;float:left">
				<input type="text" id="fyouxiang" class="form-control" style="width:210px" placeholder="邮箱"  name="e-mail"  value=""/>
			</div>
			<div style="heighgt:50px;float:left;margin-left:5px">
				<button id="get_passwd" type="button" class="btn btn-info">找回密码</button>
			</div>
		</div>
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
	<div style="width:300px;height:330px">
		<p style="font-size:20px;text-align:center;color:#708090">用户注册</p>

		<input type="text" id="rzhaohao" style="margin-top:10px" class="form-control" placeholder="学号" name="studentNo" value="" />
		<input type="text" id="rname" style="margin-top:10px" class="form-control" placeholder="昵称"  name="userName" value="" />
		<input type="password" id="rmima" style="margin-top:10px" class="form-control" placeholder="密码" name="userPassword"  value=""/>
		<input type="text" id="rbanji" style="margin-top:10px" class="form-control" placeholder="班级"  name="banji" value="" />
		<input type="text" id="userqq" class="form-control" style="margin-top:10px" placeholder="QQ，为了尽快解决您的问题，请正确填写"  name="userQq" value="" />
		<input type="text" id="ryouxiang" class="form-control" style="margin-top:10px" placeholder="邮箱"  name="email" value="" />
		<div>
			<div  style="heighgt:50px;float:left;margin-top:10px">
				<input type="text" id="ryanzheng"  class="form-control" style="width:195px" placeholder="验证码"  name="veri-code" value="" />
			</div>
			<div style="heighgt:50px;float:left;margin-left:5px">
				<input id="rgetma" type="submit" style="margin-top:10px" class="btn btn-info" value="获取验证码">
			</div>
		</div>

		<br><br>
		<input type="submit" id="rtijiao" class="btn btn-success" style="width:300px;color:white;text-align:center;margin-top:10px" value="注册" />

	</div>
	<hr style="margin-top:10px;height:1px;border:none;border-top:1px solid white;" />
	<div style="font-size:16px;text-align:center">
		<br>
		<span >
			已有账号？&nbsp;
			<span id='toLogin' style="color:red;cursor: pointer;">立即登录</span>
		</span>
	</div>
</div>
<%--<script src="${hello}layer-v3.1.1/layer/layer.js"></script>--%>
<script>
	$('#QQ').on('click',function(){
		layer.msg('人家还没得到授权呢~',function(){

		})
	});
	$('#weibo').on('click',function(){
		layer.msg('人家还没得到授权呢~',function(){

		})
	});
	$('#tijiao').on('click',function(){   //登录
		var d1 = document.getElementById("zhanghao").value;
		var d2 = document.getElementById("mima").value;
		$.ajax({
			url:  '${path}user/login',
			type: 'post',
			data: {'noOrEmail':d1,'password':d2},
			success:function(data) {
				if(data.code === 0)
				{
					window.location = '${hello}column';
				} else {
					layer.msg(data.msg);
				}
			}
		})
	});
	$('#rtijiao').on('click',function(){  //注册

		var r1 = document.getElementById("rzhaohao").value;
		var r2 = document.getElementById("rname").value;
		var r3 = document.getElementById("rmima").value;
		var r4 = document.getElementById("rbanji").value;
		var r5 = document.getElementById("ryouxiang").value;
		var r6 = document.getElementById("ryanzheng").value;
		var r7 = document.getElementById("userqq").value;
		$.ajax({
			url:  'user/register',
			type: 'post',
			data: {'studentNo':r1,'userName':r2,'userPassword':r3,'userClass':r4,'email':r5,'code':r6,'userQq':r7},
			success:function(data) {
				layer.msg(data.msg);
				if(data.code === 0)
				{
					window.location = '${hello}index';
				}
			}
		})
	});
	$('#rgetma').on('click',function(){  //发送验证码
		var l = layer.load();
		var m = document.getElementById("ryouxiang").value;
		$.ajax({
			url:  '${path}user/register/send',
			type: 'post',
			data: {'email':m},
			success:function(data) {
				layer.close(l);
				layer.msg(data.msg);
			},
			complete: function () {
				layer.close(l);
			}
		})
	});
	$('#get_passwd').on('click',function(){  //找回密码
		var f1 = document.getElementById("fzhanghao").value;
		var f2 = document.getElementById("fyouxiang").value;
		$.ajax({
			url:  'user/login/forget',
			type: 'post',
			data: {'email':f2,'studentNo':f1},
			success:function(data) {
				layer.msg(data.msg);
			}
		})
	});


</script>
</body>
</html>