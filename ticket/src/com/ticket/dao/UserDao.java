package com.ticket.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.ticket.userbean.User;
import com.ticket.utils.JDBCUtils;


//实现对数据库的操作，  这里只实现了 插入、查询功能
public class UserDao {
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
