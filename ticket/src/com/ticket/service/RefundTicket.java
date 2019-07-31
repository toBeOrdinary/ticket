package com.ticket.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ticket.dao.UserDao;

public class RefundTicket extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public RefundTicket() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//将获取到的String类型id转为int类型   
				//int id=Integer.parseInt(request.getParameter("id"));
				String route = request.getParameter("route");
				String username = (String) request.getSession().getAttribute("username");
				System.out.println(route+username);
				
				UserDao dao = new UserDao();
				boolean b = dao.refundTicket(route,username);
				while(b==true) {
					response.setHeader("refresh", "0;url=/ticket/MyOrders");
					break;
				}
	}

}
