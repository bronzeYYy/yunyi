<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<%-- <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>

<html>
<head>
<meta charset="utf-8">
    <title>上传资料</title>
    <!--引入wangEditor.css-->
    <link rel="stylesheet" type="text/css" href="dist/css/wangEditor.min.css">
    <link rel="stylesheet" type="text/css" href="css/style2.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
     <script src="layer-v3.1.1/layer/layer.js"></script>
 
    <style type="text/css">
        /*.container{
            width: 150px;
            height: auto;
            margin: 50px auto;
        }*/
        .container textarea{
            height: 400px;
        }
    </style>
     <style type="text/css">
       

        .hidebox {
            display: none;
            position: absolute;
            width: 390px;
            height: 150px;
            padding: 5px;
            text-align: left;
            background: #bbb;
            border-radius: 10px;
            top: 100px;
            left: 220px;
        }

        .hidebox:after {
            content: '';
            position: absolute;
            width: 0;
            border-top: 20px solid transparent;
            border-bottom: 20px solid transparent;
            border-right: 50px solid #bbb;
            top: 57px;
            left: -50px;
        }

        .hidebox span {
            display: inline-block;
            margin: 5px;
            padding: 0 5px;
            height: 20px;
            font-size: 12px;
            font-family: "黑体";
            color: #fff;
            line-height: 20px;
            text-align: center;
            border-radius: 5px;
            background-color: #555;
            cursor: pointer;
        }
        .hidebox #close{
            display: inline-block;
            position: absolute;
            right: 10px;
            bottom: 10px;
            font-size: 14px;
            cursor: pointer;
        }
        .hidebox #reset{
            display: inline-block;
            position: absolute;
            right: 10px;
            bottom: 10px;
            font-size: 14px;
            cursor: pointer;
        }
    </style>

</head>
<body>

<div class="container">
<%--    <div style="align-items: center;text-align:center"><h1></h1></div>--%>
    <div id="wenjian" style="cursor:pointer; margin-top: 5%">
        <img alt="选择文件图片" src="image/wenjian.png">
        <p>选择文件</p>
        <p id="select" style="display: none;">已选文件：<span id="select-name"></span></p>
    </div>

    <br>
    <div id="show"></div>
    <p>
        <strong>简单介绍你的文件：</strong>
    </p>
    <div id="editor">

    </div>
    <%--<p>
       <strong>文件的类型？</strong>
   </p>
<input style="cursor:pointer" type="text" id="qtype" value="" readonly="readonly">--%>
    <div class="hidebox">
        <span>C/C++</span>
        <span>Java</span>
        <span>Python</span>
        <span>js</span>
        <span>数据库</span>
        <span>网络</span>
        <span>操作系统</span>
        <span>信息安全</span>
        <span>高数</span>
        <span>大物</span>
        <span>线性代数</span>
        <span>概率论</span>
        <span>无机化学</span>
        <span>有机化学</span>
        <span>结构化学</span>
        <span>物理化学</span>
        <span>分析化学</span>
        <span>医学</span>
        <span>建筑</span>
        <span>财经</span>
        <span>植物学</span>
        <span>动物学</span>
        <span>水利水电</span>
        <span>新能源</span>
        <span>84548</span>
        <span>14325</span>
        <span>4a35d</span>
        <span>Ryzen9-3900X</span>
        <div id="reset" >清空</div>
        <div id="close" style="margin-right:50px">确认</div>
    </div>
    <div style="margin-top: 5px">
        <button id="scziliao" style="width:80px;height:30px;background-color: #666666; border-radius:3px; color:#FFFFFF">确认上传</button>
<%--        <span id="upload-result" style="margin-left: 3px">123</span>--%>
    </div>

</div>

<div style="display: none" id="update">

 <input type="file" id="xuanze" style="display:none" />
 <div>
     <button class='file' style='cursor:pointer;text-align:center;margin-left:110px;height:30px;width:100px'  id='picinput'>确认上传</button>
 </div>


</div>

