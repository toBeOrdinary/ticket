package com.ticket.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.ticket.bean.Order;
import com.ticket.bean.User;
import com.ticket.utils.JDBCUtils;


//实现对数据库的操作，  这里只实现了 插入、查询功能
public class UserDao {
	//----------------------查询汽车票---------------------------------------------
	public int busTicketEnquiry(String route) {
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		try {//获得数据的连接
			conn = JDBCUtils.getConnection();
			//获得Statement对象
			stmt = conn.createStatement();
			//发送sql语句
			String sql = "select*from ticket where route='"+route+"'";
			rs = stmt.executeQuery(sql);
			int count=0;
			while(rs.next()) {
				count = rs.getInt("count");
			}
			
			if(rs!=null) {
				return count;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtils.release(rs, stmt,conn);
		}
		return 0;
		
	}
	
	//----------------------购买汽车票-------------------------------------------
	public boolean buyTicket(String username,String route,String departure_date,String time) {
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		try {//获得数据的连接
			conn = JDBCUtils.getConnection();
			//获得Statement对象
			stmt = conn.createStatement();
			//发送sql语句
			String sql = "update ticket set count=count-1 where route='"+route+"'";
			int num = stmt.executeUpdate(sql);
			if(num>0) {
				return true;
			}
			return false;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtils.release(rs, stmt,conn);
		}
		return false;
	}
	//----------------------添加到我的订单-------------------------------------------
	public boolean addToMyOrders(String username,String route,String departure_date,String time) {
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		try {//获得数据的连接
			conn = JDBCUtils.getConnection();
			//获得Statement对象
			stmt = conn.createStatement();
			//发送sql语句
			String sql = "insert into orders values('"+username+"','"+route+"','"+departure_date+"','"+time+"')";
			int num = stmt.executeUpdate(sql);
			if(num>0) {
				return true;
			}
			return false;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtils.release(rs, stmt,conn);
		}
		return false;
	}
	
	//----------------------查询我的订单---------------------------------------------
	//将获取到的记录封装到order对象   再把order装进List<Object>  return list   遍历list获取order，再使用order.xxx获取订单信息
	public List<Order> myOrders(String username) {
		List<Order> list = new ArrayList<>();
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		try {//获得数据的连接
			conn = JDBCUtils.getConnection();
			//获得Statement对象
			stmt = conn.createStatement();
			//发送sql语句
			String sql = "select*from orders where username='"+username+"'";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				Order order = new Order();
				order.setRoute(rs.getString("route"));
				order.setDeparture_date(rs.getString("departure_date"));
				order.setTime(rs.getString("time"));
				list.add(order);
				System.out.println("来自UserDao,向list添加order对象："+order.getRoute()+order.getDeparture_date()+order.getTime());
			}
			//通过遍历list集合  测试是否将每一个封装好的order对象添加到list集合
			for(int i=0;i<list.size();i++) {//根据list元素个数   执行对应次数的循环
				Order o = new Order();
				o = list.get(i);
				System.out.println("来自UserDao,遍历list集合测试:"+o.getRoute()+o.getDeparture_date()+o.getTime());
			}
			return list;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtils.release(rs, stmt,conn);
		}
		return null;
	}
	//----------------------退票-------------------------------------------
		public boolean refundTicket(String route,String username) {
			Connection conn=null;
			Statement stmt=null;
			ResultSet rs=null;
			try {//获得数据的连接
				conn = JDBCUtils.getConnection();
				//获得Statement对象
				stmt = conn.createStatement();
				//发送sql语句
				String sql = "update ticket set count=count+1 where route='"+route+"'";
				String sql1="delete from orders where username='"+username+"' and route='"+route+"'";
				int num = stmt.executeUpdate(sql);
				int num1=stmt.executeUpdate(sql1);
				int i=num+num1;
				if(i>1) {
					return true;
				}
				return false;
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				JDBCUtils.release(rs, stmt,conn);
			}
			return false;
		}
	//----------------------注册用户----------------------------------------------
	public boolean register(User user) {
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		try {//获得数据的连接
			conn = JDBCUtils.getConnection();
			//获得Statement对象
			stmt = conn.createStatement();
			//发送sql语句
			//insert into users(username,password) values('testname','testpwd')
			String sql = "insert into users(username,password) values("
					+ "'"+user.getUsername()+"','"+user.getPassword()+"')";
			int num = stmt.executeUpdate(sql);
			if(num>0) {
				return true;
			}
			return false;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtils.release(rs, stmt,conn);
		}
		return false;
	}
	//--------------------登录   根据username和password查询用户-------------------------------
	public User login(String username,String password) {
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		try {
			//获得数据的连接
			conn = JDBCUtils.getConnection();
			//获得Statement对象
			stmt=conn.createStatement();
			//发送sql语句
			String sql="select*from users where username='"+username+"' and password='"+password+"'";
			rs = stmt.executeQuery(sql);
			//处理结果集
			while(rs.next()) {
				User user = new User();
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				return user;
			}
			return null;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtils.release(rs, stmt,conn);
		}
		return null;
	}
}
