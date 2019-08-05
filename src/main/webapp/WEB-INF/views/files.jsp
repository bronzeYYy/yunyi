<%--@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" --%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="utf-8">
    <c:if test="${empty param.page}">
        <c:redirect url="${hello}files?page=1"/>
    </c:if>
    <title>资料专栏</title>
<%--    <link rel="stylesheet" href="${hello}css&js/bootstrap.min.css">--%>
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

        .content-p {
            display: block;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
            -webkit-box-orient: vertical;
        }

        tr, td {
            vertical-align: middle;
        }
    </style>

    <style type="text/css">
        a:link,a:visited{
            text-decoration:none;
        }
        a:hover{
            text-decoration:none;
        }
        .page {
            margin-right: 5px;
            padding: 7px;
            border-radius: 2px;
            border: 1px solid #000000;
        }
    </style>
    <style type="text/css">


    </style>
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!---->
<%--    <link href='http://fonts.useso.com/css?family=Raleway:400,200,100,300,500,600,700,800,900' rel='stylesheet' type='text/css'>--%>
<%--    <link href='http://fonts.useso.com/css?family=Open+Sans+Condensed:300,300italic,700' rel='stylesheet' type='text/css'>--%>

<%--    <link href="${hello}css&js/styles.css" rel="stylesheet">--%>
    <link rel="stylesheet" type="text/css" href="${hello}css&js/component.css" />

    <link href="${hello}css&js/animate.min.css" rel="stylesheet">
    <script src="${hello}css&js/wow.min.js"></script>
    <script>
        new WOW().init();
    </script>
    <!-- //animation-effect -->

<%--    <script src="${hello}css&js/jquery.min.js"></script>--%>
<%--    <script src="${hello}css&js/bootstrap.min.js"></script>--%>

</head>
<body style="background-color:#F6F6F6;background-repeat :no-repeat;background-position: right bottom;background-attachment:fixed;">
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="${hello}index">返回首页</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a style="font-size:20px;color:#888888" href="${hello}files" id="test">所有</a></li>
                <li class="active"><a class="scroll" href="${hello}files?name1=计算机系&page=1" id="cpu">计算机系</a></li>
                <li class="active"><a class="scroll" href="${hello}files?name1=化工学院&page=1" id = "chemical">化工学院</a></li>
                <li class="active"><a class="scroll" href="${hello}files?name1=农牧学院&page=1" id ="husbandry">农牧学院</a></li>
                <li class="active"><a class="scroll" href="${hello}files?name1=机械学院&page=1" id="machinery">机械学院</a></li>
                <li class="active"><a class="scroll" href="${hello}files?name1=财经学院&page=1" id="economy">财经学院</a></li>
                <li class="active"><a class="scroll" href="${hello}files?name1=医学院&page=1" id="medical">医学院</a></li>
                <li class="active"><a class="scroll" href="${hello}files?name1=土木学院&page=1" id="build">土木学院</a></li>
                <li class="active"><a class="scroll" href="${hello}files?name1=其它&page=1">其它</a></li>
                <%--<li>
                    <a style="color:#FFFFFF" href="${hello}user"><c:if test="${not empty user}">
                        ${user.userName}
                    </c:if> </a>
                </li>--%>
            </ul>
            <ul class="nav navbar-nav pull-right">
                <li>
                    <a style="color:#FFFFFF" href="${hello}user">${not empty user.userName ? user.userName:'登陆'}</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="hidebar"></div>