<script type="text/javascript" src="dist/js/lib/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="js/wangEditor.min.js"></script>
<script  src="${hello}css&js/jquery.min.js"></script>
<script src="${hello}layer-v3.1.1/layer/layer.js"></script>
<script>
    var E = window.wangEditor;
    var editor = new E('#editor');
    // 或者 var editor = new E( document.getElementById('editor') )
    editor.create();
      var index = parent.layer.getFrameIndex(window.name);
  	$('#fabu').on('click',function(){

  		var f1 = document.getElementById("title").value;
		var f2 = document.getElementById("textarea1").value;
		$.ajax({
			url:  'question/save',
			type: 'post',
			data: {'questionName':f1,'questionContent':f2},
			success:function(data) {
          layer.msg(data.msg);
				if(data.code === 0)
        {
              parent.layer.close(index);
            window.location.href=window.location.href;
            window.location.reload();
        }
			}
		})

  	});
  	
  	$('#wenjian').on('click',function(){
		$('#xuanze').trigger('click');	
	});

 
    $(function () {   //获取文件信息
        var file = "";
        var fileName = "";
        var fileExt = "";
        $("#xuanze").change(function () {
            //获取文件的value值
            file = $("#xuanze").val()
            //获取文件名+扩展名
            fileName = file.split("\\").pop();
            $('#select').css('display', 'block');
            $('#select-name').text(fileName);
            //获取文件名
            fileName = fileName.substring(0, fileName.lastIndexOf("."));
            //获取文件的扩展名
            fileExt = file.substr(file.indexOf("."));
            //清空DIV容器内容
            $("#").html("");

            // $("#show").append("<input type='text' id='filename' style='color: #000000' value='"+fileName+"'/>");
           // $('#wenjian').css('display','none');
            layer.msg('资料选择完成');
        });
        
      	$('#scziliao').on('click',function(){  //文件上传
      	    /*var result = $('#upload-result');
      	    result.css('display', 'none');*/
            var l = layer.load();
            //var f1 = document.getElementById("title").value;
            var f1 = editor.txt.html();
      		var formData = new FormData();
      		formData.append('file',$('#xuanze')[0].files[0]);
      		formData.append('fileDetail',f1);

      		
      	$.ajax({
                url: "${hello}/file/upload",
                data: formData,
                type: "POST",
                async: false,
                cache: false,
                contentType: false,
                processData: false,
                success: function(data) {
                    //layer.msg(data.msg);
                    /*result.text(data.msg);
                    result.css('display', '');*/

                    /*if(data.code === 0)
                    {
                        window.location.href=window.location.href;
                        window.location.reload();
                    }*/
                    if(data.code === -2) {
                        var md5 = data.data.md5;
                        /*var content = "<h3>文件已存在<a target='_blank' href='file/detail/" + md5 + "'>点击查看</a></h3>";
                        $("#show").append(content);*/
                        var ll = layer.confirm(data.msg, {
                            btn: ['确定','查看'] //按钮
                        }, function(){
                            //layer.msg('的确很重要', {icon: 1});
                            layer.close(ll);
                        }, function(){
                            window.open('/file/detail/' + md5);
                        });
                    } else {
                        layer.alert(data.msg);
                        if (data.code === 0) {
                            parent.window.location.reload();
                        }
                    }
                },
            complete: function () {
                layer.close(l);
            }
              });
        });
        
        
        
    });


  </script>
  <script src="${hello}layer-v3.1.1/layer/layer.js"></script>
<script>
    var ind = parent.layer.getFrameIndex(window.name);
    let oinput=$('#qtype');
    $('#qtype').hover(function(){
    	$('.hidebox').show();
    });
   /* oinput.focus(function () {
       $('.hidebox').show();
    });
*/
    $('.hidebox span').click(function (e) {
        let tagName=$(this).html();
        let text=oinput.val();
        let color=$(this).css('background-color');
        if(color=="rgb(85, 85, 85)"){
            oinput.val(text+tagName+';');
            $(this).css('background-color',"#2196f3");
        }
        else{
            let index=text.indexOf(tagName);
            oinput.val(text.replace(tagName+';',''));
            $(this).css('background-color',"rgb(85, 85, 85)");

        }

    });
    $('#close').click(function () {
        $('.hidebox').hide();
    });
    $('#reset').on('click',function(){
    	document.getElementById('qtype').value="";
    	  $('.hidebox span').css('background-color',"rgb(85, 85, 85)");
    });

</script>
  
  
  
</body>
</html>
