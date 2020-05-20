<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书管理前台网站</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/client/css/main.css" type="text/css" />
</head>
<body class="main">

	  <%@include file="head.jsp"%>
	  <%@ include file="menu_search.jsp"%> 
<!--  2.图书管理系统 start -->
	<div id="divpagecontent">
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td width="25%">
					<table width="100%" border="0" cellspacing="0" style="margin-top:30px; padding-left:30px;">
						<tr>
							<td class="listtitle">我的帐户</td>
						</tr>
						<tr>
							<td class="listtd">
								<img src="${pageContext.request.contextPath }/client/images/icon1.png" width="15" height="10" />&nbsp;&nbsp;&nbsp;&nbsp; 
								<a href="${pageContext.request.contextPath }/client/modifyuser.jsp">用户信息修改</a>
							</td>
						</tr>
						<tr>
							<td class="listtd">
								<img src="${pageContext.request.contextPath }/client/images/icon2.png" width="15" height="10" />&nbsp;&nbsp;&nbsp;&nbsp; 
								<a href="${pageContext.request.contextPath}/FindOrderByUserServlet">订单查询</a>
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
								<table cellspacing="0" class="infocontent" style="margin-top:60px;">
									<tr>
										<td style="padding:20px;"><p>
											<img src="${pageContext.request.contextPath }/client/images/myad.jpg" width="631" height="436" />
											</p>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
<!--  图书管理系统 end  -->

<!--  3.图书管理系统顶部尾部 start -->
	<jsp:include page="foot.jsp"></jsp:include>
<!--  图书管理系统尾部 end  -->


</body>
</html>
