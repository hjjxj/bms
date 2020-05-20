<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>菜单</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin/css/style.css"
	type="text/css" />
</head>
<body>
	<table width="100" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="12"></td>
		</tr>
	</table>
	<table width="100%" border="0">
		<tr>
			<td class="listtd"><img
				src="${pageContext.request.contextPath }/client/images/icon1.png"
				width="15" height="10" />&nbsp;&nbsp;&nbsp;&nbsp; <a
				href="${pageContext.request.contextPath}/ListUserServlet"
				target="mainFrame" class="left_list">用户管理</a></td>
		</tr>
		<tr>
			<td class="listtd"><img
				src="${pageContext.request.contextPath }/client/images/icon1.png"
				width="15" height="10" />&nbsp;&nbsp;&nbsp;&nbsp; <a
				href="${pageContext.request.contextPath}/ListBookServlet"
				target="mainFrame" class="left_list">图书管理</a></td>
		</tr>
		<tr>
			<td class="listtd"><img
				src="${pageContext.request.contextPath }/client/images/icon2.png"
				width="15" height="10" />&nbsp;&nbsp;&nbsp;&nbsp; <a
				href="${pageContext.request.contextPath}/ListOrderServlet?flag=false"
				target="mainFrame" class="left_list">借书申请</a></td>
		</tr>
		<tr>
			<td class="listtd"><img
				src="${pageContext.request.contextPath }/client/images/icon2.png"
				width="15" height="10" />&nbsp;&nbsp;&nbsp;&nbsp; <a
				href="${pageContext.request.contextPath}/ListOrderServlet?flag=true"
				target="mainFrame" class="left_list">还书操作</a></td>
		</tr>
		<!--  
			  <tr>
			  	<td class="listtd">
			  	<img src="${pageContext.request.contextPath }/client/images/icon3.png" width="15" height="10" />&nbsp;&nbsp;&nbsp;&nbsp; 
			  		<a href="${pageContext.request.contextPath}/logoutServlet" target="mainFrame" class="left_list">用户退出</a>		
			  	</td>
			  </tr>
		-->
	</table>
</body>
</html>