<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">   
   <link href="css/diy.css" rel="stylesheet" />
   
<title>登录界面</title>
</head>
<body>
	<%@ include file="brand.jsp" %>
	<div style="padding-bottom:20px;">
		
		
		<div class="ticket-inquiry">
			<form action="/ticket/LoginServlet" method="post">
				<p style="font-size:20px;text-align:center;width:320px;color:#23ac00;font-weight:bold;">用户登录</p>
				<input type="text" name="username" id="username" placeholder="用户名/邮箱/手机号" style="padding:5px;width:320px;"/><br />
				<input type="password" name="password" id="password" placeholder="请输入密码" style="padding:5px;width:320px;"/><br />
				<input type="password" id="password1" placeholder="请输入验证码" style="padding:5px;width:320px;"/><br />
				<input type="submit" value="登录" onclick="return myfunction()" 
					 style="background:#23ac00;width:320px;height:40px;color:white;" >
			</form>
		</div>
		
		
		<img src="img/loginbg.jpg"  
				style="width: 100%;height: 600px;min-width: 1080px;"/>	
	</div>
	<%@include file="copyright.jsp" %>
	
	
		<script type="text/javascript">
    		function myfunction(){
    			if(document.getElementById("username").value==''){
    				alert("用户名不能为空");
    				return false;    				
    			}
    			if(document.getElementById("password").value==''){
    				alert("密码不能为空");
    				return false;    				
    			}		
    			return true;
    		}
    		
    	</script>
</body>
</html>