package com.ticket.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ticket.dao.UserDao;
import com.ticket.userbean.User;
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public LoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		System.out.println(username+password);
		
		UserDao dao = new UserDao();
		User user = dao.login(username, password);
		
		if(user!=null) {
			//登录成功，将该用户存到session域，跳转到首页
			request.getSession().setAttribute("user", user);
			String username1 = user.getUsername();
			request.getSession().setAttribute("username", username1);
			request.getSession().setMaxInactiveInterval(30*60);
			response.sendRedirect("/ticket/index.jsp");
		}else {
			//登录失败
			response.getWriter().write("用户名或密码错误 ");
		}
		
	}
}
