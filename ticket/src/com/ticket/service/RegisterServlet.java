package com.ticket.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ticket.bean.User;
import com.ticket.dao.UserDao;


public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RegisterServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//实现用户注册功能
		
		//获取客户端输入的用户名  密码
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		//封装到user对象
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		
		//向数据库中插入记录
		UserDao dao = new UserDao();
		boolean b = dao.register(user);
		
		if(b==true) {
			//插入记录成功后返回true  即注册成功，跳转到登录界面
			response.setHeader("refresh", "0;URL=/ticket/login.jsp");
			
			//注册成功后自动登录 并且跳转到首页面
			dao.login(username, password);
			request.getSession().setAttribute("user", user);
			String username1 = user.getUsername();
			request.getSession().setAttribute("username", username1);
			request.getSession().setMaxInactiveInterval(30*60);
			response.sendRedirect("/ticket/index.jsp");
			
		}else {
			//若数据库存在与从request获取的username相同的值，返回false，注册失败
			response.getWriter().write("注册失败，该用户名已被注册！<a href='/ticket/register.jsp'>重新注册</a>");
		}
		
	}

}
