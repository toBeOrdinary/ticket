<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
</head>
<body>
<!-- top栏开始 -->
	<div class="div_one">
		<div id="one" class="divtop">
					
		<!-- 第一次进入首页面，为session域中 user设置初始值 -->
		<%
			if(request.getSession().getAttribute("user")==null){
				request.getSession().setAttribute("user","null");	
			}		
		%>
			
			<c:if test="${sessionScope.user !='null' }">
				<a href="/ticket/userInfo.jsp" style="margin-left: 750px;">您好，${sessionScope.username }</a>
				<a href="/ticket/LogoutServlet" style="margin-left:30px;">安全退出</a>
			</c:if>
			<c:if test="${sessionScope.user=='null' }">
		 		<a href="/ticket/login.jsp" style="margin-left: 750px;">登录</a>
				<a href="/ticket/register.jsp" style="margin-left:15px;">注册</a>
			</c:if>
			<a href="/ticket/MyOrders" style="margin-left: 50px;">我的订单</a>
			<a href="#" style="margin-left: 15px;">我的消息</a>		
		</div>
	</div>
	<!-- top栏结束 -->
</body>
</html>