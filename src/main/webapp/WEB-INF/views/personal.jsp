<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%--    <meta charset="UTF-8">--%>
    <title>个人主页</title>
<%--    <link rel="stylesheet" href="${hello}css&js/bootstrap.min.css" type="text/css" />--%>
<%--    <link rel="stylesheet" href="${hello}css&js/login.css" type="text/css" />--%>
    <link rel="stylesheet" href="${hello}css/personalPage.css" type="text/css">
    <link rel="stylesheet" href="${hello}iconfont/iconfont.css" type="text/css">
    <script src="${hello}js/jquery-3.3.1.min.js"></script>
<style>
.divcss5{ border:0px solid #000; width:300px; height:300px;overflow:hidden}
.divcss5 img{max-width:300px;_width:expression(this.width > 300 ? "300px" : this.width);}
</style>
<style>
    .delete {
        cursor:pointer;
        color:#fffdef;
        background-color: darkred;
        /*width:100%;
        height: 100%;*/
        border-style:none;
        border-radius: 20px
    }
	.file {
    position: relative;
    display: inline-block;
    background: #606060;
    border: 1px solid #99D3F5;
    border-radius: 4px;
    padding: 4px 12px;
    overflow: hidden;
    color: #ffffff;
    text-decoration: none;
    text-indent: 0;
    line-height: 20px;
}
.file input {
    position: absolute;
    font-size: 100px;
    right: 0;
    top: 0;
    opacity: 0;
}
.file:hover {
    background: #AADFFD;
    border-color: #78C3F3;
    color: #004974;
    text-decoration: none;
}
.loginout {
    border:1px #7bc7ff solid;
    border-radius: 10px;
    outline: none;
    background: #fff;
    cursor: pointer;
    padding: 10px;
    text-decoration: none;
    margin-left: 10px;
    font-size: 15px;
    font-weight: normal;
    margin-bottom: 10px;
}
</style>
</head>

<body style="background-color:#444">
<div class="nav">
    <h3>
        <a style="color:#ffffff;cursor:pointer;margin-left:50px" href="${hello}column">返回</a>
    </h3>
</div>
<div class="container">
    <div class="personInfo">
        <div class="top"></div>
        <img id="touxiang" style="cursor:pointer" src="${hello}user/avatar/${user.id}">
        <div  class="usrname">用户名:${user.userName}
            <a class="loginout" href="${hello}user/loginout">退出登陆</a>
<!-- 详情页 -->
        </div>
        <div class="textinfo">
<%--            <span>积分：${user.integral}</span>--%>
            <span>发布数：<span id="asking-num">${user.askingNumber}</span></span>
            <span>回答数：<span id="answer-num">${user.answerNumber}</span></span>
            <span>资料数：<span id="upload-num">${user.uploadNumber}</span></span>
        </div>

        <button id="modify" style="">修改个人信息</button>
        <div class="bot"></div>
        <div class="detailbtn"><i class="iconfont icon-unfold"></i> <span >详细资料</span></div>
        <div class="detail">
            <p>班&emsp;&emsp;级：${user.userClass}</p>
            <p>学&emsp;&emsp;号：${user.studentNo}</p>
            <p>邮&emsp;&emsp;箱：${user.email}</p>
            <p>Q&emsp;&emsp;Q：${user.userQq}</p>
        </div>
    </div>
    <!-- 历史上传 -->
    <div id="myfile" style="display: none;">
        <ul class="menu">
            <li><a id="question1">我的提问</a></li>
            <li><a id="answer1">我的回答</a></li>
            <li><strong>我的资料</strong></li>
            <li><a href="javascript:tiwen()">提问</a></li>
            <li><a href="javascript:ziliao()">上传资料</a></li>
            <li><a id="xiaoxi">消息</a></li>
        </ul>
        <c:forEach var="i" items="${files}">
            <div style="margin-top:20px; padding-left: 30px; padding-right: 30px">
                <font style="size:20px;color:#989898;">${i.creationTime }</font>
                <h3><a href="${hello}file/detail/${i.md5}">${i.fileName}</a>
                    <button style="float: right" class="delete" onclick="delete_file('${i.md5}', $(this))">删除</button>
                </h3>
                <h3>${i.fileDetail }</h3>
                <hr>
            </div>
        </c:forEach>
    </div>
    <!--  历史提问   -->
<div id="myquestion">
    <ul class="menu">
        <li><strong>我的提问</strong></li>
        <li><a id="answer2">我的回答</a></li>
        <li><a id="file1">我的资料</a></li>
        <li><a href="javascript:tiwen()">提问</a></li>
        <li><a href="javascript:ziliao()">上传资料</a></li>
        <li><a id="xiaoxi">消息</a></li>
    </ul>
    <c:forEach var="i" items="${questions}">
        <div style="margin-top:20px; padding-left: 30px; padding-right: 30px">
            <font style="size:20px;color:#989898;">${i.creationTime }</font>
            <h3><a href="/question/detail/${i.id}">${i.questionName }</a>
                <button style="float: right" class="delete" onclick="delete_question('${i.id}', $(this))">删除</button>
            </h3>
            <p>${i.questionContent }</p>
                <%--                    <p>赞同数 &emsp;评论数</p>--%>
            <hr>
        </div>
    </c:forEach>
</div>

<!-- 历史问答 -->

<div id="myanswer" style="display:none">
    <ul class="menu">
         <li><a id="question2">我的提问</a></li>
        <li><strong>我的回答</strong></li>
        <li><a id="file2">我的资料</a></li>
        <li><a href="javascript:tiwen()">提问</a></li>
        <li><a href="javascript:ziliao()">上传资料</a></li>
        <li><a id="xiaoxi">消息</a></li>
    </ul>
    <c:forEach var="i" items="${answers}">
        <div style="margin-top:20px; padding-left: 30px; padding-right: 30px">
            <font style="size:20px;color:#989898;">${i.answerTime}</font>
            <h3>主题：<a href="/question/detail/${i.question.id}">${i.question.questionName}</a>
                <%--                    <h4>我的回答</h4>--%>
            <button style="float: right" class="delete" onclick="delete_answer('${i.id}', $(this))">删除</button>
            </h3>
            ${i.answerContent}
            <hr>
        </div>
    </c:forEach>
</div>

</div>
<div class="shadow"></div>
<div class="hidebox2">
    <label for="choosefile">选择文件</label>
    <input type="file" id="choosefile" style="display: none;">
    <input type="submit" class="submit">
</div>

<!--  ------------------------------------------------------------------------------------------------------------------- -->

<!-- 更换头像 -->

<div style="display: none" id="update">
 <div class="divcss5">

  <img id="img" style='height:300px;width:300px' src='${hello}user/avatar/${user.id}'>
 </div>
  <br>
 <button class='file' style='cursor:pointer;text-align:center;margin-left:110px;height:30px;width:100px' id='add'>选择图片</button>
 <br>
 <br>
 <!--form enctype="multipart/form-data" id="uploadForm"-->
 <input type="file" id="xuanze" style="display:none" onchange="fileReader(this)" />

 <input type="submit" class='file' style='cursor:pointer;text-align:center;margin-left:110px;height:30px;width:100px'  id='picinput'value="确认修改"/>

</div>

<!--  ------------------------------------------------------------------------------------------------------------------- -->


<script src="${hello}layer-v3.1.1/layer/layer.js"></script>
<script>
    var bot=$('.personInfo .bot');
    var detail=$('.personInfo .detail');
    var cnt=0;
    $('.personInfo .detailbtn').click(function () {
        if(cnt===0){
            bot.animate({height:'240px'},showDetail);
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
    var tiwen = function() {
        layer.open({
            type:2,
            title:'提交问题',
            maxmin:true,
            shadeClose:true,
            area:['1000px','700px'],
            content:'${hello}input.jsp'
        });
    };
    var ziliao = function() {
        layer.open({
            type:2,
            title:'上传资料',
            maxmin:true,
            shadeClose:true,
            area:['1000px','700px'],
            content:'${hello}answer.jsp'
        });
    };

    $('#modify').on('click',function(){
        layer.open({
            type:2,
            title:'修改信息',
            maxmin:true,
            shadeClose:true,
            area:['400px','404px'],
            content:'${hello}update.jsp'
        });
    });
	$('#touxiang').on('click',function(){
		 //var content = "";
		layer.open({
  			type:1,
  			title:'更换头像',
  			maxmin:true,
  			shadeClose:true,
  			area:['300px','500px'],
  			content:$('#update')
  		});
	});
	$('#add').on('click',function(){
			$('#xuanze').trigger('click');

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

		$("#answer1").on('click',function(){
			$("#myfile").hide(500);
			$("#myanswer").show(500);
		});
        $("#answer2").on('click',function(){
            $("#myquestion").hide(500);
            $("#myanswer").show(500);
        });

		$("#question1").on('click',function(){
			$("#myfile").hide(500);
			$("#myquestion").show(500);
		});

        $("#question2").on('click',function(){
            $("#myanswer").hide(500);
            $("#myquestion").show(500);
        });
        $("#file1").on('click',function () {
           $("#myquestion").hide(500);
           $("#myfile").show(500);
        });
        $("#file2").on('click',function () {
            $("#myanswer").hide(500);
            $("#myfile").show(500);
        });
	});




	//头像预览实现

    function fileReader(obj){
    	var file = obj.files;
    	var img = document.getElementById("img");
    	var reader = new FileReader();// 操作图片
    	if(/image/.test(file[0].type)){
    	reader.readAsDataURL(file[0]);
    	}else {
    	alert('请选择图片!');
    	obj.value = "";
    	return;
    	}
    	// 图片加载错误
    	reader.onerror = function(){
    	document.write("图片加载错误");
    	}
    	// 图片加载完成
    	reader.onload = function(){
    	img.src = reader.result;
    	}
    	}
	//图片上传
    	$('#picinput').on('click',function(){
          var l = layer.load();
        var formData = new FormData();  //创建一个forData
        formData.append('img', $('#xuanze')[0].files[0]); //把file添加进去  name命名为img
        $.ajax({
            url: "${hello}user/update/avatar",
            data: formData,
            type: "POST",
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            success: function(data) {
                layer.msg(data.msg);
                if(data.code === 0)
                {

                    window.location.href=window.location.href;
                    window.location.reload();
                }
            },
            complete: function () {
              layer.close(l);
            }
          });
    });
    var delete_question = function (id, b) {
        $.ajax({
            url: '${hello}user/delete/question',
            type: 'post',
            data: {'questionId': id},
            success: function (data) {
                layer.msg(data.msg);
                if (data.code === 0) {
                    var num = $('#asking-num');
                    b.parent().parent().remove();
                    num.text(parseInt(num.text()) - 1);
                }
            }
        })
    };
    var delete_answer = function (id, b) {
        $.ajax({
            url: '${hello}user/delete/answer',
            type: 'post',
            data: {'answerId': id},
            success: function (data) {
                layer.msg(data.msg);
                if (data.code === 0) {
                    b.parent().parent().remove();
                    var num = $('#answer-num');
                    b.parent().parent().remove();
                    num.text(parseInt(num.text()) - 1);
                }
            }
        })
    };
    var delete_file = function (md5, b) {
        $.ajax({
            url: '${hello}user/delete/file',
            type: 'post',
            data: {'fileMd5': md5},
            success: function (data) {
                layer.msg(data.msg);
                if (data.code === 0) {
                    var num = $('#upload-num');
                    num.text(parseInt(num.text()) - 1);
                    b.parent().parent().remove();
                }
            }
        })
    };

    $('p>img').css('width', '48px');
</script>
</body>
</html>