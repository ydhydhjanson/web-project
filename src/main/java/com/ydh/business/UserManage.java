package com.ydh.business;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import com.ydh.connection.ConnectionManage;

public class UserManage {
	ConnectionManage fac = new ConnectionManage();

	public boolean ValidateLogin(HttpServletRequest request) {
		Connection cn = fac.getConnection();
		PreparedStatement stmt = null;
		String username = request.getParameter("username");
		String pwd = request.getParameter("pwd");
		boolean issuucess = false;
		try {
			String sql = "select * from user where username=? and pwd=?";
			stmt = cn.prepareStatement(sql);
			stmt.setString(1, username);
			stmt.setString(2, pwd);
			ResultSet rs = stmt.executeQuery();
			int userid = 0;
			if (rs.next()) {
				userid = rs.getInt("id");
				issuucess = true;
				request.getSession().setAttribute("UserName", username);
				System.out.println("userid" + userid);
				sql = "select * from popedom where id IN(select popedomid from user_pepodom where userid='"
						+ userid + "')";
				rs = stmt.executeQuery(sql);
				Set<String> popedomset = new HashSet<String>();
				while (rs.next()) {
					popedomset.add(rs.getString("name"));
				}
				request.getSession().setAttribute("popedomset", popedomset);
			}
			return issuucess;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return issuucess;
	}

}
