<%@page pageEncoding="UTF-8"%>
<html>
	<head>
		<META http-equiv=Content-Type content="text/html; charset=UTF-8">
		<link href="${pageContext.request.contextPath }/themes/styles.css"
			type="text/css" rel="stylesheet" />
		<title>留言板</title>
	</head>
	<body>
		<center>
			<font color="#FFFFFF" face="方正舒体" size="7">留&nbsp;&nbsp;言&nbsp;&nbsp;板</font>
			<hr width="98%">
		</center>

		<center>
			<table cellpadding="1" cellspacing="1" class="EditTable">
				<tr class="EditTableHeader">
					<td width="23%" colspan="2">
						<font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发送新留言</font>
					</td>

				</tr>
				<tr>
					<td width="23%" class="Label">
						留言者：
					</td>
					<td width="77%" class="Field">
						${TopicObject.author }
					</td>
				</tr>
				<tr>
					<td width="23%" class="Label">
						留言者QQ：
					</td>
					<td width="77%" class="Field">
						${TopicObject.qq }
					</td>
				</tr>
				<tr>
					<td width="23%" class="Label">
						留言者EMAIL:
					</td>
					<td width="77%" class="Field">
						${TopicObject.email }
					</td>
				</tr>
				<tr>
					<td width="23%" class="Label">
						留言标题：
					</td>
					<td width="77%" class="Field">
						${TopicObject.title }
					</td>
				</tr>
				<tr>
					<td width="23%" class="Label">
						留言内容：
					</td>
					<td width="77%" class="Field">
						<textarea rows="11" name="CONTENT" cols="50" readonly="readonly">${TopicObject.content }</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" value="回到首页" name="B3" onclick="gotoindex();">
					</td>
				</tr>
			</table>

			<hr width="98%">
		</center>
		<script type="text/javascript">
		function addtopic(){
		  document.location.href="${pageContext.request.contextPath}/topic/addtopic.jsp";
		}
		function gotoindex(){
		  document.location.href="${pageContext.request.contextPath}/TopicServlet?MethodParam=GetAllTopics";
		}
	</script>
	</body>

</html>
