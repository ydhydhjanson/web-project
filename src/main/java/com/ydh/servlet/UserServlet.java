package com.ydh.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ydh.bean.Topic;
import com.ydh.business.UserManage;

public class UserServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		UserManage TM = new UserManage();
		String MethodName = request.getParameter("MethodParam");
		System.out.println("Nmae" + MethodName);
		if ("Login".equals(MethodName)) {
			if (TM.ValidateLogin(request)) {
				request.getRequestDispatcher(
						"TopicServlet?MethodParam=GetAllTopics").forward(
						request, response);
			} else {
				out
						.println("<script lanugage='javascript'>window.parent.location.href='index.jsp';");
				out.println("</script>");
			}
		} else if ("Logout".equals(MethodName)) {
			request.getSession().invalidate();
			out
					.println("<script lanugage='javascript'>window.parent.location.href='index.jsp';");
			out.println("</script>");
		}
		out.close();
	}

}
