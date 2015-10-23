package com.ydh.business;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.ydh.bean.User;
import com.ydh.connection.ConnectionManage;

public class PopedomManage {
	ConnectionManage fac = new ConnectionManage();

	public void Get_User_PopedomList(HttpServletRequest request) {
		Connection cn = fac.getConnection();
		Statement stmt;
		try {
			stmt = cn.createStatement();
			String sql = "select * from user";
			ResultSet rs = stmt.executeQuery(sql);
			ResultSet popedomrs;
			List<User> userlist = new ArrayList<User>();
			while (rs.next()) {
				stmt = cn.createStatement();
				int userid = rs.getInt("id");
				User user = new User();
				user.setId(userid);
				user.setPwd(rs.getString("pwd"));
				user.setUsername(rs.getString("username"));
				userlist.add(user);
				sql = "select * from popedom where id IN(select popedomid from user_pepodom where userid='"
						+ userid + "')";
				popedomrs = stmt.executeQuery(sql);
				request.setAttribute("User_PopedomList" + userid, popedomrs);
				stmt = cn.createStatement();
				sql = "select * from popedom where id NOT IN(select popedomid from user_pepodom where userid='"
						+ userid + "')";
				popedomrs = stmt.executeQuery(sql);
				request.setAttribute("NO_User_PopedomList" + userid, popedomrs);
			}
			request.setAttribute("UserList", userlist);
			stmt = cn.createStatement();
			sql = "select * from popedom";
			rs = stmt.executeQuery(sql);
			request.setAttribute("PopedomList", rs);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public boolean SavePopedom(HttpServletRequest request) {
		boolean issuucess = false;
		Connection cn = fac.getConnection();
		String userid = request.getParameter("userid");
		try {
			System.out.println("userid" + userid);
			String sql = "delete from user_pepodom where userid='" + userid
					+ "'";
			Statement stmt = cn.createStatement();
			stmt.execute(sql);
			stmt.close();
			cn.close();
			issuucess = Save(request);
		} catch (SQLException e) {
			// TODO 自动生成 catch 块
			e.printStackTrace();

		}
		return issuucess;
	}

	public boolean Save(HttpServletRequest request) {
		boolean issuucess = false;
		Connection cn = fac.getConnection();
		String popedomidss = request.getParameter("popedomids");
		String[] popedomids = popedomidss.split(",");
		String userid = request.getParameter("userid");
		try {
			for (int i = 0; i < popedomids.length; i++) {
				System.out.println("poped9om" + popedomids[i]);
				String sql = "insert into user_pepodom(userid,popedomid) values('"
						+ userid + "','" + popedomids[i] + "')";
				Statement stmt = cn.createStatement();
				stmt.execute(sql);
				stmt.close();
				issuucess = true;
				System.out.println("ddd" + issuucess);
			}
			cn.close();
		} catch (SQLException e) {
			// TODO 自动生成 catch 块
			e.printStackTrace();

		}
		return issuucess;
	}
}
