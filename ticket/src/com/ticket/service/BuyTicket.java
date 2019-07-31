package com.ticket.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ticket.bean.User;
import com.ticket.dao.UserDao;
public class BuyTicket extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public BuyTicket() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("username")==null){
			response.getWriter().write("<a href='/ticket/login.jsp'>请先登录</a>");
		}else {
			//调用dao层buyTicket方法   实现购票
			String time ="08:00";
			request.getSession().setAttribute("time", time);
			
			String route =  (String) request.getSession().getAttribute("route");
			String username = (String) request.getSession().getAttribute("username");
			String departure_date = (String) request.getSession().getAttribute("departure_date");
			
			UserDao dao = new UserDao();
			boolean b = dao.buyTicket(username,route,departure_date,time);//购票后  数据库中对应路线余票-1
			while(b==true) {//有余票   才能购买成功  然后加到我的订单
				boolean b1 = dao.addToMyOrders(username,route,departure_date,time);
				if(b1==true) {
					response.getWriter().write("ok");//改为购票成功后跳转到我的订单页面
					request.getRequestDispatcher("/MyOrders").forward(request, response);
					//response.setHeader("refresh", "3;url=/ticket/MyOrders");
					break;
				}
				break;
			}
		}
	}

}
