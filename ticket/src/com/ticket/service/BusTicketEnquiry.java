package com.ticket.service;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ticket.dao.UserDao;

public class BusTicketEnquiry extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BusTicketEnquiry() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//实现根据request获取的出发地、目的地、时间   查询数据库对应路线剩余的票
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		System.out.println("test"+start);
		if(start.equals("")|end.equals("")) {
			start = "成都";
			end = "绵阳";
		}
		String route = start+"-"+end;
		
		String departure_date = request.getParameter("departure_date");
		
		UserDao dao = new UserDao();
		int count = dao.busTicketEnquiry(route);
		
		HttpSession session = request.getSession();
		session.setAttribute("route",route);//路线
		session.setAttribute("departure_date",departure_date);//出发日期			
		session.setAttribute("count",count);//余票数量
		
		request.getRequestDispatcher("/busticketenquiry.jsp").forward(request, response);
		
	}
	}