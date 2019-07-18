<%--@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" --%>
<%@ page language="java" contentType="text/html; charset=utf-8"
				 pageEncoding="utf-8"%>
<!DOCTYPE html>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
		.footer_top_agileits a{
			color:#909090;
			cursor:pointer
		}
		.hidebar1{
			height: 300px;
			min-width: 720px;
			display: none;
			background: rgba(0,0,0,.7);
			position: fixed;
			top:51px;
			left: 230px;
			color: #aaaaaa;
		}
		.hidebar1 ul{
			list-style: none;
			margin:0 40px;
		}
		.hidebar1 ul li{
			height: 50px;
			text-align: center;
			line-height: 50px;
			font-size: 16px;
		}
		.hidebar1 ul .title{
			font-size: 20px;
			font-weight: 500;
			border-bottom: 1px solid #aaa ;

		}
	</style> 
	
<style type="text/css">
a:link,a:visited{
 text-decoration:none;  
}
a:hover{
 text-decoration:none;  
}
</style>
	<style type="text/css">

	
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
<body style="background-color:#F0F0F0;background-repeat :no-repeat;background-position: right bottom;background-attachment:fixed;">
<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="${hello}index.jsp">返回首页</a>
		</div>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
			<li class="active"><a style="font-size:20px;color:#888888" href="" id="test">推荐</a></li>
				<li class="active"><a class="scroll" href="#zhuye" id="cpu">计算机系</a></li>
				<li class="active"><a class="scroll" href="gaishu.jsp" id = "chemical">化工学院</a></li>
				<li class="active"><a class="scroll" href="jisuanji.jsp" id ="husbandry">农牧学院</a></li>
				<li class="active"><a class="scroll" href="yixue.jsp" id="machinery">机械学院</a></li>
				<li class="active"><a class="scroll" href="tiyu.jsp" id="economy">财经学院</a></li>
				<li class="active"><a class="scroll" href="zhishi.jsp" id="medical">医学院</a></li>
				<li class="active"><a class="scroll" href="zepai.jsp" id="build">土木学院</a></li>
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
<div class="hidebar"></div>
<script>
	var data=[
		[{title:"软件使用",content:["office","Ps","3DsMax"]},
		{title:"编程语言",content:["C/C++","Java","Python","Javascript"]},
		{title:"计算机网络",content:["TCP/IP","网络安全"]},
		{title:"计算机系统平台",content:["CPU","进程管理","内存管理","磁盘管理"]}],
		[{title:"有机化学",content:["醇，醚","醛，酮","酚，醌","有机合成"]},
		{title:"结构化学",content:["原子结构","分子机构","分子对称性","晶体结构"]},
		{title:"物理化学",content:["化学热力学","相平衡","化学动力学","表面物理化学"]},
		{title:"分析化学",content:["误差与数据处理","酸碱滴定","配位滴定","氧化还原滴定"]}],
		[{title:"植物生产",content:[""]},
		{title:"动物生产",content:[""]},
		{title:"林学草学",content:[""]},
		{title:"自然保护",content:[""]}],
		[{title:"植物生产",content:[""]},
		{title:"动物生产",content:[""]},
		{title:"林学草学",content:[""]},
		{title:"自然保护",content:[""]}],
		[{title:"植物生产",content:[""]},
		{title:"动物生产",content:[""]},
		{title:"林学草学",content:[""]},
		{title:"自然保护",content:[""]}],
		[{title:"植物生产",content:[""]},
		{title:"动物生产",content:[""]},
		{title:"林学草学",content:[""]},
		{title:"自然保护",content:[""]}],
		[{title:"植物生产",content:[""]},
		{title:"动物生产",content:[""]},
		{title:"林学草学",content:[""]},
		{title:"自然保护",content:[""]}],
	];
	var hide=$('.hidebar');
	data.forEach(function (item,index) {
		var newnode=$("<div class='hidebar1'></div>");
		item.forEach(function (item2) {
			var newUL=$("<ul></ul>");
			newUL.append($("<li class='title'>"+item2.title+"</li>"));
			item2.content.forEach(function (item3) {
				newUL.append($("<li>"+item3+"</li>"))
			});
			newnode.append(newUL);
		});
		hide.append(newnode);
	});


</script>
<div id="zhuye" class="header" style="background-image :url(${hello}image/beijing.jpg);background-repeat:no-repeat; height:100%; width:100%;"  id="shouye">
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

