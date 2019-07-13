<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%-- <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<head>
<title>问题详情页</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
   <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
   <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
   <script src="layer-v3.1.1/layer/layer.js"></script>
</head>
<body>


<div class="container">
    <div class="row-md-12">
        
        <div class="col-md-12" >
		
                    <p align=left>
					<span class="glyphicon glyphicon-user"></span> <a href="#">用户名</a>
					&nbsp;
					<h4>发表于（日期）</h4>
					</p>
					 <p><h4>(问题)</h4></p>
					<p>
				
					<button id="huida" type="submit" class="btn btn-default">我来回答</button>
					<p>
					
      
            <div class="col-md-12" style=" box-shadow: inset 1px -1px 1px #444, inset -1px 1px 1px #444;">
                    <h5><b><p>评论列表</p></b></h5>
            </div>
			
					
            <div class="row">
                <div class="col-md-2" >
                    <br>
					<p><img src="image/downloading.ico" width=45px height=45px></p>
					<p><a href="#">用户名</a></p>
                </div>
				<div class="col-md-10 col-md-pull-1">
					<br>
					<p><text>评论内容</text></p>
					<br>
					<p align=right>
					<text>第#楼</text>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					发表日期
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="#"><span class="glyphicon glyphicon-thumbs-up"></span></a>&nbsp;&nbsp;&nbsp;<text>点赞数</text>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a id="huifu" href="#"><span class="glyphicon glyphicon-comment"></span>&nbsp;&nbsp;回复</a>
				</div> 
            </div>
          


        </div>
    </div>
</div>
   <script src="layer-v3.1.1/layer/layer.js"></script>
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