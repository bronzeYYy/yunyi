<%@ page language="java" contentType="text/html; charset=utf-8"
				 pageEncoding="utf-8"%>
<%--@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" --%>
<html>
<head>
	<title>云易知识问答平台</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	<!-- Custom Theme files -->
	<link href="${hello}css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
	<link href="${hello}css/style.css" type="text/css" rel="stylesheet" media="all">
	<link href="${hello}css/font-awesome.css" rel="stylesheet"> <!-- font-awesome icons -->
	<link rel="stylesheet" href="${hello}css/owl.carousel.css" type="text/css" media="all" />
<%--	<link rel="stylesheet" href="${hello}css&js/bootstrap.min.css">--%>
<%--	<link rel="stylesheet" href="${hello}css&js/login.css" />--%>
<%--	<link href="${hello}css&js/bootstrap.css" rel="stylesheet" type="text/css" media="all" />--%>
<%--	<script  src="${hello}css&js/jquery.min.js"></script>--%>


<%--	<link href="${hello}css&js/style.css" rel="stylesheet" type="text/css" media="all" />--%>
	<%--<link href='http://fonts.useso.com/css?family=Raleway:400,200,100,300,500,600,700,800,900' rel='stylesheet' type='text/css'>
	<link href='http://fonts.useso.com/css?family=Open+Sans+Condensed:300,300italic,700' rel='stylesheet' type='text/css'>--%>


<%--	<link href="${hello}css&js/styles.css" rel="stylesheet">--%>
	<link rel="stylesheet" type="text/css" href="${hello}css&js/component.css" />

	<link href="${hello}css&js/animate.min.css" rel="stylesheet">
	<!-- //Custom Theme files -->
	<!-- js -->
	<script src="${hello}js/jquery-2.2.3.min.js"></script>
	<!-- //js -->
	<!-- web-fonts -->
	<%--<link href="http://fonts.googleapis.com/css?family=Montserrat:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	<link href="http://fonts.googleapis.com/css?family=Roboto+Condensed:300,300i,400,400i,700" rel="stylesheet">--%>

	<!-- //web-fonts -->
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
    <style>

        .hello div{
            float:left;
            margin-top: 50px;
            width: 20%;
            margin-left: 50px;
            height: 40%;
            text-align: center;
        }

        .text div{
            background-color: #eeeeee;
            border-radius: 20px;
            float: left;
            height:40%;
            width:15%;
            cursor: pointer;
            margin-left: 50px;
            margin-top: 150px;
            text-align: center;
            box-shadow: 0 0 10px #9d9d9d;
            display: none;
            position: relative;
        }
        .text h5{
            margin-top: 20px;
        }

        .text h6{
            width: 80%;
            margin-left:20px;
            line-height: 20px;

        }
        .text img{
            height:50px;
            width:50px;
            margin-top: 10px;
        }
        .text a{
            color: #0f0f10;
          }

    </style>

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
				<li class="active"><a class="scroll" href="#lianxi" id ="coll">联系我们</a></li>
				<li class="active"><a class="scroll" href="${hello}user" id ="${hello}user">我的主页</a></li>
			</ul>
			<ul class="nav navbar-nav pull-right">
				<li>
					<a style="color:#FFFFFF" href="${hello}user">${not empty user.userName ? user.userName:'登陆'}</a>
				</li>
			</ul>
		</div>
	</div>
</nav>
<!-- //Navigation -->

<!-- banner-slider -->
<%--<div class="w3l_banner_info">
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
</div>--%>
<div class="clearfix"></div>

<!-- footer -->