<c:choose> 
<c:when test="${not empty param.type and param.type eq 1 }">
<div>
	<div class="footer_grids" style="text-align:center;margin-left:380px">
		<div class="col-md-8 footer_grid_right" >


			<input  type="button" id="iwant" value="我要提问">

		</div>
		<br>
		
		<div class="clearfix"> </div>
	</div>
	<hr  style="height:3px;width:80%;border:none;border-top:5px ridge;" >
	
	
	<div id="left" style="width:55%;margin-left:200px;float:left">
			<strong><a style="cursor:pointer;font-size:20px;color:#000000">问答</a></strong>&emsp;&emsp;&emsp;&emsp;&emsp;<a href="${hello}column.jsp?type=2" style="cursor:pointer;font-size:20px;color:#000000">资料</a>
			<hr>
			<table>
				<c:forEach var="i" items="${questions}">
					<tr>
						<div style="margin-top:20px">
							<font style="size:20px;color:#989898;">${i.creationTime }</font>
							<a href="${hello}question/detail/${i.id}"><h3 style="color:#585858">问题${i.questionName }</h3></a>
							<br><h4 style="color:#000000">问题详情${i.questionContent }</h4><br>
							<img onclick="star(${i.id})" id="clickit" style="cursor:pointer;width:20px;height:20px" src="${hello}image/dianzan1.png"><font style="color:#000000">${i.likenum}</font>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
							<img style="width:18px;height:18px" src="${hello}image/pinglun.png"><font style="color:#000000">${i.commentNum}</font>
							
							<hr style=" height:2px;border:none;border-top:2px dotted #808080;" />
							<br>
						</div>
					</tr>
				</c:forEach>
			</table>
	</div>
	</div>
	</c:when>
	<c:otherwise>
	<div style="display:none">
	<div class="footer_grids" style="text-align:center;margin-left:380px">
		<div class="col-md-8 footer_grid_right" >


			<input  type="button" id="ishang" value="我要上传">

		</div>
		<br>
		
		<div class="clearfix"> </div>
	</div>
	<div id="right" style="width:55%;margin-left:200px;float:left">
			<a href="${hello}column.jsp?type=1" style="cursor:pointer;font-size:20px;color:#000000">问答</a>&emsp;&emsp;&emsp;&emsp;&emsp;<strong><a style="cursor:pointer;font-size:20px;color:#000000">资料</a></strong>
			<hr>
			<table>
				<c:forEach var="i" items="${questions}">
					<tr>
						<div style="margin-top:20px">
							<font style="size:20px;color:#989898;">${i.creationTime }</font>
							<a href="${hello}question/detail/${i.id}"><h3 style="color:#585858">资料名${i.questionName }</h3></a>
							<br><h4 style="color:#000000">资料详情${i.questionContent }</h4><br>
					
							<img style="width:20px;height:20px" src="${hello}image/dianzan1.png"><font style="color:#000000">${i.likenum}</font>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
							<img style="width:18px;height:18px" src="${hello}image/pinglun.png"><font style="color:#000000">${i.commentNum}</font>
							
							<hr style=" height:2px;border:none;border-top:2px dotted #808080;" />
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



<div class="footer_top_agileits">

	<div style=" float:left;margin-left:880px;width:35%" align="center">

		<a style="margin-top:50px">侵权举报 网上有害信息举报专区</a><p style="margin-top:10px"></p>
		<a >违法和不良信息举报：15500545625</a><p style="margin-top:10px"></p>
		<a >色情信息举报专区</a><p style="margin-top:10px"></p>
		<a>证照中心</a><p style="margin-top:10px"></p>
		<a >联系我们 @云易校园知识问答平台</a><p style="margin-top:10px"></p>

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
			area:['1000px','770px'],
			content:'${hello}input.jsp'
		});

	});
	$('#ishang').on('click',function(){
		layer.open({
			type:2,
			title:'上传资料',
			maxmin:true,
			shadeClose:true,
			area:['300px','600px'],
			content:'${hello}answer.jsp'
		});
	});
	var star = function star (id) {
		$.ajax({
			url:  '${hello}question/star',
			type: 'post',
			data: {'questionId':id},
			success:function(data) {
				layer.msg(data.msg);
				if(data.code === 0)
				{
					$(this).attr('src', '${hello}image/dianzan2.png');
					window.location.href=window.location.href;
					window.location.reload();
				}
			}
		});
	}
	
	/*$('#clickit').on('click',function(){
		//var
		  $.ajax({
	            url:  '${hello}answer/star',
	            type: 'post',
	            data: {'questionId':${i.questionId}},
	            success:function(data) {
	                layer.msg(data.msg);
	                if(data.code === 0)
	                {
	                	$(this).attr('src', '${hello}image/dianzan2.png');
	                    window.location.href=window.location.href;
	                    window.location.reload();
	                }
	            }
	        });
	});*/
	
	
	
	var div_x_1 = 230;
	var div_y_1 = 50;
	var act=$('.active .scroll');
	for(let i=0;i<7;++i){
		$(act[i]).mouseover(function () {
			$('.hidebar1').css('display','none');
			$('.hidebar1:eq('+i+')').css('display','flex');

		}).mouseout(function (e) {
			var hidebar=$('.hidebar1:eq(0)');
			var x=e.clientX;
			var y=e.clientY;
			var div_x_2 = div_x_1+hidebar.outerWidth();
			var div_y_2 = div_y_1+hidebar.outerHeight();
			if( x < div_x_1 || x > div_x_2 || y < div_y_1 || y > div_y_2){
				$('.hidebar1').css('display','none');
			}
			else{
				document.removeEventListener("mousemove",check,false);
				document.addEventListener("mousemove",check,false);
				function check(e) {
					var x=e.clientX;
					var y=e.clientY;
					// console.log(y,div_y_1,div_y_2);
					// console.log(x,div_x_1,div_x_2);
					if( x < div_x_1 || x > div_x_2 || y < div_y_1 || y > div_y_2){
						document.removeEventListener("mousemove",check,false);
						if(y>div_y_1)
							$('.hidebar1').css('display','none');
					}
				}
			}


		});
	}


</script>

</body>
</html>