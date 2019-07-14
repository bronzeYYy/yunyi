<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%--<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>

<head>
<title>问题详情页</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <link rel="${hello}stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
   <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
   <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
   <script src="${hello}layer-v3.1.1/layer/layer.js"></script>
<style>
body{
color:white;
}
a{ 
text-decoration:none; 
color:white; 
} 
    a:link {color: #FFFFFF;} /* 未访问的链接 */
    a:visited {color: #DC143C;} /* 已访问的链接 */
    a:hover{color: #CCFFFF;} /*鼠标在链接上 */ 
    a:active {color: #00FFFF;} /* 点击激活链接：在你点击该链接后，页面正在转向新地址的时候，链接显示此颜色 */
</style>
</head>



<body style="background-color:#778899">

<div class="container">
    <div class="row-md-12">
        
        <div class="col-md-12" >
					<br>
					 <p ><strong><h3>问题名：${Question.questionName}</h3></strong></p>
					 <p ><strong><h4>问题详情：${Question.questionContent}</h4></strong></p>
					
			 <div class="row">
					<div class="col-md-2" >
					<p><br>
					<button id="huida" type="submit" class="btn btn-default"><span class="glyphicon glyphicon-pencil"></span>&nbsp;我来回答</button>
					</div>
					<div class="col-md-10 col-md-pull-1">
					<p align=right><br><br><br><br>
					<span class="glyphicon glyphicon-user"></span> <a href="#">发表人：${Question.questioner.userName}</a>
					&nbsp;
					<text>创建时间: ${Question.creationTime}</text>
					</p>
					</div>
			 </div>


			<br>
            <div class="col-md-12" style=" box-shadow: inset 1px -1px 1px #444, inset -1px 1px 1px #444;">
                    <h5><b><p>评论列表</p></b></h5>
            </div>		
            <table>
            <c:forEach var="i" items="${comment}">
      		<tr>
            <div class="row">
            	
                    <br>
                    <div style="width:100px;height:100px;float:left;margin-top:20px;margin-left:30px">
						<p><img src="" width=45px height=45px></p>
						<p><a href="#">用户名:  ${i.responder.userName}</a></p>
					</div>
               
				<div style="width:500px;height:100px;float:left;margin-top:20px;margin-left:30px;">
					<h3>评论内容:${i.answerContent}</h3>
				</div>
				<div style="width:100px;height:100px;float:left;margin-top:20px;margin-left:30px;">	
					<h4 style="line-height:80px">第${i.id}楼</h4>
				</div>
				<div style="width:300px;height:100px;float:left;margin-top:20px;margin-left:30px;">
					
				<font style="line-height:100px">发表日期 ${i.answerTime}</font>
					&emsp;&emsp;&emsp;
					<a id="doubleclick"><span class="glyphicon glyphicon-thumbs-up"></span></a>&nbsp;&nbsp;&nbsp;<text>点赞数:</text>
					&emsp;&emsp;&emsp;
					<a id="huifu" href="#"><span class="glyphicon glyphicon-comment"></span>&nbsp;&nbsp;回复</a>
				</div>
            </div>
            <hr>
            </tr>
          </c:forEach>
          
          </table>
        </div>
    </div>
</div>
   <script src="${hello}layer-v3.1.1/layer/layer.js"></script>
<script>
	$('#huida').on('click',function(){
		layer.open({
   			type:2,
   			title:'评论界面',
   			maxmin:true,
   			shadeClose:true,
   			area:['1000px','700px'],
   			content:'answer.jsp'
   		});

});
	</script>
	<script>
	$('#huifu').on('click',function(){
		layer.open({
   			type:2,
   			title:'评论界面',
   			maxmin:true,
   			shadeClose:true,
   			area:['1000px','700px'],
   			content:'answer.jsp'
   		});

});
</script>
</body>
</html>