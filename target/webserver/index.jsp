<%@page pageEncoding="UTF-8"%>
<html>
	<head>
		<META http-equiv=Content-Type content="text/html; charset=UTF-8">
		<SCRIPT LANGUAGE="JavaScript">
	function chcekvalue()
	{
		var username=document.theForm.username.value
		var pwd=document.theForm.pwd.value
		 if(username=="")
		{
			alert("请输入用户名！");
			document.theForm.username.value="";
			document.theForm.username.focus();
			return false;

		}
	    else if(pwd=="")
		{
			alert("请输入您的密码！");
			document.theForm.pwd.value="";
			document.theForm.pwd.focus();
			return false;
		}
		else return true;
		
	}
</SCRIPT>
		<style>
HTML {margin:0;padding:0;height:100%;overflow:auto;}
BODY {margin:0;padding:0;overflow:auto;font-size:12px;color:#000;background:#00468C;font-family:Verdana, Arial;font-size:11px;}
.EditTable { background: #0076C6; font-size: 12px; cursor: default;border-width:0px;width:400px; }
.EditTableHeader { color: #0076C6; background: #0076C6; font-size: 14px; font-weight: bold; text-align: center; height: 28px; padding:4px; }
.Label{background: #99CCFF;padding: 3px 8px 3px 3px;font-family:Verdana, Arial;font-size:11px;text-align: right;height: 20px;}
.Field{background: #f2f7fc;padding: 3px 3px 3px 3px;font-family:Verdana, Arial;font-size:11px;text-align: left;height: 24px;}
</style>
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
					action="${pageContext.request.contextPath}/UserServlet?MethodParam=Login"
					onsubmit="return chcekvalue()" name="theForm">
					<table cellpadding="1" cellspacing="1" class="EditTable">
						<tr class="EditTableHeader">
							<td width="23%" colspan="2">
								<font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;用户登录</font>
							</td>

						</tr>
						<tr>
							<td width="23%" class="Label">
								用户名：
							</td>
							<td width="77%" class="Field">
								<input type="text" name="username" size="20" value="">
								<font color=#FF3333>*</font>
							</td>
						</tr>
						<tr>
							<td width="23%" class="Label">
								密码：
							</td>
							<td width="77%" class="Field">
								<input type="password" name="pwd" size="21" value="">
								<font color=#FF3333>*</font>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="submit" value="提&nbsp;&nbsp;交" name="B1">
								&nbsp;&nbsp;
								<input type="reset" value="重&nbsp;&nbsp;填" name="B2">
								&nbsp;&nbsp;
							</td>
						</tr>
					</table>
				</form>
				<hr width="98%">
			</center>
		</div>
	</body>

</html>
