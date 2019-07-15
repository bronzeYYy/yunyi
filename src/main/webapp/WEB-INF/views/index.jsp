<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
				 pageEncoding="utf-8"%>
<%--<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
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
			</ul>
			<ul class="nav navbar-nav pull-right">
				<li>
					<a id="Login_start_" class="danger" style="cursor:pointer;background-color: #666666; border-radius:3px; color:#FFFFFF" onclick="window.location='login.jsp'">登录</a>
				</li>
			</ul>
		</div>
	</div>
</nav>
<!-- //Navigation -->

<!-- banner-slider -->
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
<div class="clearfix"></div>

<!-- //banner-slider -->

<!-- //Header -->

<!--//banner-->
<!--about -->

<!-- footer -->
<div style="width:100%;background-color:#141415">

	<div class="container">
		<div class="footer_grids">
			<div class="col-md-8 footer_grid_right">

				<form action="#" method="post">
					<input type="email" name="Email" placeholder="搜索" required="">
					<input type="submit" value="Submit">
				</form>
			</div>
			<div class="clearfix"> </div>
		</div>
		<!-- 问答显示栏 -->

		<div class="col-md-4 footer_grid" style="margin-top:60px">
			<h3>问答</h3>
			<hr>
			<table>
				<c:forEach var="i" items="${questions}">
					<tr>
						<div style="margin-top:20px">
							<font style="size:20px;color:#989898;">${i.creationTime }</font>
							<h3><a href="${hello}question/detail/${i.id}">${i.questionName }</a></h3>
							<h3>${i.questionContent }</h3>
							<p>赞同数 &emsp;评论数</p>
							<hr>
							<br>
						</div>
					</tr>
				</c:forEach>
			</table>
		</div>

		<!--  资料显示栏 -->

		<%--<div class="col-md-4 footer_grid" style="margin-top:60px;margin-left:300px">
			<h3></h3>
			<hr>
			<div style="margin-top:20px;bgcolor:#ffff00" >
				<c:forEach var="i" items="${questions}">
					<div style="bgcolor:#F00000">
						<h1>${i.questionName }</h1><h4>${i.creationTime }</h4>
						<p><h3>${i.questionContent }</h3></p>
						<hr>
					</div>
				</c:forEach>
			</div>
		</div>--%>

		<div class="clearfix"> </div>

	</div>
</div>



<!-- 尾联 -->
<div name="lianxi" class="footer_top_agileits">
	<div class="container">
		<div class="col-md-4 footer_grid">
			<h3>关于我们</h3>
			<p>青大校园一站式知识问答平台
			</p>
		</div>
		<div class="col-md-4 footer_grid">
			<h3>热门版块</h3>
			<ul class="footer_grid_list">
				<li><i class="fa fa-long-arrow-right" aria-hidden="true"></i>
					<a href="#" data-toggle="modal" data-target="#myModal">青大校历</a>
				</li>
				<li><i class="fa fa-long-arrow-right" aria-hidden="true"></i>
					<a href="#" data-toggle="modal" data-target="#myModal">考研高数知识问答</a>
				</li>
				<li><i class="fa fa-long-arrow-right" aria-hidden="true"></i>
					<a href="#" data-toggle="modal" data-target="#myModal">医学知识相关问答 </a>
				</li>
				<li><i class="fa fa-long-arrow-right" aria-hidden="true"></i>
					<a href="#" data-toggle="modal" data-target="#myModal">人工智能交流</a>
				</li>
				<li><i class="fa fa-long-arrow-right" aria-hidden="true"></i>
					<a href="#" data-toggle="modal" data-target="#myModal">青大细节分析 </a>
				</li>
			</ul>
		</div>
		<div class="col-md-4 footer_grid">
			<h3>相关信息</h3>
			<ul class="address">
				<li><i class="fa fa-map-marker" aria-hidden="true"></i>青海大学云易股份有限公司</li>
				<li><i class="fa fa-envelope" aria-hidden="true"></i><a href="">1430578107@qq.com</a></li>
				<li><i class="fa fa-phone" aria-hidden="true"></i>15500545625</li>
			</ul>
		</div>


	</div>
	<div class="col-md-4 footer_grid">
		<img src="${hello}images/m.jpg">

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