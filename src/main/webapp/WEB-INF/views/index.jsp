<%--@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" --%>
<%@ page language="java" contentType="text/html; charset=utf-8"
				 pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<title>云易知识问答平台</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="" />
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	<!-- Custom Theme files -->
	<link href="${hello}css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
	<link href="${hello}css/style.css" type="text/css" rel="stylesheet" media="all">
	<link href="${hello}css/font-awesome.css" rel="stylesheet"> <!-- font-awesome icons -->
	<link rel="stylesheet" href="${hello}css/owl.carousel.css" type="text/css" media="all" />
	<link rel="stylesheet" href="${hello}css&js/bootstrap.min.css">
	<link rel="stylesheet" href="${hello}css&js/login.css" />
	<link href="${hello}css&js/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<script  src="${hello}css&js/jquery.min.js"></script>


	<link href="${hello}css&js/style.css" rel="stylesheet" type="text/css" media="all" />
	<link href='http://fonts.useso.com/css?family=Raleway:400,200,100,300,500,600,700,800,900' rel='stylesheet' type='text/css'>
	<link href='http://fonts.useso.com/css?family=Open+Sans+Condensed:300,300italic,700' rel='stylesheet' type='text/css'>


	<link href="${hello}css&js/styles.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="${hello}css&js/component.css" />

	<link href="${hello}css&js/animate.min.css" rel="stylesheet">
	<!-- //Custom Theme files -->
	<!-- js -->
	<script src="${hello}js/jquery-2.2.3.min.js"></script>
	<!-- //js -->
	<!-- web-fonts -->
	<link href="http://fonts.googleapis.com/css?family=Montserrat:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	<link href="http://fonts.googleapis.com/css?family=Roboto+Condensed:300,300i,400,400i,700" rel="stylesheet">

<script src="${hello}css&js/jquery.min.js"></script>
<script>
		$(document).ready(function() {
			//关闭
			//去 找回
			$("#goziliao").on('click',function(){
				$("#wenda").hide(0);
				$("#ziliao").show(00);
			});
			//找回后登陆
			$("#gowenda").on('click',function(){
				$("#ziliao").hide(00);
				$("#wenda").show(00);
			});
		
		});
	</script>

	<!-- //web-fonts -->
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
				<li class="active"><a class="scroll" href="#lianxi">联系我们</a></li>
				<li class="active"><a class="scroll" href="${hello}user">我的主页</a></li>
				
				<li class="active"><a class="scroll" href="${hello}user"><c:if test="${param.type eq 2}">${param.type}页</c:if></a></li>
			</ul>
			<ul class="nav navbar-nav pull-right">
				<li>

						<c:choose>
							<c:when test="${not empty user}">
								<a class="danger" style="cursor:pointer;background-color: #666666; border-radius:3px; color:#FFFFFF" href="${hello}user">${user.userName}</a>
							</c:when>
							<c:otherwise>
								<a id="Login_start_" class="danger" style="cursor:pointer;background-color: #666666; border-radius:3px; color:#FFFFFF" href="${hello}login.jsp">登录</a>
							</c:otherwise>
						</c:choose>

				</li>
			</ul>
		</div>
	</div>
</nav>
<!-- //Navigation -->

<!-- banner-slider -->
 <!-- 
<div class="w3l_banner_info">
	<div class="slider">
		<div class="callbacks_container">
			<ul class="rslides" id="slider3">
				<li>
					<div class="slider-img">
						<img src="${hello}image/bj1.jpg"class="img-responsive" alt="impetus">
					</div>
					<div class="slider_banner_info">
					</div>

				</li>
				<li>
					<div class="slider-img">
						<img src="${hello}image/bj2.jpg" class="img-responsive" alt="impetus">
					</div>
					<div class="slider_banner_info">

					</div>

				</li>
				<li>
					<div class="slider-img">
						<img src="${hello}image/bj3.jpg" class="img-responsive" alt="impetus">
					</div>
					<div class="slider_banner_info">

					</div>

				</li>
				<li>
					<div class="slider-img">
						<img src="${hello}image/bj4.jpg" class="img-responsive" alt="impetus">
					</div>
					<div class="slider_banner_info">

					</div>
				</li>
				<li>
					<div class="slider-img">
						<img src="${hello}image/bj5.jpg" class="img-responsive" alt="impetus">
					</div>
					<div class="slider_banner_info">
					</div>
				</li>
				<li>
					<div class="slider-img">
						<img src="${hello}image/bj6.jpg" class="img-responsive" alt="impetus">
					</div>
					<div class="slider_banner_info">

					</div>

				</li>
			</ul>
		</div>
	</div>
</div>

-->
<div class="clearfix"></div>

<!-- //banner-slider -->

<!-- //Header -->

<!--//banner-->
<!--about -->

<!-- footer -->

