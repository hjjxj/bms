<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书后台管理系统</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/style.css" type="text/css" />
</head>
<body>
<!-- 1.图书管理系统顶部 start -->
	  <%@include file="head.jsp"%>
<!-- 图书管理系统顶部  end -->
<!-- 2.图书后台管理系统 start -->
<!--  style="width:1002px; height:700px"-->
<div id="divpagecontent">
		<table width="100%" height="700px" border="0" cellspacing="0">
			<tr>
				<td width="25%"  bgcolor="#f0f0f0"> 
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
					<table width="100%" height="180px" border="0" cellspacing="0" class="infocontent">
						<tr>
							<td> 
								<table width="100%"  border="0"  cellspacing="0" >
									<tr>
										<td width="100%"  class="ta_01" bgcolor="#f59f1d" style="text-align:center;">
											<span style="font-size:20px;">系统首页</span>
										</td>
									</tr>
									<tr>
										<td width="100%" height="84px" style="text-align:center;padding-top:30px;" >
											<span style="font-size:20px;">登录成功！！！</span>
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


<!-- 图书后台管理系统 end -->
<!--  3.图书管理系统顶部尾部 start -->
	<jsp:include page="foot.jsp"></jsp:include>
<!--  图书管理系统尾部 end  -->
	
</body>
</html>