<div class="text" id="main" style="text-align:center;width:100%;height:80%;background-color:#ffffff">
    <h1 style="margin-top: 100px">青大一站式知识问答、资料上传下载平台</h1>
    <h3 style="margin-top: 30px">一个网站，解决所有问题</h3>
	<div id="di1" style="margin-left: 100px;margin-top: 50px;" onclick="window.location='${hello}column'">
		<img src="${hello}images/wenda.png">
		<strong><h5 >知识问答</h5></strong><hr>

		<h6>你问我答，我问你答，有问题上云易知识问答</h6>
	</div>
	<div id="di2" onclick="window.location='${hello}files'">
		<img src="${hello}images/ziliao.png">
		<strong><h5>资料总汇</h5></strong><hr>

		<h6>分享资料，下载资料，在资料汇总方面我们云易很专业。
		</h6>
	</div>
	<div id="di3" style="margin-top: 50px" onclick="window.location='${hello}column'">
		<img src="${hello}images/jiaoliu.png">
		<strong><h5 >互动便捷</h5></strong><hr>
		<h6>想和校内大牛们探讨人生吗？来云易，让你方便快捷地和大神们进行灵魂对话。
		</h6>
	</div>
	<div id="di4">
		<img src="${hello}images/shuju.png">
		<strong><h5>数据分析</h5></strong><hr>

		<h6>为你量身打造的信息通道，不求最好，但求合适，只因懂你。
		</h6>
	</div>
	<div id="di5" style="margin-top: 50px;" onclick="window.location='${hello}column'">
		<img src="${hello}images/yuanxi.png">
		<strong><h5 >院系独立</h5></strong><hr>

		<h6>术业有专攻，博学是你，专攻亦可是你，院系内的专业知识全在这里</h6>
	</div>
</div>

<div id="down" style="text-align:center;width:100%;height:60%;background-color:	#F0F0F0">
    <br><br><br>
    <h1>更好的服务，铸就更好的信任</h1>
    <div class="hello" id="hello" style="margin-top:50px;width:100%;height:50%;" >
        <div>
            <h1 class="up">+</h1> <br>
            <h3>覆盖用户</h3>
        </div>
        <div>
            <h1 class="up">+</h1>
            <br>
            <h3>问答总量</h3>
        </div>
        <div>
            <h1 class="up">+</h1> <br>
            <h3>各类文件</h3>
    </div>
        <div>
            <h1 class="up">+</h1> <br>
            <h3>安全流水</h3>
    </div>

    </div>
</div>

<!-- 尾联 -->
<div id="lianxi" class="footer_top_agileits" style="height:500px">
	<div class="container">
		<div class="col-md-4 footer_grid">
			<h3>关于我们</h3>
			<p style="color:#D8D8D8">青大校园一站式知识问答平台
			</p>
			<img style ="height:100px;width:100px" src="${hello}images/m.jpg">

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

</div>



<!--图片动态播放-->
<script src="${hello}js/responsiveslides.min.js"></script>

<script>
    $(function(){
        var obj={
            el:$(".up"),
            max:100,
            start:100//增加开始的初始值
        }
        var obj2={
            el:$(".down"),
            max:100,
            end:100//减少到最小的值
        }
        up(obj);

    })
    function up(obj){
        var item=obj.el;
        var num=obj.max;
        var start=obj.start;
        time2=setInterval(function(){
            start++;
            if(start>num){
                start=num;
                clearInterval(time2);
            }
            item.text(start)
        },1)
    }
</script>

<script>
	// You can also use "$(window).load(function() {"
	$(function () {

		// Slideshow 4
		$("#slider3").responsiveSlides({
			auto: true,
			pager:true,
			nav:false,
			speed: 300,
			namespace: "callbacks",
			before: function () {
				$('.events').append("<li>before event fired.</li>");
			},
			after: function () {
				$('.events').append("<li>after event fired.</li>");
			}
		});

		/*$('#main').hover(function(){

        });*/

		$("#di1").fadeIn(500);
		$("#di2").fadeIn(1000);
		$("#di3").fadeIn(1500);
		$("#di4").fadeIn(2000);
		$("#di5").fadeIn(2500);

		for(let i=1;i<=5;++i){
			let di=$('#di'+i);
			di.mouseenter(function () {
				di.animate({bottom:'20px'});
			}).mouseleave(function () {
					di.animate({bottom:'0'});
			})
		}


	});
</script>

</body>
</html>