<div style="width:100%;background-color:#F0F0F0">
<c:choose> 
<c:when test="${not empty param.type and param.type eq 1 }">
<div class="container" id="wenda">
		<div class="footer_grids">
			<div class="col-md-8 footer_grid_right">

				<form action="#" method="post">
					<input type="email" name="Email" placeholder="搜索" required="">
					<input type="submit" value="Submit">
				</form>
			</div>
			<div class="clearfix"> </div>
		</div>
	

		<div class="col-md-4 footer_grid" style="margin-top:60px;width:70%;float:left;">
			<strong><a style="cursor:pointer;font-size:20px;color:#000000">问答</a></strong>&emsp;&emsp;&emsp;&emsp;&emsp;<a id="goziliao" style="cursor:pointer;font-size:20px;color:#000000">资料</a>
			<hr  style="height:3px;border:none;border-top:5px ridge green;" >
			<table>
				<c:forEach var="i" items="${questions}">
					<tr>
						<div style="margin-top:20px">
							<font style="size:20px;color:#282828;">${i.creationTime }</font>
							<h3 style="color:000000"><a href="${hello}question/detail/${i.id}">${i.questionName }</a></h3>
							<h3 style="color:#404040">${i.questionContent }</h3>
							<p>赞同数 &emsp;评论数</p>
							<hr>
							<br>
						</div>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</c:when>
<c:otherwise>

		<!--  资料显示栏 -->
<div class="container" id="ziliao" style="display:none">
		<div class="footer_grids">
			<div class="col-md-8 footer_grid_right">

				<form action="#" method="post">
					<input type="email" name="Email" placeholder="搜索" required="">
					<input type="submit" value="Submit">
				</form>
			</div>
			<div class="clearfix"> </div>
		</div>
	

		<div class="col-md-4 footer_grid" style="margin-top:60px;width:70%;float:left">
			<a id="gowenda" style="cursor:pointer;font-size:20px;color:#000000">问答</a>&emsp;&emsp;&emsp;&emsp;&emsp;<strong><a style="cursor:pointer;font-size:20px;color:#000000">资料</a></strong>
			<hr  style="height:3px;border:none;border-top:5px ridge green;" >
			<table>
				<c:forEach var="i" items="${questions}">
					<tr>
						<div style="margin-top:20px">
							<font style="size:20px;color:#282828;">${i.creationTime }</font>
							<h3 style="color:000000"><a href="${hello}question/detail/${i.id}">${i.questionName }</a></h3>
							<h3 style="color:#404040">${i.questionContent }</h3>
							<p>赞同数 &emsp;评论数</p>
							<hr>
							<br>
						</div>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>

</c:otherwise>
</c:choose>

	</div>



<!-- 尾联 -->
<div id="lianxi" class="footer_top_agileits" style="height:500px">
	<div class="container">
		<div class="col-md-4 footer_grid">
			<h3>关于我们</h3>
			<p style="color:#D8D8D8">青大校园一站式知识问答平台
			</p>
		</div>
		<div class="col-md-4 footer_grid">
			<h3>热门版块</h3>
			<ul class="footer_grid_list">
				<li><i class="fa fa-long-arrow-right" aria-hidden="true"></i>
					<a style="color:#D8D8D8"href="#" data-toggle="modal" data-target="#myModal">青大校历</a>
				</li>
				<li><i class="fa fa-long-arrow-right" aria-hidden="true"></i>
					<a style="color:#D8D8D8"href="#" data-toggle="modal" data-target="#myModal">考研高数知识问答</a>
				</li>
				<li><i class="fa fa-long-arrow-right" aria-hidden="true"></i>
					<a style="color:#D8D8D8"href="#" data-toggle="modal" data-target="#myModal">医学知识相关问答 </a>
				</li>
				<li><i class="fa fa-long-arrow-right" aria-hidden="true"></i>
					<a style="color:#D8D8D8"href="#" data-toggle="modal" data-target="#myModal">人工智能交流</a>
				</li>
				<li><i class="fa fa-long-arrow-right" aria-hidden="true"></i>
					<a style="color:#D8D8D8"href="#" data-toggle="modal" data-target="#myModal">青大细节分析 </a>
				</li>
			</ul>
		</div>
		<div class="col-md-4 footer_grid">
			<h3 style="color:#D8D8D8">相关信息</h3>
			<ul class="address">
				<li><i class="fa fa-map-marker" aria-hidden="true"></i><a style="color:#D8D8D8">青海大学云易股份有限公司</a></li>
				<li><i class="fa fa-envelope" aria-hidden="true"></i><a style="color:#D8D8D8"href="">1430578107@qq.com</a></li>
				<li><i class="fa fa-phone" aria-hidden="true"></i><a style="color:#D8D8D8">15500545625</a></li>
			</ul>
		</div>


	</div>
	<div class="col-md-4 footer_grid">
		<img style ="height:100px;width:100px;margin-left: 250px" src="${hello}images/m.jpg">

	</div>
</div>



<!--图片动态播放-->
<script src="${hello}js/responsiveslides.min.js"></script>
<script>
	// You can also use "$(window).load(function() {"
	$(function () {
		// Slideshow 4
		$("#slider3").responsiveSlides({
			auto: true,
			pager:true,
			nav:false,
			speed: 500,
			namespace: "callbacks",
			before: function () {
				$('.events').append("<li>before event fired.</li>");
			},
			after: function () {
				$('.events').append("<li>after event fired.</li>");
			}
		});

	});
</script>


</body>
</html>