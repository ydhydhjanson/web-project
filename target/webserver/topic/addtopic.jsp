<%@page pageEncoding="UTF-8"%>
<html>
	<head>
		<META http-equiv=Content-Type content="text/html; charset=UTF-8">
		<link href="${pageContext.request.contextPath }/themes/styles.css"
			type="text/css" rel="stylesheet" />
		<SCRIPT LANGUAGE="JavaScript">
	function chcekvalue()
	{
		var title=document.theForm.TITLE.value
		var content=document.theForm.CONTENT.value
		var author=document.theForm.AUTHOR.value
		var email=document.theForm.EMAIL.value
		var qq=document.theForm.QQ.value
		 if(author=="")
		{
			alert("请输入作者名称！");
			document.theForm.AUTHOR.value="";
			document.theForm.AUTHOR.focus();
			return false;

		}
		else if(qq.length>15||qq<0||qq==""||qq!=parseInt(qq))
		{
			alert("请用输入合法的QQ号码")
			document.theForm.QQ.value="";
			document.theForm.QQ.focus();
			return false;
		}
		else if((email.indexOf("@"))==-1||(email.indexOf("@"))==((email.length)-1)||(email.indexOf("@"))==0)
		{
			alert("请正确输入您的邮件地址");
			document.theForm.EMAIL.value="";
			document.theForm.EMAIL.focus();
			return false;

		}
		else if(title=="")
			{
				alert("请输入留言标题！");
				document.theForm.TITLE.value="";
				document.theForm.TITLE.focus();
				return false;
			
			}
	    else if(content=="")
		{
			alert("请输入您的留言内容！");
			document.theForm.CONTENT.value="";
			document.theForm.CONTENT.focus();
			return false;

		}
		else return true;
		
	}
</SCRIPT>
		<title>留言板</title>
	</head>
	<body>
		<center>
			<font color="#FFFFFF" face="方正舒体" size="7">留&nbsp;&nbsp;言&nbsp;&nbsp;板</font>
			<hr width="98%">
		</center>
		<div align="center">
			<center>
				<form method="POST"
					action="${pageContext.request.contextPath}/TopicServlet?MethodParam=Save"
					onsubmit="return chcekvalue()" name="theForm">
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
								<input type="text" name="AUTHOR" size="30" value="">
								<font color=#FF3333>*</font>
							</td>
						</tr>
						<tr>
							<td width="23%" class="Label">
								留言者QQ：
							</td>
							<td width="77%" class="Field">
								<input type="text" name="QQ" size="30" value="">
							</td>
						</tr>
						<tr>
							<td width="23%" class="Label">
								留言者EMAIL:
							</td>
							<td width="77%" class="Field">
								<input type="text" name="EMAIL" size="40" value="">
								<font color=#FF3333>*</font>
							</td>
						</tr>
						<tr>
							<td width="23%" class="Label">
								留言标题：
							</td>
							<td width="77%" class="Field">
								<input type="text" name="TITLE" size="40" value="">
								<font color=#FF3333>*</font>
							</td>
						</tr>
						<tr>
							<td width="23%" class="Label">
								留言内容：
							</td>
							<td width="77%" class="Field">
								<textarea rows="11" name="CONTENT" cols="50"></textarea>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="submit" value="提交" name="B1">
								&nbsp;&nbsp;
								<input type="reset" value="重填" name="B2">
								&nbsp;&nbsp;
								<input type="button" value="回到首页" name="B3"
									onclick="gotoindex();">
							</td>
						</tr>
					</table>
				</form>
				<hr width="98%">
			</center>
		</div>
		<script type="text/javascript">
		function gotoindex(){
		  document.location.href="${pageContext.request.contextPath}/TopicServlet?MethodParam=GetAllTopics";
		}
	</script>
	</body>

</html>
