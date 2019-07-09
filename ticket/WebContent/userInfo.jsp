<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<style type="text/css">
		.infosubmit{
			margin-left:120px;
			margin-top:20px;
			margin-bottom:30px;
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
			<h4>我的资料</h4> 
		</div>  
		<div style="width:500px;height:250px;margin:auto;border:1px solid gray;">
			<div style="padding:8px;">丨基础信息 </div>
			 
			
			<div style="float:left;width:120px;height:auto;">
				<div style="margin-left:30px;padding:6.5px;">用户名</div>
				<div style="margin-left:30px;padding:6.5px;">真实姓名</div>
				<div style="margin-left:30px;padding:6.5px;">手机号码</div>
				<div style="margin-left:30px;padding:6.5px;">身份证号码</div>
			</div> 
			
			<div style="float:left;width:200px;height:auto;">
				<div style="margin-left:30px;padding:5px;">${sessionScope.username }</div>
				<input type="text" placeholder="请输入您的真实姓名" />
				<input type="text" placeholder="请输入您的手机号码"/>
				<input type="text" placeholder="请输入您的身份证号码"/>			
			</div>
			<div>
				<form action="" method="post">
					<input type="submit" value="保存" class="infosubmit"> 
				</form>
			</div>
			
		</div> 
	</div>
	
	<!-- 底部版权 -->
	<%@include file="copyright.jsp" %>
</body>
</html>