<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
				 pageEncoding="utf-8"%>
<!DOCTYPE html>
<%-- <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>

<html>
<head>
	<meta charset="utf-8">
	<title>问答专栏</title>
	<link rel="stylesheet" href="${hello}css&js/bootstrap.min.css">
	<link rel="stylesheet" href="${hello}css&js/login.css" />
	<link href="${hello}css&js/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<link href="${hello}css&js/scrollbar.css" rel="stylesheet" type="text/css" media="all" />
	<link href="${hello}css&js/ddsmoothmenu.css" rel="stylesheet" type="text/css" media="all" />
	<script  src="${hello}css&js/jquery.min.js"></script>

	<link href="${hello}css&js/style.css" rel="stylesheet" type="text/css" media="all" />
	<link href="${hello}css/style2.css" rel="stylesheet" type="text/css" media="all" />
	<script src="${hello}layer-v3.1.1/layer/layer.js"></script>

	<style type="text/css">

		.conta {
			height: 35px;
			width: 200px;
		}
		.parent {
			position: relative;
		}
		.search {
			width: 200px;
			height: 35px;
			border-radius: 18px;
			outline: none;
			border: 1px solid #ccc;
			padding-left: 20px;
			position: absolute;
		}
		.btn {
			height: 35px;
			margin-left:200px;
			margin-top:10px;

			border:1px;
			width: 35px;
			position: absolute;
			cursor: pointer;

		}

	</style>
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	<!---->
	<link href='http://fonts.useso.com/css?family=Raleway:400,200,100,300,500,600,700,800,900' rel='stylesheet' type='text/css'>
	<link href='http://fonts.useso.com/css?family=Open+Sans+Condensed:300,300italic,700' rel='stylesheet' type='text/css'>

	<link href="${hello}css&js/styles.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="${hello}css&js/component.css" />

	<link href="${hello}css&js/animate.min.css" rel="stylesheet">
	<script src="${hello}css&js/wow.min.js"></script>
	<script>
		new WOW().init();
	</script>
	<!-- //animation-effect -->

	<script src="${hello}css&js/jquery.min.js"></script>
	<script src="${hello}css&js/bootstrap.min.js"></script>
</head>
<body style="background-color:#101010;background-repeat :no-repeat;background-position: right bottom;background-attachment:fixed;">
<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="${hello}index">返回首页</a>
		</div>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li class="active"><a class="scroll" href="#zhuye" id="test">推荐</a></li>
				<li class="active"><a class="scroll" href="gaishu.jsp" id = "yuan">高数</a></li>
				<li class="active"><a class="scroll" href="jisuanji.jsp" id ="boke">计算机</a></li>
				<li class="active"><a class="scroll" href="yixue.jsp" id="moban">医学</a></li>
				<li class="active"><a class="scroll" href="tiyu.jsp" >体育</a></li>
				<li class="active"><a class="scroll" href="zhishi.jsp" >校园知识</a></li>
				<li class="active"><a class="scroll" href="zepai.jsp" >杂牌儿</a></li>
				<li class="active"><a class="scroll" href="lianxi.jsp" >联系我们</a></li>


				<li>

					<div class="conta">
						<form action="" class="parent">
							<input type="text" class="search" placeholder="搜索">
							<input style="font-size:20px;font-color:#ffffff" type="submit" name="" id="" class="btn" value="☬">
						</form>
					</div>

				</li>

			</ul>
			<ul class="nav navbar-nav pull-right">
				<li>
					<a style="margin-top:20px;color:#FFFFFF" href="${hello}user"><c:if test="${not empty user}">
						${user.userName}
					</c:if> </a>
				</li>
			</ul>
		</div>
	</div>
</nav>
<div id="zhuye" class="header" style="background-image :url(${hello}../../image/beijing.jpg);background-repeat:no-repeat; height:100%; width:100%;"  id="shouye">
	<div class="container">
		<div class="nav-icon">
		</div>
		<div class="clearfix"></div>
	</div>
	-->
	<!-- start search-->
	<div class="banner">
		<h4 class="animated wow fadeInTop">云易校园知识问答平台</h4>
		<br />
		<label></label>
	</div>

</div>


<div id="main" style="width:100%;">

	<div class="footer_grids" style="text-align:center;margin-left:380px">
		<div class="col-md-8 footer_grid_right" >


			<input  type="button" id="iwant" value="我要提问">

		</div>
		<div class="clearfix"> </div>
	</div>
	<div id="left" style="width:55%;margin-left:50px;float:left">
		<h2 style="color:#fff;margin-top:50px">问答专栏</h2>
			<hr>
			<table>
				<c:forEach var="i" items="${questions}">
					<tr>
						<div style="margin-top:20px">
							<font style="size:20px;color:#989898;">${i.creationTime }</font>
							<a href="${hello}question/detail/${i.id}"><h3 style="color:#B8B8B8">问题${i.questionName }</h3></a>
							<br><h4 style="color:#ffffff">${i.questionContent }</h4><br>
							<p style="color:#ffffff">赞同数 &emsp;评论数</p>
							<hr>
							<br>
						</div>
					</tr>
				</c:forEach>
			</table>
	</div>
	<div id="right" style="width:35%;margin-left:30px;float:left;text-align:center">
		<h3 style="color:#fff;margin-top:50px">资料专栏</h2>
			<hr>

			<c:forEach var="i" items="${ziliao}">

			<div style="bgcolor:#F00000">
				<h2>${i.questionName }</h2><h4>${i.creationTime }</h4>
				<p><h4>${i.questionContent }</h4></p>
			</div>

			</c:forEach>


	</div>
</div>



<div class="footer_top_agileits">

	<div style=" float:left;margin-left:880px;width:35%" align="center">
		<hr>
		<a style="margin-top:50px;color:#ffffff;cursor:pointer">侵权举报 网上有害信息举报专区</a><p style="margin-top:10px"></p>
		<a style="color:#ffffff;cursor:pointer">违法和不良信息举报：15500545625</a><p style="margin-top:10px"></p>
		<a style="color:#ffffff;cursor:pointer">色情信息举报专区</a><p style="margin-top:10px"></p>
		<a style="color:#ffffff;cursor:pointer">证照中心</a><p style="margin-top:10px"></p>
		<a style="color:#ffffff;cursor:pointer">联系我们 @云易校园知识问答平台</a><p style="margin-top:10px"></p>

	</div>
</div>

<script type="text/javascript" src="${hello}css&js/move-top.js"></script>
<script type="text/javascript" src="${hello}css&js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
	$('#iwant').on('click',function(){
		layer.open({
			type:2,
			title:'提交问题',
			maxmin:true,
			shadeClose:true,
			area:['1000px','700px'],
			content:'input.jsp'
		});

	});
</script>

</body>
</html>