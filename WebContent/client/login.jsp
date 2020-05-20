<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>图书管理系统登录页面</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/client/css/main.css" type="text/css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/client/js/form.js"></script>

</head>

<body class="main">
<!-- 1.图书管理系统顶部 start -->
	  <%@include file="head.jsp"%>
<!-- 图书管理系统顶部  end -->
<!-- 2. 菜单导栏 start-->
<%@include file="menu_search.jsp" %>
<!-- 菜单导栏end -->
<!-- 3.图书管理系统用户注册  start -->
	<div id="divcontent">
		<form action="${pageContext.request.contextPath}/loginServlet" method="post" >
			<table width="850px" border="0" cellspacing="0">
				<tr>
					<td style="padding: 30px">
						<h1  align=center>登录</h1>
						<table width="50%" border="0" cellspacing="2" class="upline">
							<tr>
								<c:if test="${error!=null }">
									<td colspan="2" style="text-align:center;font-size:14px;color:red;">
										${error}
									</td>
								</c:if>
								
							</tr>
							<tr>
								<td style="text-align: right">用户名：</td>
								<td><input type="text" class="textinput"  id="username" name="username" onkeyup="checkUsername();"/>
								</td>
							</tr>
							<tr>
								<td style="text-align: right">密码：</td>
								<td><input type="password" class="textinput"  id="password" name="password" onkeyup="checkPassword();"/></td>
							</tr>								
							<tr>
								<td colspan="2" style="text-align: center">
									<input type="submit" name="submit" value="登录" style=" width:140px; height:35px ;" />
								</td>
							</tr>	
													
						</table>

						<table width="50%" border="0" cellspacing="0">
							
						</table>
					</td>
				</tr>
			</table>
		</form>
	</div>
	
 <!-- 图书管理系统用户注册  end -->

<!--  3.图书管理系统尾部 start -->
	<jsp:include page="foot.jsp"></jsp:include>
<!--  3.图书管理系统尾部 end  -->

</body>