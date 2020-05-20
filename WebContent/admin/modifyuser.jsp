<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="UTF-8">
<title>用户信息修改</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/style.css" type="text/css" />
</head>
<body class="main">
<!-- 1.网上书城顶部 start -->
	  <%@include file="head.jsp"%>
<!-- 网上书城顶部  end -->
<!--  2.图书管理系统 start -->
	<div id="divpagecontent">
	<form action="${pageContext.request.contextPath}/modifyUserServlet" method="post">
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td width="25%" > 
					<table width="100%" border="0" cellspacing="0" style="padding-left:30px;margin-top:40px;">
						<tr>
							<td class="listtd">
								<img src="${pageContext.request.contextPath }/client/images/icon1.png" width="15" height="10" />&nbsp;&nbsp;&nbsp;&nbsp; 
								<a href="${pageContext.request.contextPath }/admin/modifyuser.jsp">用户管理</a>
							</td>
						</tr>
						<tr>
							<td class="listtd">
								<img src="${pageContext.request.contextPath }/client/images/icon1.png" width="15" height="10" />&nbsp;&nbsp;&nbsp;&nbsp; 
								<a href="${pageContext.request.contextPath}/ListBookServlet">图书管理</a>
							</td>
						</tr>
						<tr>
							<td class="listtd">
								<img src="${pageContext.request.contextPath }/client/images/icon2.png" width="15" height="10" />&nbsp;&nbsp;&nbsp;&nbsp; 
								<a href="${pageContext.request.contextPath}/order">还书操作</a>
							</td>
						</tr>
						<tr>
							<td class="listtd">
								<img src="${pageContext.request.contextPath }/client/images/icon3.png" width="15" height="10" />&nbsp;&nbsp;&nbsp;&nbsp; 
								<a href="${pageContext.request.contextPath}/logoutServlet">用戶退出</a>
							</td>
						</tr>
					</table>
				</td>
				<td>
					<table cellspacing="0" class="infocontent">
						<tr>
							<td>
								<table width="100%" border="0"  cellspacing="2" class="upline" >
									<tr>
										<td style="width:25%" >会员名：</td>
										<td>密码：</td>
										<td>性别：</td>
										<td>会员邮箱：</td>
									</tr>
									
								</table>
							</td>
							
						
					</table>
				</td>
			</tr>
		</table>
		</form>
	</div>
<!--  图书管理系统 end  -->

<!--  3.图书管理系统顶部尾部 start -->
	<jsp:include page="foot.jsp"></jsp:include>
<!--  图书管理系统尾部 end  -->


</body>
</html>