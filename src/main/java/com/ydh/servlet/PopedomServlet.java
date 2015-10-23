package com.ydh.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ydh.business.PopedomManage;

public class PopedomServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		PopedomManage PM = new PopedomManage();
		String MethodName = request.getParameter("MethodParam");
		if ("User_PopedomList".equals(MethodName)) {
			PM.Get_User_PopedomList(request);
			request.getRequestDispatcher("popedom/popedom_manage.jsp").forward(
					request, response);
		} else if ("SavePopedom".equals(MethodName)) {
			if (PM.SavePopedom(request)) {
				request.getRequestDispatcher(
						"PopedomServlet?MethodParam=User_PopedomList").forward(
						request, response);
			}
		}
		out.close();
	}

}
