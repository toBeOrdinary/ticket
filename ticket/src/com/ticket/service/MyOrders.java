package com.ticket.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ticket.bean.Order;
import com.ticket.dao.UserDao;

public class MyOrders extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public MyOrders() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//展示我的订单页面
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		
		if(username==null) {
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}else {
			UserDao dao = new UserDao();
			List<Order> list = new ArrayList<>();
			list = dao.myOrders(username);//list里面通常有多个订单(order对象)
			
			//直接将list集合放到request域
			request.setAttribute("orders", list);
			request.getRequestDispatcher("myorders.jsp").forward(request, response);
		}
	}
}