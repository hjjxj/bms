<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>图书管理系统注册页面</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/client/css/main.css"
	type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/client/js/form.js"></script>

</head>

<body class="main">
	<!-- 1.图书管理系统顶部 start -->
	<%@include file="head.jsp"%>
	<!-- 图书管理系统顶部  end -->
	<!-- 2. 菜单导栏 start-->
	<%@include file="menu_search.jsp"%>
	<!-- 菜单导栏end -->
	<!-- 3.网上书城用户注册  start -->
	<div id="divcontent">
		<form action="${pageContext.request.contextPath}/RegisterServlet"
			method="post" onsubmit="return checkForm();">
			<table width="850px" border="0" cellspacing="0">
				<tr>
					<td style="padding: 30px"><h1 align=center>新用户注册</h1>
						<table width="70%" border="0" cellspacing="2" class="upline">
							<tr>
								<c:if test="${error!=null }">
									<td colspan="3"
										style="text-align: center; font-size: 14px; color: red;">
										${error}</td>
								</c:if>

							</tr>
							<tr>
								<td style="text-align: right">用户名：</td>
								<td><input type="text" class="textinput" id="username"
									name="username" onkeyup="checkUsername();" /></td>
								<td colspan="2"><span id="usernameMsg"></span><font
									color="#999999">字母数字下划线1到10位, 不能是数字开头</font></td>
							</tr>
							<tr>
								<td style="text-align: right">密码：</td>
								<td><input type="password" class="textinput" id="password"
									name="password" onkeyup="checkPassword();" /></td>
								<td><span id="passwordMsg"></span><font color="#999999">密码请设置6-16位字符</font></td>
							</tr>
							<tr>
								<td style="text-align: right">重复密码：</td>
								<td><input type="password" class="textinput"
									id="repassword" name="repassword" onkeyup="checkConfirm();" />
								</td>
								<td><span id="confirmMsg"></span>&nbsp;</td>
							</tr>
							<tr>
								<td style="text-align: right">性别：</td>
								<td colspan="2">&nbsp;&nbsp; <input type="radio"
									name="gender" value="男" checked="checked" /> 男
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
									name="gender" value="女" /> 女
								</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td style="text-align: right; width: 20%">邮箱：</td>
								<td style="width: 40%"><input type="text" class="textinput"
									id="email" name="email" onkeyup="checkEmail();" /></td>
								<td colspan="3"><span id="emailMsg"></span><font
									color="#999999">请输入有效的邮箱地址</font></td>
							</tr>

						</table>

						<table width="70%" border="0" cellspacing="0">

							<tr>
								<td style="text-align: center"><input type="submit"
									name="submit" value="注册" style="width: 140px; height: 35px;" />
								</td>
							</tr>
						</table></td>
				</tr>
			</table>
		</form>
	</div>

	<!-- 图书管理系统用户注册  end -->

	<!--  3.图书管理系统尾部 start -->
	<jsp:include page="foot.jsp"></jsp:include>
	<!--  3.图书管理系统尾部 end  -->

</body>