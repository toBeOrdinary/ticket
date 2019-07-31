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
	<script>
		function myFunction(){
			if(window.confirm("是否购票")){
				return true;
			}
			return false;
		}
	</script>
<title>车票查询</title>
</head>
<body>
	<!-- 顶部用户信息栏 -->
	<%@include file="top.jsp" %>
	
	<!-- 品牌栏 -->
	<%@include file="brand.jsp" %>
	   
	<!-- 个人信息详情 --> 
	<div  style="width:100%;height:auto;margin-bottom:50px;min-width:1280px;"> 
		<div style="width:500px;margin:auto;"> 
			<h4>${sessionScope.route }</h4>
		</div>  
		<div style="width:500px;height:250px;margin:auto;border:1px solid gray;">
			<div style="padding:8px;">丨线路信息 </div>
			<div style="width:auto;height:auto;">
				<div style="margin-left:30px;padding:6.5px;">出行路线&nbsp;:&nbsp;${sessionScope.route }</div>
				<div style="margin-left:30px;padding:6.5px;">出发日期&nbsp;:&nbsp;${sessionScope.departure_date }</div>
				<div style="margin-left:30px;padding:6.5px;">出发时间&nbsp;:&nbsp;08:00</div>
				<div style="margin-left:30px;padding:6.5px;">剩余票数&nbsp;:&nbsp;${sessionScope.count }</div>
				<form action="/ticket/BuyTicket" method="post">
					<input type="submit" value="购票" class="submit" onclick="return myFunctinon()"> 
				</form>
			</div> 
			
		</div> 
	</div>
	
	<!-- 底部版权 -->
	<%@include file="copyright.jsp" %>
</body>
</html>