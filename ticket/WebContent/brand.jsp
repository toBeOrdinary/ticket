<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">   
   <link href="css/bootstrap.min.css" rel="stylesheet">
   <link href="css/diy.css" rel="stylesheet" />
</head>
<body>
	<script>
	 
	window.onload = function(){
	    var obj = document.getElementById('brand');
	    obj.onclick=function(){  
	        window.location.href="/ticket/index.jsp";            
	     }
	 }

	</script>
		
	<!-- 品牌栏 包括导航栏 -->
		
	<!-- 品牌开始 -->
	<div class="div_two" id="brand">		
		<div class="is-left">
			<img src="img/brand.png" class="img_brand_left"/>
		</div>	
		<div class="is-right">
			<img src="img/gonglukeyunshoupiaowang.png" class="img_brand_right"/>
		</div>
	</div>
	<!-- 品牌结束 -->
	
	<!-- three开始 -->
	<div id="three" class="div_three">
		<a href="/ticket/index.jsp" style="margin-left: 200px;">首页</a>
		<a href="#" style="margin-left: 30px;">汽车票</a>
		<a href="#" style="margin-left: 30px;">帮助中心</a>
		<a href="#" style="margin-left: 30px;">关于我们</a>	
	</div>
	<!-- three结束 -->
</body>
</html>