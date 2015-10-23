package com.ydh.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ydh.bean.Topic;
import com.ydh.business.TopicManage;

public class TopicServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		TopicManage TM = new TopicManage();
		String MethodName = request.getParameter("MethodParam");
		System.out.println("Nmae" + MethodName);
		if ("Save".equals(MethodName)) {
			if (TM.AddTopic(request)) {
				request.getRequestDispatcher(
						"TopicServlet?MethodParam=GetAllTopics").forward(
						request, response);
			}
		} else if ("GetAllTopics".equals(MethodName)) {
			ResultSet rs = TM.getAllTopics();
			request.setAttribute("TopicList", rs);
			request.getRequestDispatcher("topic/topiclist.jsp").forward(
					request, response);
		} else if ("FindByid".equals(MethodName)) {
			int id = Integer.valueOf(request.getParameter("topicid"));
			Topic TopicObject = TM.FindByid(id);
			request.setAttribute("TopicObject", TopicObject);
			request.getRequestDispatcher("topic/show.jsp").forward(request,
					response);
		} else if ("Delete".equals(MethodName)) {
			int id = Integer.valueOf(request.getParameter("topicid"));
			String rowid = request.getParameter("rowIndex");
			if (TM.Delete(id)) {
				out.println(rowid);
			}
		}
		out.close();
	}

}
