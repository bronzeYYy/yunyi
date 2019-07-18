<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<%-- <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>

<html>
<head>
    <meta charset="utf-8">
    <title>发表问题</title>
    <!--引入wangEditor.css-->
    <link rel="stylesheet" type="text/css" href="${hello}dist/css/wangEditor.min.css">
    <style type="text/css">
        .container {
            width: 800px;
            height: auto;
            margin: 50px auto;
        }

        .container textarea {
            height: 400px;
        }

        #title, #qtype {
            width: 300px;
        }

        .hidebox {
            display: none;
            position: absolute;
            width: 390px;
            height: 150px;
            padding: 5px;
            text-align: left;
            background: #bbb;
            border-radius: 10px;
            top: 114px;
            right: 162px;
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
<body align="center">

<div class="container" style="align-content: center">
    <div style="align-items: center"><h1></h1></div>
    <div>
        <p>
            <strong>请简单描述你的问题：</strong>
        </p>
        <p>
            <input type="text" id="title" value="">
        </p>
        <p style="margin-top: 30px">
            <strong>请选择问题类型：</strong>
        </p>
        <p style="position: relative;">
            <input style="cursor:pointer" type="text" id="qtype" readonly="readonly">
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
        </p>
        <p style="margin-top: 50px">
            <strong>说说问题的提出背景：</strong>
        </p>
        <p>
            <textarea id="textarea1" value=""></textarea>
        </p>
        <p>
            <input id="fabu" style="width:50px;height:30px;background-color: #666666; border-radius:3px; color:#FFFFFF"
                   type="submit" value="提交">
        </p>

    </div>
</div>


<script type="text/javascript" src="${hello}dist/js/lib/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${hello}dist/js/wangEditor.min.js"></script>

<script type="text/javascript">
    var editor = new wangEditor('textarea1');
    // 上传图片（举例）

    editor.config.uploadImgFileName = 'myFileName';
    editor.create();
</script>
<script src="${hello}layer-v3.1.1/layer/layer.js"></script>
<script>
$(document).ready(function() {
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
    $('#fabu').on('click', function () {

        var f1 = document.getElementById("title").value;
        var f2 = document.getElementById("textarea1").value;
        $.ajax({
            url: 'question/save',
            type: 'post',
            data: {'questionName': f1, 'questionContent': f2},
            success: function (data) {
                layer.msg(data.msg);
                if (data.code === 0) {
                    parent.layer.close(ind);
                    window.location.href = window.location.href;
                    window.location.reload();
                }

            }
        })

    });
)};

</script>
</body>
</html>