<script>
    var data=[[{title:"软件使用",content:["office","Ps","3DsMax"], belong:'计算机系'},
        {title:"编程语言",content:["C/C++","Java","Python","Javascript"], belong:'计算机系'},
        {title:"计算机网络",content:["TCP/IP","网络安全"], belong:'计算机系'},
        {title:"计算机系统平台",content:["CPU","进程管理","内存管理","磁盘管理"], belong:'计算机系'}],

        [{title:"有机化学",content:["醇，醚","醛，酮","酚，醌","有机合成"], belong:'化工学院'},
            {title:"结构化学",content:["原子结构","分子机构","分子对称性","晶体结构"], belong:'化工学院'},
            {title:"物理化学",content:["化学热力学","相平衡","化学动力学","表面物理化学"], belong:'化工学院'},
            {title:"分析化学",content:["误差与数据处理","酸碱滴定","配位滴定","氧化还原滴定"], belong:'化工学院'}],


        [{title:"植物生产",content:["植物科学与技术","农学、园艺、茶学、烟草","植物保护","种子科学与工程","应用生物学"], belong:'农牧学院'},
            {title:"动物生产",content:["生物化学","免疫学","医学","生物物理学"], belong:'农牧学院'},
            {title:"林学草学",content:["林学","森林保护","林学（城市林业方向）","林学（森林防火方向）","森林培育"/*,"林木遗传育种","森林病虫鼠害防治与检疫","野生植物资源开发利用"*/], belong:'农牧学院'},
            {title:"自然保护",content:["动物检疫学","自然保护区管理","野生动物组织解剖学","动物遗传育种与繁殖学的技术人工繁殖"], belong:'农牧学院'}],


        [{title:"机械电子",content:["机械工业自动化","电力电子","计算机应用","机械制造","电子工程"], belong:'机械学院'},
            {title:"材料",content:["金属材料工程","高分子材料与工程","无机非金属材料工程","材料成型及控制工程"], belong:'机械学院'},
            {title:"工业工程",content:["物流工程","虚拟制造","企业资源计划(ERP)","人力资源管理"], belong:'机械学院'},
            {title:"控制工程",content:["复杂系统控制理论与应用","智能控制理论研究与应用","计算机控制系统","网络控制理论及其应用"], belong:'机械学院'}],


        [{title:"市场营销",content:["管理","经济","法律","教学","科研"], belong:'财经学院'},
            {title:"人力资源管理",content:["管理","经济","法律","教学","科研工商管理"], belong:'财经学院'},
            {title:"国际贸易",content:["马克思主义经济学基本原理","国际经济","国际贸易的基本理论"], belong:'财经学院'},
            {title:"企业管理",content:["现代企业管理方法","营销","会计"], belong:'财经学院'}],

        [{title:"基础医学",content:["自然科学","生命科学","医学科学","生物学"], belong:'医学院'},
            {title:"临床医学",content:["内科","耳鼻喉科","眼科","肿瘤学","麻醉学"/*,"急诊医学"*/], belong:'医学院'},
            {title:"藏医学",content:["藏医医疗","藏药研发","认药、制药、用药"], belong:'医学院'},
            {title:"护理学",content:["护理学基础","护理药械","中医护理","医院感染控制","病理生理学"/*,"急救护理","老年护理学"*/], belong:'医学院'}],

        [/*{title:"建筑工程",content:["建筑工程技术与应用","建筑工程测量","供热通风与空调工程技术","给水排水工程"], belong:'土木学院'},*/
            {title:"交通土建工程",content:["道路勘测设计","道路工程","路基路面工程","施工技术与组织"], belong:'土木学院'},
            {title:"建设与房地产",content:["工民建","城市规划","给水排水工程","城市地下空间工程","景观建筑设计"/*,"计房地产开发管理"*/], belong:'土木学院'},
            {title:"工程力学",content:["理论力学","材料力学","弹性力学","塑性力学","断裂力学"/*,"分析力学"*/], belong:'土木学院'},
            /*{title:"桥隧与地下工程",content:["桥梁结构工程与抗震分析","桥隧检测、加固技术与可靠性分析","桥隧工程仿真分析"," 隧道设计理论与优化"," 隧道施工新技术及信息化"], belong:'土木学院'},*/
            {title:"市政工程",content:["道路交通工程","河湖水系工程、地下管线工程","架空杆线工程","街道绿化工程"], belong:'土木学院'}]
    ];
    var hide=$('.hidebar');
    var id=0;
    data.forEach(function (item,index) {
        var newnode=$("<div class='hidebar1'></div>");
        hide.append(newnode);
    });

</script>
<%--<div id="zhuye" class="header" style="background-image :url(${hello}image/beijing.jpg);background-repeat:no-repeat; height:100%; width:100%;"  id="shouye">
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

