<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%--    <meta charset="UTF-8">--%>
    <title>ta的主页</title>
    <link rel="stylesheet" href="${hello}css/personalPage.css">
    <link rel="stylesheet" href="${hello}iconfont/iconfont.css">
    <script src="${hello}js/jquery-3.3.1.min.js"></script>
<style> 
.divcss5{ border:0px solid #000; width:300px; height:300px;overflow:hidden} 
.divcss5 img{max-width:300px;_width:expression(this.width > 300 ? "300px" : this.width);} 
</style> 

</head>

<body style="background-color:#444">
<div class="nav">
	<h3 style="color:#ffffff;cursor:pointer;margin-left:50px" onclick="window.location = '${hello}column'" >返回</h3>
</div>
<div class="container">
    <div class="personInfo">
        <div class="top"></div>
        <img id="touxiang" style="cursor:pointer" src="${hello}user/avatar/${user.id}">
        <div  class="usrname">用户名:${user.userName}
        
<!-- 详情页 -->
        </div>
        <div class="textinfo">
            <span>积分：${user.integral}</span>
            <span>发布数：${user.askingNumber}</span>
            <span>回答数：${user.answerNumber}</span>
        </div>

       
        <div class="bot"></div>
        <div class="detailbtn"><i class="iconfont icon-unfold"></i> <span>详细资料</span></div>
        <div class="detail">
            <p>班&emsp;&emsp;级：${user.userClass}</p>
            <p>学&emsp;&emsp;号：${user.studentNo}</p>
            <p>邮&emsp;&emsp;箱：${user.email}</p>
        </div>
    </div>
    
 <!--  历史提问   -->
<div id="myquestion">
    <ul class="menu">
        <li><strong>ta的提问</strong></li>
        <li><a id="answer">ta的回答</a></li>
    </ul>
    <div style="width:60%;height:100px;margin-left:50px;">
    <table>
        <c:forEach var="i" items="${questions}">

            <tr>
                <div style="margin-top:20px">
                    <font style="size:20px;color:#989898;">创建时间${i.creationTime }</font>
                    <a href="/question/detail/${i.id}"><h3>${i.questionName }</h3></a>
                    <h3>${i.questionContent }</h3>
<%--                    <p>赞同数 &emsp;评论数</p>--%>
                    <hr>
                    <br>
                </div>
            </tr>
        </c:forEach>
    </table>
	</div>
</div>

<!-- 历史问答 -->

<div id="myanswer" style="display:none">
    <ul class="menu">
         <li><a id="question">ta的提问</a></li>
        <li><strong>ta的回答</strong></li>
    </ul>
    <div  style="width:60%;height:100px;margin-left:50px">
    <table>
        <c:forEach var="i" items="${answers}">
            <tr>
                <div style="margin-top:20px">
                    <font style="size:20px;color:#989898;">创建时间${i.answerTime}</font>
                    <a href="/question/detail/${i.question.id}"><h3>${i.answerContent}</h3></a>
<%--                    <h4>我的回答</h4>--%>
                    <hr>
                    <br>
                </div>
            </tr>
        </c:forEach>
    </table>
</div>
</div>

</div>


<!--  ------------------------------------------------------------------------------------------------------------------- -->



<!--  ------------------------------------------------------------------------------------------------------------------- -->


<script src="${hello}layer-v3.1.1/layer/layer.js"></script>
<script>
    var bot=$('.personInfo .bot');
    var detail=$('.personInfo .detail');
    var cnt=0;
    $('.personInfo .detailbtn').click(function () {
        if(cnt===0){
            bot.animate({height:'200px'},showDetail);
            function showDetail(){
                detail.show();
            }
            change('icon-fold','收起');
            cnt=1;
        }
        else{
            bot.animate({height:'100px'});
            change('icon-unfold','详细资料');
            detail.hide();
            cnt=0;
        }
        function change(cls,txt) {
            $('.detailbtn i').attr('class','iconfont '+cls);
            $('.detailbtn span').html(txt);
        }
    });
  
   
  
    $('.hidebox .submit').click(function () {
        $('.shadow').hide();
        $('.hidebox').hide();
    });
    $('.hidebox2 .submit').click(function () {
        $('.shadow').hide();
        $('.hidebox2').hide();
    });
    $('.modifyinfo .submit').click(function () {
        $('.shadow').hide();
        $('.modifyinfo').hide();
    });
    $('#headimg').change(function () {
        var reads=new FileReader();
        f=this.files[0];
        reads.readAsDataURL(f);
        reads.onload=function (e) {
            var img = new Image;
            img.src = this.result;
            img.style.height='140px';
            img.style.width='140px';
            $('.modifyinfo label').html('').append(img);
        };
    });
	$(document).ready(function() {

		$("#answer").on('click',function(){
			$("#myquestion").hide(500);
			$("#myanswer").show(500);
		});
	
		$("#question").on('click',function(){
			$("#myanswer").hide(500);
			$("#myquestion").show(500);
		});
	
	
	});
	
	//头像预览实现
	
   
</script>
</body>
</html>