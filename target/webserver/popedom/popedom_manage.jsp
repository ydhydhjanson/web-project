<%@page import="java.sql.*,java.util.*,com.ydh.bean.*"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<TITLE>留言板管理</TITLE>
		<META NAME="Description" CONTENT="">
		<META http-equiv=Content-Type content="text/html; charset=UTF-8">
		<link href="${pageContext.request.contextPath }/themes/styles.css"
			type="text/css" rel="stylesheet" />
	</HEAD>
	<body>
		<%
	List rs  =(List) request.getAttribute("UserList");
	ResultSet popedomrs=null;
%>
		<center>
			<font color="#FFFFFF" face="方正舒体" size="7">权&nbsp;&nbsp;限&nbsp;&nbsp;管&nbsp;&nbsp;理</font>
			<hr width="98%">
			<table border="0" cellpadding="1" cellspacing="1" width="96%"
				class="ListTable">
				<tr>
					<td width="100%">
						<table border="1" cellpadding="4" cellspacing="0"
							style="border-collapse: collapse" bordercolor="#111111"
							width="100%" id="tableid">
							<tr class="ListTableHeader">
								<td width="6%">
									用户编号
								</td>
								<td width="6%">
									用户姓名
								</td>
								<td width="20%">
									权限
								</td>
								<td width="16%">
									操作
								</td>
							</tr>
							<%
	  	int userid;
		for(int i=0;i<rs.size();i++){
		User user=(User)rs.get(i);
		userid = user.getId();
	  %>
							<tr>
								<td width="6%">
									<%=userid%>
								</td>
								<td width="20%">
									<%=user.getUsername()%>
								</td>
								<td width="16%">
									<%  popedomrs  =(ResultSet) request.getAttribute("User_PopedomList"+userid); 
								  while (popedomrs.next()){
								%>
									<input type="checkbox" name="popedom<%=userid%>"
										value="<%=popedomrs.getInt("id") %>" checked="checked">
									"
									<%=popedomrs.getString("name") %>
									<%} %>
									<%  popedomrs  =(ResultSet) request.getAttribute("NO_User_PopedomList"+userid); 
								  while (popedomrs.next()){
								%>
									<input type="checkbox" name="popedom<%=userid%>"
										value="<%=popedomrs.getInt("id") %>">
									"
									<%=popedomrs.getString("name") %>
									<%} %>
								</td>
								<td width="16%">
									<input type="submit" value="保存"
										onclick="javascript:callAction('<%=userid%>');" name="B1">
								</td>
							</tr>
							<%
	  }
	  popedomrs.close();
	  %>
							<tr bgcolor="#99CCFF">
								<td width="6%" bgcolor="" colspan=7>

									<a
										href="${pageContext.request.contextPath}/TopicServlet?MethodParam=GetAllTopics">【回到首页】</a>
									<a
										href="${pageContext.request.contextPath}/UserServlet?MethodParam=Logout">【注销】</a>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</center>
		<script type="text/javascript">  
   function callAction(userid)
   {
			   //将对应用户的popedom id放到js数组里面
			    var rad = document.getElementsByTagName("input");
                 var checkname="popedom"+userid;
			      var tmp ="";
			      var arr=new Array();
			      for(var i =0 ;i < rad.length;i++){
			         var element = rad[i];
			         if((element.type=='checkbox')&&(element.checked == true)&&(element.name==checkname)){
			           arr.push(element.value);
			         }
			      }
   document.location.href="${pageContext.request.contextPath}/PopedomServlet?MethodParam=SavePopedom&popedomids="+arr+"&userid="+userid;
   }
 </script>
	</BODY>
</HTML>
