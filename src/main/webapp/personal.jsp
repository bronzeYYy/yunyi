<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
    <meta charset="UTF-8">
    <title>个人主页</title>
    <link rel="stylesheet" href="${hello}css/personalPage.css">
    <link rel="stylesheet" href="${hello}iconfont/iconfont.css">
    <script src="${hello}js/jquery-3.3.1.min.js"></script>
       <script src="${hello}layer-v3.1.1/layer/layer.js"></script>
       
       
</head>
<body>
    <div class="nav"></div>
    <div class="container">
        <div class="personInfo">
            <div class="top"></div>
            <img src="">
            <div  class="usrname">用户名:${User.userName}
           
             </div>
            <div class="textinfo">
                <span>积分：${User.intergral}</span>
                <span>发布数：${User.askingNumber}</span>
                <span>回答数：${User.answerNumber}</span>
            </div>
            
            <button id="modify" style="">修改个人信息</button>
              <button id="modify" style="margin-top:30px"onclick="window.location='column.jsp'">返回社区</button>
            <div class="bot"></div>
            <div class="detailbtn"><i class="iconfont icon-unfold"></i> <span>详细资料</span></div>
            <div class="detail">
                <p>班&emsp;&emsp;级：${User.userClass}</p>
                <p>学&emsp;&emsp;号：${User.studentNo}</p>
                <p>邮&emsp;&emsp;箱：${User.email}</p>
            </div>
        </div>
        <ul class="menu">
            <li>我的问题</li>
            <li>我的回答</li>
            <li>我的资料</li>
            <li><a id="tiwen">提问</a></li>
            <li><a id="ziliao">上传资料</a></li>
        </ul>
    </div>
    <div class="shadow"></div>
    <div class="hidebox2">
        <label for="choosefile">选择文件</label>
        <input type="file" id="choosefile" style="display: none;">
        <input type="submit" class="submit">
    </div>
  
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
        $('#tiwen').on('click',function(){
        	layer.open({
       			type:2,
       			title:'提交问题',
       			maxmin:true,
       			shadeClose:true,
       			area:['1000px','700px'],
       			content:'input.jsp'
       		});
        });
        $('#ziliao').on('click',function(){
        	layer.open({
       			type:2,
       			title:'上传资料',
       			maxmin:true,
       			shadeClose:true,
       			area:['1000px','700px'],
       			content:'input.jsp'
       		});
        });
      
        $('#modify').on('click',function(){
        	layer.open({
       			type:2,
       			title:'修改信息',
       			maxmin:true,
       			shadeClose:true,
       			area:['400px','533px'],
       			content:'update.jsp'
       		});
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
    </script>
</body>
</html>