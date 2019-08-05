<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="utf-8">
    <title>发表问题</title>
    <!--引入wangEditor.css-->
<%--    <link rel="stylesheet" type="text/css" href="${hello}dist/css/wangEditor.min.css">--%>
    <script src="js/jquery-2.2.3.min.js"></script>
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
        <p style="margin-top: 30px">
            <strong>请选择问题类型：</strong>
        </p>
        <p style="position: relative;">
        <form name="frm">
            <select style="border-style: none;width:100px" id="s1" onChange="redirec(document.frm.s1.options.selectedIndex)">
                <option selected>请选择院系</option>
                <option value="1">计算机系</option>
                <option value="2">化工学院</option>
                <option value="3">农牧学院</option>
                <option value="4">机械学院</option>
                <option value="5">财经学院</option>
                <option value="6">医学院</option>
                <option value="7">土木学院</option>
                <option value="8">其他</option>

            </select>
            &emsp;&emsp;
            <select style="border-style: none;width:100px"  id="s2">
                <option selected>请选择类型</option>
            </select>
        </form>
        </p>
        <p>
            <strong>请简单描述你的问题：</strong>
        </p>
            <input style="height:30px" type="text" id="title" value="">
        <p style="margin-top: 50px">
            <strong>说说问题的提出背景：</strong>
        </p>
        <div id="textarea1" style="text-align: left">

        </div>

        <p>
            <input id="fabu" style="width:50px;height:30px;background-color: #666666; border-radius:3px; color:#FFFFFF"
                   type="submit" value="提交">
        </p>

    </div>
</div>


<%--<script type="text/javascript" src="${hello}dist/js/lib/jquery-1.10.2.min.js"></script>--%>
<script type="text/javascript" src="${hello}js/wangEditor.min.js"></script>

<script type="text/javascript">
    let editor = new wangEditor('#textarea1');
    // 上传图片（举例）
    //editor.config.uploadImgFileName = 'myFileName';
    let l;
    editor.customConfig.uploadImgServer = '/user/upload';
    editor.customConfig.uploadImgHooks = {
        before: function (xhr, editor, files) {
            // 图片上传之前触发
            // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象，files 是选择的图片文件

            // 如果返回的结果是 {prevent: true, msg: 'xxxx'} 则表示用户放弃上传
            // return {
            //     prevent: true,
            //     msg: '放弃上传'
            // }
            l = layer.load();
        },

        error: function (xhr, editor) {
            // 图片上传出错时触发
            // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象
            layer.msg('上传错误');
            layer.close(l);
        },
        timeout: function (xhr, editor) {
            // 图片上传超时时触发
            // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象
            layer.msg('上传超时，请检查网络');
            layer.close(l);
        },
        fail: function (xhr, editor, result) {
            // 图片上传并返回结果，但图片插入错误时触发
            // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象，result 是服务器端返回的结果
            layer.msg(JSON.parse(xhr.responseText).msg);
            layer.close(l);
        },
        success: function (xhr, editor, result) {
            // 图片上传并返回结果，图片插入成功之后触发
            // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象，result 是服务器端返回的结果
            layer.close(l);
        },
    };
    editor.customConfig.customAlert = function (info) {
        // info 是需要提示的内容
    };
    editor.create();
