<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<style type="text/css">
		.submit{
			margin-left:30px;
			background:mediumseagreen;
			width:100px;
			height:30px;
			color:white;
		}
	</style>
<title>我的资料</title>
</head>
<body>
	<!-- 顶部用户信息栏 -->
	<%@include file="top.jsp" %>
	
	<!-- 品牌栏 -->
	<%@include file="brand.jsp" %>
	   
	<!-- 个人信息详情 --> 
	<div  style="width:100%;height:auto;margin-bottom:50px;min-width:1280px;"> 
		<div style="width:500px;margin:auto;"> 
			<h4>我的出行</h4>
		</div>  
		<div style="width:500px;height:250px;margin:auto;border:1px solid gray;">
			<div style="padding:8px;">丨我的订单 </div>
			
			<c:if test="${requestScope.orders !=null }">
				<div style="width:auto;height:auto;">
					<!-- 通过封装好的order获取订单信息 -->
					<div style="margin-left:30px;padding:6.5px;">出行路线&nbsp;:&nbsp;${order0.route }</div>
					<div style="margin-left:30px;padding:6.5px;">出发日期&nbsp;:&nbsp;${order0.departure_date }</div>
					<div style="margin-left:30px;padding:6.5px;">出发时间&nbsp;:&nbsp;${order0.time }</div>
					<form action="#" method="post">
						<input type="submit" value="申请退票" class="submit"> 
					</form>
				</div> 
			</c:if>
			
		</div> 
	</div>
	
	<!-- 底部版权 -->
	<%@include file="copyright.jsp" %>
</body>
</html>