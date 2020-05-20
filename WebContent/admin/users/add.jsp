<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<HTML>
<HEAD>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK href="${pageContext.request.contextPath}/admin/css/style.css"
	type="text/css" rel="stylesheet">
<script language="javascript"
	src="${pageContext.request.contextPath}/admin/js/public.js"></script>
<script language="javascript"
	src="${pageContext.request.contextPath}/admin/js/check.js"></script>
</HEAD>
<body>
	<form id="userAction_save_do" name="Form1"
		action="${pageContext.request.contextPath}/AddUserServlet"
		method="post">
		<table cellSpacing="1" cellPadding="5" width="100%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			<tr>
				<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
					height="26"><strong>添加用户</strong></td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">用户名：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="username" class="bg" /></td>
				<td align="center" bgColor="#f5fafe" class="ta_01">用户性别：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="radio"
					name="gender" value="男" checked="checked" /> 男
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
					name="gender" value="女" /> 女</td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">用户密码：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="password" class="bg" /></td>
				<td align="center" bgColor="#f5fafe" class="ta_01">用户邮箱：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="email" class="bg" /></td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">用户密码：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="role" class="bg" value="普通用户" disabled="disabled"/></td>
				<td align="center" bgColor="#f5fafe" class="ta_01">可借阅数：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="bnum" class="bg" value="8本" disabled="disabled" /></td>
			</tr>
			<tr>
				<td align="center" colSpan="4" class="sep1"><img
					src="${pageContext.request.contextPath}/client/images/shim.gif">
				</td>
			</tr>
			<tr>
				<td class="ta_01" style="WIDTH: 100%" align="center"
					bgColor="#f5fafe" colSpan="4"><input type="submit"
					class="button_ok" value="确定"> <FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
					<input type="reset" value="重置" class="button_cancel" /> <FONT
					face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT> <INPUT
					class="button_ok" type="button" onclick="history.go(-1)" value="返回" />
					<span id="Label1"> </span></td>
			</tr>
		</table>
	</form>
</body>
</HTML>