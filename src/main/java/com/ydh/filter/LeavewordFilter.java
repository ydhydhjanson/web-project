package com.ydh.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import com.ydh.util.StringUtils;

public class LeavewordFilter implements Filter {
	String encoding = "";

	public void destroy() {

	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest hRequest = (HttpServletRequest) request;
		hRequest.setCharacterEncoding(encoding);
		response.setCharacterEncoding(encoding);
		String UserName = new String(hRequest.getSession().getAttribute(
				"UserName")
				+ "");
		if (!StringUtils.isNotBlank(UserName)
				&& hRequest.getRequestURI().indexOf("UserServlet") == -1
				&& hRequest.getRequestURI().indexOf("index.jsp") == -1) {
			PrintWriter out = response.getWriter();
			out
					.println("<script lanugage='javascript'>window.parent.location.href='index.jsp';");
			out.println("</script>");
			out.close();
		} else {
			chain.doFilter(hRequest, response);
		}

	}

	public void init(FilterConfig filterConfig) throws ServletException {
		encoding = filterConfig.getInitParameter("encoding");
	}

}
