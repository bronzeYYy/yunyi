<%@ page language="java" contentType="text/html; charset=utf-8"
				 pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head> 
<meta charset="utf-8" /> 
<title>半透明实例在线演示 www.divcss5.com</title> 
<style> 
.div-a{ background:url(image/bj1.jpg)no-repeat;width:230px;height:136px;padding:10px} 
.div-b{ background:#888888;width:200px;height:100px;padding:5px;color:#F00; 
filter:alpha(Opacity=60);-moz-opacity:0.6;opacity: 0.6} 
/* CSS注释说明：这里对CSS代码换行是为了让代码在此我要中显示完整，换行后CSS效果不受影响 */ 
</style> 
</head> 
 
<body> 
<div class="div-a"> 
<div class="div-b">实现DIV半透明实例演示</div> 
</div> 
</body> 
</html> 