</div>--%>
<div id="main" style="width:100%;">
    <div class="container" style="margin-top: 5%">
        <%--<div class="footer_grids" style="text-align:center;margin-left:380px">
          <div class="col-md-8 footer_grid_right" >
            <input  type="button" id="iwant" value="我要提问">

          </div>
          <br>

          <div class="clearfix"> </div>
        </div>--%>
        <div style="padding: 20px; background-color: #FFFFFF">
            <%--		--%>
            <div style="font-size: 15px; line-height: 25px">
                <h2>${columnName}</h2>
                <div style="margin-top: 10px; color: #646464">
                    ${columnDetail}
                </div>
            </div>
            <%--	下方操作按钮组--%>
            <div style="margin-top: 10px">
                <button class="btn btn-success" id="ishang">上传</button>
                <c:choose>
                    <c:when test="${not empty param.order and param.order eq 2 }">
                        <a style="margin-left: 5px; padding: 10px; color: #646464;" href="${hello}files?name1=${param.name1}&name2=${param.name2}&order=1&page=${param.page}"><span>按时间排序</span></a>
                    </c:when>
                    <c:otherwise>
                        <a style="margin-left: 5px; padding: 10px; color: #646464;" href="${hello}files?name1=${param.name1}&name2=${param.name2}&order=2&page=${param.page}"><span>按热度排序</span></a>
                    </c:otherwise>
                </c:choose>
                <a style="padding: 10px; color: #646464;" href="${hello}column?name1=${param.name1}&name2=${param.name2}&order=1&page=1"><span>问答</span></a>
                <a style="padding: 10px; color: #646464;"><span>当前栏目：${empty param.name2 ? param.name1 : param.name2}</span></a>

                <%--<label class="control-label">
                    &nbsp;<input class="form-control" type="text" placeholder="要搜索的内容" name="searchContent" value="${param.searchContent}">
                </label>
                <a style="padding: 10px; color: #646464; cursor: pointer" id="search">搜索</a>--%>
            </div>
        </div>

        <hr style=" height:2px;border:none;border-top:2px dotted #808080;" />
        <%--	<hr  style="height:3px;border:none;border-top:5px ridge;" >--%>
        <div id="left" style="background-color: #FFFFFF; padding: 20px; margin-bottom: 15px">
            <div>
                <c:forEach var="i" items="${files}">
                    <div>
                            <%--							<font style="size:20px;color:#989898;">${i.creationTime }</font>--%>
                        <h3>
                            <a style="color:#1A1A1A" href="${hello}file/detail/${i.md5}">
                                <img alt="图标" width="50px" src="${hello}images/ge/${i.fileType}.png">
                                    ${i.fileName }</a>
                          <small style="color: #ff0080">${i.name1}</small>
                            <span style="float: right; font-size: 13px; color: #999999">${i.creationTime }</span>
                        </h3><br>
                        <p class="content-p" style="color:#000000">${i.fileDetail }</p><br>
                                <p>
                                    <span>下载：${i.downloadNum}</span>
                                    <span style="margin-left: 10px">大小: ${i.fileSize}${i.sizeUnit}
                                </span>
                                </p>
                                <%--<span>
                                    <img onclick="star(${i.md5})" id="clickit" style="cursor:pointer;width:20px;height:20px" src="${hello}image/dianzan1.png"><font style="color:#000000">${i.likenum}</font>&emsp;
                                    文件大小: ${i.fileSize}${i.sizeUnit}
                                </span>--%>
                        <%--<a href="${hello}question/detail/${i.md5}">
                            <img style="width:18px;height:18px" src="${hello}image/pinglun.png"><font style="color:#000000">${i.commentNum}</font>
                        </a>--%>
                        <hr style=" height:2px;border:none;border-top:2px dotted #808080;" />
                    </div>
                </c:forEach>
            </div>
        </div>
            <div class="footer_top_agileits">
                <div style="float: left; margin-top: 5px;">
                    <c:if test="${param.page > 1}">
                        <a href="${hello}files?name1=${param.name1}
								&order=${param.order}&page=${param.page - 1}" class="page">上一页</a>
                    </c:if>
                    <c:forEach begin="1" end="${pages}" step="1" var="i">
                        <c:choose>
                            <c:when test="${not empty param.page and i eq param.page or empty param.page and i eq 1}">
                                <span style="margin-right: 5px">${i}</span>
                            </c:when>
                            <c:otherwise>
                                <a href="${hello}files?name1=${param.name1}
								&order=${param.order}&page=${i}"
                                   class="page">
                                        ${i}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:if test="${empty param.page or param.page < pages}">
                        <a href="${hello}files?name1=${param.name1}
						&order=${param.order}&page=${param.page + 1}" class="page">下一页</a>
                    </c:if>
                </div>
                <div style=" float:right" align="center">

                    <a style="margin-top:50px">侵权举报 网上有害信息举报专区</a><p style="margin-top:10px"></p>
                    <a >违法和不良信息举报：15500545625</a><p style="margin-top:10px"></p>
                    <a >色情信息举报专区</a><p style="margin-top:10px"></p>
                    <a>证照中心</a><p style="margin-top:10px"></p>
                    <a >联系我们 @云易校园知识问答平台</a><p style="margin-top:10px"></p>

                </div>
            </div>
    </div>
</div>


<script type="text/javascript" src="${hello}css&js/move-top.js"></script>
<script type="text/javascript" src="${hello}css&js/easing.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function($) {
        $(".scroll").click(function(event){
            //event.preventDefault();
            $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
        });
    });

    $('#ishang').on('click',function(){
        layer.open({
            type:2,
            title:'上传资料',
            maxmin:true,
            shadeClose:true,
            area:['50%','90%'],
            content:'${hello}answer.jsp'
        });
    });
    var star = function star (id) {
        $.ajax({
            url:  '${hello}file/star',
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
    };



    /*var div_x_1 = 230;
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
    }*/

    $('p>img').css('width', '48px');
</script>

</body>
</html>