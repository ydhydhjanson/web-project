package com.ydh.business;

import com.ydh.bean.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.ydh.connection.ConnectionManage;

public class TopicManage {
	ConnectionManage fac = new ConnectionManage();

	public ResultSet getAllTopics() {
		Connection cn = fac.getConnection();
		String sql = "select * from topic";
		PreparedStatement ps;
		try {
			ps = cn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			return rs;
		} catch (SQLException e) {
			// TODO 自动生成 catch 块
			e.printStackTrace();
		}
		return null;
	}

	public Topic FindByid(int id) {
		Connection cn = fac.getConnection();
		Statement stmt;
		try {
			stmt = cn.createStatement();
			Topic tp = new Topic();
			ResultSet rs = stmt.executeQuery("select * from topic where id='"
					+ id + "'");
			while (rs.next()) {
				tp.setAuthor(rs.getString("Author"));
				tp.setContent(rs.getString("content"));
				tp.setEmail(rs.getString("email"));
				tp.setId(rs.getInt("id"));
				tp.setQq(rs.getString("qq"));
				tp.setTime(rs.getString("createTime"));
				tp.setTitle(rs.getString("title"));
			}
			return tp;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public boolean Delete(int id) {
		Connection cn = fac.getConnection();
		Statement stmt;
		boolean issuucess = false;
		// PreparedStatement ps;
		try {
			stmt = cn.createStatement();
			// ps = cn.prepareStatement("select * from topic where id='" + id +
			// "'");
			// ResultSet rs = ps.executeQuery();
			stmt.execute("delete from topic where id='" + id + "'");
			issuucess = true;
			cn.close();
			return issuucess;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return issuucess;
	}

	public boolean AddTopic(HttpServletRequest request) {
		boolean issuucess = false;
		Connection cn = fac.getConnection();
		String sql = "insert into topic(title,content,createtime,author,qq,email) values(?,?,?,?,?,?)";
		String title = request.getParameter("TITLE");
		String ttime = DateFormat.getDateTimeInstance().format(new Date());
		String author = request.getParameter("AUTHOR");
		String content = request.getParameter("CONTENT");
		String qq = request.getParameter("QQ");
		String email = request.getParameter("EMAIL");
		PreparedStatement stmt = null;
		try {
			stmt = cn.prepareStatement(sql);
			stmt.setString(1, title);
			stmt.setString(2, content);
			stmt.setString(3, ttime);
			stmt.setString(4, author);
			stmt.setString(5, qq);
			stmt.setString(6, email);
			stmt.executeUpdate();
			stmt.close();
			issuucess = true;
		} catch (SQLException e) {
			// TODO 自动生成 catch 块
			e.printStackTrace();

		}
		return issuucess;
	}

}
