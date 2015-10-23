<%@page import="java.sql.*,java.util.*" pageEncoding="UTF-8"%>
<% Set popedomset=(Set)session.getAttribute("popedomset"); System.out.println("========="+popedomset.size());%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<TITLE>留言板管理</TITLE>
		<META NAME="Description" CONTENT="">
		<META http-equiv=Content-Type content="text/html; charset=UTF-8">
		<link href="${pageContext.request.contextPath }/themes/styles.css"
			type="text/css" rel="stylesheet" />
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/scripts/ajaxcommon.js"></script>
	</HEAD>
	<body>
		<%
	ResultSet rs  =(ResultSet) request.getAttribute("TopicList");
%>
		<center>
			<font color="#FFFFFF" face="方正舒体" size="7">留&nbsp;&nbsp;言&nbsp;&nbsp;板</font>
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
									编号
								</td>
								<td width="20%">
									标&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;题
								</td>
								<td width="16%">
									发言时间
								</td>
								<td width="16%">
									作者
								</td>
								<td width="16%">
									OQ
								</td>
								<td width="16%">
									邮箱
								</td>
								<td width="25%">
									操作
								</td>
							</tr>
							<%
	  	int id;
		while (rs.next()){
		id = rs.getInt("id");
	  %>
							<tr id="row<%=id%>">
								<td width="6%">
									<%=id%>
								</td>
								<td width="20%">
									<%=rs.getString("title")%>
								</td>
								<td width="16%">
									<%=rs.getString("createTime")%>
								</td>
								<td width="16%">
									<%=rs.getString("Author")%>
								</td>
								<td width="16%">
									<%=rs.getString("qq")%>
								</td>
								<td width="16%">
									<%=rs.getString("email")%>
								</td>
								<td width="25%">
									<%if(popedomset.contains("浏览留言")){ %>
									<a href="TopicServlet?MethodParam=FindByid&topicid=<%=id%>">浏览</a>
									<%} %>
									<%if(popedomset.contains("删除留言")){ %>
									<a href="javascript:callAction('<%=id %>');">删除</a>
									<%} %>
								</td>
							</tr>
							<%
	  }
	  
	  rs.close();
	  %>
							<tr bgcolor="#99CCFF">
								<td width="6%" bgcolor="" colspan=7>
									<%if(popedomset.contains("发表留言")){ %>
									<a href="${pageContext.request.contextPath}/topic/addtopic.jsp">【发表留言】</a>
									<%} %>
									<a
										href="${pageContext.request.contextPath}/PopedomServlet?MethodParam=User_PopedomList">【权限管理】</a>
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
		 var xmlHttp=null;  
  /*调用远程方法*/
   function callAction(topicid)
   {
     var indexTr=document.getElementById("row"+topicid);
	 var index = indexTr.rowIndex;
     try{
     if(xmlHttp==null) xmlHttp =getXMLHTTPObj();
     if(xmlHttp)
     {
      var url="${pageContext.request.contextPath}/TopicServlet?MethodParam=Delete&topicid="+topicid+"&rowIndex="+index+"&nm="+Math.random();
       /*打开连接*/
       xmlHttp.open("post",url,true);
       /*设置回调函数*/
       xmlHttp.onreadystatechange =httpback;
       /*发送请求*/
       xmlHttp.send(null);
     }else
     {
     alert("操作失败");
     }
     
     }catch(e1)
     {}
   }
   
    function httpback(){
     if(xmlHttp.readyState==4){
      var result=xmlHttp.responseText;
      var tab = document.getElementById("tableid");
      tab.deleteRow(result);
      //var rowobjcet=document.getElementById("row"+result);
      //rowobjcet.style.display = "none";
      }
     } 
 </script>
	</BODY>
</HTML>
