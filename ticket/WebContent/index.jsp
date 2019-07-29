<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
   <link href="css/bootstrap.min.css" rel="stylesheet">
   <link href="css/diy.css" rel="stylesheet" />
   <script src="js/jquery.min.js"></script>
   <script src="js/bootstrap.min.js"></script>

<title>小众出行</title>
</head>
<body>
	
	<%@include file="top.jsp" %>

	<!-- 品牌栏 包括导航栏 -->
	<%@ include file="brand.jsp" %>
	
	<!-- 轮播开始 -->
	<!--轮播-->
<div id="myCarousel" class="carousel slide">
	<!-- 搜索框 -->
	<div class="ticket-inquiry">
		<form action="/ticket/BusTicketEnquiry" method="post">
			<div class="is-left">
				出发地:
				<input type="text" name="start" placeholder="成都/chengdu/cd"/>
			</div>
			<div class="is-left padding-top clear">
				目的地:
				<input type="text" name="end" placeholder="绵阳/mianyang/my"/>
			</div>
			<div class="is-left padding-top">
				出发日期:
				<input type="date" name="departure_date" value="2019-06-24"/>
			</div>
			<div class="is-left clear padding-top">
				<button class="serachbtn" type="submit" >查询汽车票</button>
			</div>
		</form>
	</div>
<!-- 轮播（Carousel）指标 -->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
	</ol>   
	<!-- 轮播（Carousel）项目 -->
	<div class="carousel-inner">
		<div class="item active">
			<img src="img/bg1.png" alt="First slide">
		</div>
		<div class="item">
			<img src="img/bg2.png" alt="Second slide">
		</div>
		<div class="item">
			<img src="img/bg3.png" alt="Third slide">
		</div>
	</div>
	<!-- 轮播（Carousel）导航 -->
	<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">	
		<span class="sr-only">Previous</span>
	</a>
	<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">	
		<span class="sr-only">Next</span>
	</a>
</div> 
</div> 
	<!-- 轮播结束  -->
<div>
	<div style="width: 80%;height: 300px;min-width: 1280px;margin: auto;margin-top: -30px;">
		<!-- 热门路线 -->
		<div class="hot is-left">
			<div style="padding-left: 40px;">
				<h4>热门路线</h4>
			</div>
			<ul>
				<li class="hot-detail">
					<p style="text-align: center;line-height: 72px;color: white;">成都-绵阳</p>
				</li>
				<li class="hot-detail">
					<p style="text-align: center;line-height: 72px;color: white;">达州-德阳</p>
				</li>
				<li class="hot-detail">
					<p style="text-align: center;line-height: 72px;color: white;">宜宾-南充</p>
				</li>
			</ul>
			<ul>
				<li class="hot-detail">
					<p style="text-align: center;line-height: 72px;color: white;">乐山-攀枝花</p>
				</li>
				<li class="hot-detail">
					<p style="text-align: center;line-height: 72px;color: white;">眉山-自贡</p>
				</li>
				<li class="hot-detail">
					<p style="text-align: center;line-height: 72px;color: white;">雅安-遂宁</p>
				</li>
			</ul>
		</div>
		
		<!-- 公告 -->
		<div class="notice is-right" style="padding-right: 40px;">
			<div>
				<h4>公告</h4>
			</div>
			<ul class="notice-detail" style="margin-top: 20px;">
				<li style="margin-left: -20px;margin-top: -8px;margin-bottom: -6px;">
					<marquee width=100% height=155px padding-top=-20px direction=up scrollamount=2>
						<p style="font-size: 14px;">2019-6-24&emsp;23:00&emsp;管理员发布了新的公告1</p>
						<p style="font-size: 14px;">2019-6-24&emsp;23:00&emsp;管理员发布了新的公告1</p>
						<p style="font-size: 14px;">2019-6-24&emsp;23:00&emsp;管理员发布了新的公告1</p>
						<p style="font-size: 14px;">2019-6-24&emsp;23:00&emsp;管理员发布了新的公告1</p>
						<p style="font-size: 14px;">2019-6-24&emsp;23:00&emsp;管理员发布了新的公告1</p>
						<p style="font-size: 14px;">2019-6-24&emsp;23:00&emsp;管理员发布了新的公告1</p>
					</marquee>
				</li>
			</ul>
		</div>
	</div>
</div>	
	<%@include file="copyright.jsp" %>
</body>
</html>