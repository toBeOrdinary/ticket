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
			width:60px;
			height:30px;
			color:white;
		}
	</style>
	<script>
		function myFunction(){
			if(window.confirm("是否退票")){
				return true;
			}
			return false;
		}
	</script>
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
		<div style="width:500px;height:auto;margin:auto;border:1px solid gray;">
			<div style="padding:8px;">丨我的订单 </div>
			<div style="margin-left:30px;padding:6.5px;">
				<table>
					<tr>
						<td style="width:150px">出发地/目的地</td>
						<td style="width:100px;">出发日期</td>
						<td style="width:100px;">发车时间</td>
						<td style="width:100px;"></td>
					</tr>
				</table>			
				<c:forEach items="${orders }" var="order">
					<form action="/ticket/RefundTicket" method="post">
						<input type="hidden" name="route" value="${order.route }">
						<table>
							<tr>
								<td style="width:150px;">${order.route }</td>
								<td style="width:100px;">${order.departure_date }</td>
								<td style="width:100px;">${order.time }</td>
								<td style="width:100px;">
									<input type="submit" value="退票" class="submit" onclick="return myFunction()">
								</td>
							</tr>
						</table>
					</form>
				</c:forEach> 
			</div>
		</div> 
	</div>
	
	<!-- 底部版权 -->
	<%@include file="copyright.jsp" %>
</body>
</html>