</script>
<script src="${hello}layer-v3.1.1/layer/layer.js"></script>
<script>
$(document).ready(function() {

    $('#show').on('click',function () {
        var index = document.getElementById('s2').selectedIndex;
        var option2 = document.getElementById('s2').options[index].text;
    });
    $('#fabu').on('click', function () {
        var l = layer.load();
        var index1 = document.getElementById('s2').selectedIndex;
        var option2 = document.getElementById('s2').options[index1].text;
        //alert(option2);
        var index2 = document.getElementById('s1').selectedIndex;
        var option1 = document.getElementById('s1').options[index2].text;
        //alert(option1);

        var f1 = document.getElementById("title").value;
        var f2 = document.getElementById("textarea1").value;
        $.ajax({
            url: 'question/save',
            type: 'post',
            data: {'questionName': f1, 'questionContent': editor.txt.html(), 'name1': option1, 'name2': option2},
            success: function (data) {
                layer.close(l);
                layer.msg(data.msg);
                if (data.code === 0) {
                    /*parent.layer.close(ind);
                    window.location.href = window.location.href;*/
                    parent.window.location.reload();
                }
            },
            complete: function () {
                layer.close(l);
            }
        });
    });
});
</script>
<script>
    //获取一级菜单长度

    var select1_len = document.frm.s1.options.length;
    var select2 = new Array(select1_len);
    //把一级菜单都设为数组
    for (i=0; i<select1_len; i++)
    { select2[i] = new Array();}
    //定义基本选项
    select2[0][0] = new Option("请选择", " ");

    select2[1][0] = new Option("office", " ");
    select2[1][1] = new Option("Ps", " ");
    select2[1][2] = new Option("3DsMax", " ");
    select2[1][3] = new Option("C/C++", " ");
    select2[1][4] = new Option("Java", " ");
    select2[1][5] = new Option("Python", " ");
    select2[1][6] = new Option("Javascript", " ");
    select2[1][7] = new Option("TCP/IP", " ");
    select2[1][8] = new Option("网络安全", " ");
    select2[1][8] = new Option("CPU", " ");
    select2[1][10] = new Option("进程管理", " ");
    select2[1][11] = new Option("内存管理", " ");
    select2[1][12] = new Option("磁盘管理", " ");


    select2[2][0] = new Option("醇，醚", " ");
    select2[2][1] = new Option("醛，酮", " ");
    select2[2][2] = new Option("酚，醌", " ");
    select2[2][3] = new Option("有机合成", " ");
    select2[2][4] = new Option("原子结构", " ");
    select2[2][5] = new Option("分子机构", " ");
    select2[2][6] = new Option("分子对称性", " ");
    select2[2][7] = new Option("晶体结构", " ");
    select2[2][8] = new Option("化学热力学", " ");
    select2[2][9] = new Option("相平衡", " ");
    select2[2][10] = new Option("化学动力学", " ");
    select2[2][11] = new Option("表面物理化学", " ");
    select2[2][12] = new Option("误差与数据处理", " ");
    select2[2][13] = new Option("酸碱滴定", " ");
    select2[2][14] = new Option("配位滴定", " ");
    select2[2][15] = new Option("氧化还原滴定", " ");


    select2[3][0] = new Option("植物科学与技术", " ");
    select2[3][1] = new Option("农学、园艺、茶学、烟草", " ");
    select2[3][2] = new Option("植物保护", " ");
    select2[3][3] = new Option("种子科学与工程", " ");
    select2[3][4] = new Option("应用生物学", " ");
    select2[3][5] = new Option("生物化学", " ");
    select2[3][6] = new Option("免疫学", " ");
    select2[3][7] = new Option("医学", " ");
    select2[3][8] = new Option("生物物理学", " ");
    select2[3][9] = new Option("林学", " ");
    select2[3][10] = new Option("森林保护", " ");
    select2[3][11] = new Option("林学（城市林业方向）", " ");
    select2[3][12] = new Option("林学（森林防火方向）", " ");
    select2[3][13] = new Option("森林培育", " ");
    /*select2[3][14] = new Option("林木遗传育种", " ");
    select2[3][15] = new Option("森林病虫鼠害防治与检疫", " ");
    select2[3][16] = new Option("野生植物资源开发利用", " ");*/
    select2[3][14] = new Option("动物检疫学", " ");
    select2[3][15] = new Option("自然保护区管理", " ");
    select2[3][16] = new Option("野生动物组织解剖学", " ");
    select2[3][17] = new Option("动物遗传育种与繁殖学的技术人工繁殖", " ");

    select2[4][0] = new Option("机械工业自动化", " ");
    select2[4][1] = new Option("电力电子", " ");
    select2[4][2] = new Option("计算机应用", " ");
    select2[4][3] = new Option("机械制造", " ");
    select2[4][4] = new Option("电子工程", " ");
    select2[4][5] = new Option("金属材料工程", " ");
    select2[4][6] = new Option("高分子材料与工程", " ");
    select2[4][7] = new Option("无机非金属材料工程", " ");
    select2[4][8] = new Option("材料成型及控制工程", " ");
    select2[4][9] = new Option("物流工程", " ");
    select2[4][10] = new Option("虚拟制造", " ");
    select2[4][11] = new Option("企业资源计划(ERP)", " ");
    select2[4][12] = new Option("人力资源管理", " ");
    select2[4][13] = new Option("复杂系统控制理论与应用", " ");
    select2[4][14] = new Option("智能控制理论研究与应用", " ");
    select2[4][15] = new Option("计算机控制系统", " ");
    select2[4][16] = new Option("网络控制理论及其应用", " ");

    select2[5][0] = new Option("管理", " ");
    select2[5][1] = new Option("管理", " ");
    select2[5][2] = new Option("经济", " ");
    select2[5][3] = new Option("法律", " ");
    select2[5][4] = new Option("教学", " ");
    select2[5][5] = new Option("科研", " ");
    select2[5][6] = new Option("管理", " ");
    select2[5][7] = new Option("经济", " ");
    select2[5][8] = new Option("法律", " ");
    select2[5][9] = new Option("教学", " ");
    select2[5][10] = new Option("科研工商管理", " ");
    select2[5][11] = new Option("马克思主义经济学基本原理", " ");
    select2[5][12] = new Option("国际经济", " ");
    select2[5][13] = new Option("国际贸易的基本理论", " ");
    select2[5][14] = new Option("现代企业管理方法", " ");
    select2[5][15] = new Option("营销", " ");
    select2[5][16] = new Option("会计", " ");


    select2[6][0] = new Option("自然科学", " ");
    select2[6][1] = new Option("生命科学", " ");
    select2[6][2] = new Option("医学科学", " ");
    select2[6][3] = new Option("生物学", " ");
    select2[6][4] = new Option("内科", " ");
    select2[6][5] = new Option("耳鼻喉科", " ");
    select2[6][6] = new Option("眼科", " ");
    select2[6][7] = new Option("肿瘤学", " ");
    select2[6][8] = new Option("麻醉学", " ");
    // select2[6][9] = new Option("急诊医学", " ");
    select2[6][9] = new Option("藏医医疗", " ");
    select2[6][10] = new Option("藏药研发", " ");
    select2[6][11] = new Option("认药、制药、用药", " ");
    select2[6][12] = new Option("护理学基础", " ");
    select2[6][13] = new Option("护理药械", " ");
    select2[6][14] = new Option("中药护理", " ");
    select2[6][15] = new Option("医院感染控制", " ");
    select2[6][16] = new Option("病理生理学", " ");
    // select2[6][18] = new Option("急救护理", " ");
    // select2[6][19] = new Option("老年护理学", " ");

    /*select2[7][0] = new Option("建筑工程技术与应用", " ");
    select2[7][1] = new Option("建筑工程测量", " ");
    select2[7][2] = new Option("供热通风与空调工程技术", " ");
    select2[7][3] = new Option("给水排水工程", " ");*/
    select2[7][0] = new Option("道路勘测设计", " ");
    select2[7][1] = new Option("道路工程", " ");
    select2[7][2] = new Option("路基路面工程", " ");
    select2[7][3] = new Option("施工技术与组织", " ");
    select2[7][4] = new Option("工民建", " ");
    select2[7][5] = new Option("城市规划", " ");
    select2[7][6] = new Option("给水排水工程", " ");
    select2[7][7] = new Option("城市地下空间工程", " ");
    select2[7][8] = new Option("景观建筑设计", " ");
    // select2[7][13] = new Option("计房地产开发管理", " ");
    select2[7][9] = new Option("理论力学", " ");
    select2[7][10] = new Option("材料力学", " ");
    select2[7][11] = new Option("弹性力学", " ");
    select2[7][12] = new Option("塑性力学", " ");
    select2[7][13] = new Option("断裂力学", " ");
    select2[7][14] = new Option("分析力学", " ");
    /*select2[7][20] = new Option("桥梁结构工程与抗震分析", " ");
    select2[7][21] = new Option("桥隧检测、加固技术与可靠性分析", " ");
    select2[7][22] = new Option("桥隧工程仿真分析", " ");
    select2[7][23] = new Option("隧道设计理论与优化", " ");
    select2[7][24] = new Option("隧道施工新技术及信息化", " ");*/
    select2[7][15] = new Option("道路交通工程", " ");
    select2[7][16] = new Option("河湖水系工程、地下管线工程", " ");
    select2[7][17] = new Option("架空杆线工程", " ");
    select2[7][18] = new Option("街道绿化工程", " ");

    select2[8][0] = new Option("其它", " ");

    //联动函数
    function redirec(x)
    {
        var temp = document.frm.s2;
        temp.innerHTML='';
        for (i=0;i<select2[x].length;i++)
        {
            temp.options[i]=new Option(select2[x][i].text,select2[x][i].value);
        }
        temp.options[0].selected=true;
    }
</script>
</body>
</html>
