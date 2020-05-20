<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="UTF-8">
<title>用户信息修改</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/client/css/main.css" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/client/js/form.js"></script>
</head>
<body class="main">
<!-- 1.网上书城顶部 start -->
	  <%@include file="head.jsp"%>
<!-- 网上书城顶部  end -->
	 <%@ include file="menu_search.jsp"%> 
<!--  2.图书管理系统 start -->
	<div id="divpagecontent">
	<form action="${pageContext.request.contextPath}/modifyUserServlet" method="post">
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
								<table width="100%" border="0"  cellspacing="2" class="upline" >
									
									<tr>
										<td style="text-align:right;width:20%" >会员名：</td>
										<td style="padding-left:20px">${user.username }</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td style="text-align:right">修改密码：</td>
										<td><input type="password" name="password" class="textinput" /></td>
										<td><font id="passwordMsg"></font><font color="#999999">密码设置至少6位，请区分大小写</font></td>
									</tr>
									<tr>
										<td style="text-align:right">重复密码：</td>
										<td><input type="password" name="repassword" class="textinput" /></td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td style="text-align:right">性别：</td>
										<td colspan="2">&nbsp;&nbsp;
											<input type="radio" name="radiobutton" value="radiobutton" ${user.gender=='男'?'checked':'' }/> 男
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="radio" name="radiobutton" value="radiobutton"  ${user.gender=='女'?'checked':'' }/> 女
										</td>
									</tr>
									<tr>
										<td style="text-align:right">会员邮箱：</td>
										<td style="width:40%; padding-left:20px">${ user.email }</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td style="text-align:right">可借阅数：</td>
										<td style="width:40%; padding-left:20px">${ user.bnum }</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td colspan="3" style="text-align: center">
											<input type="submit" name="submit" value="确定" style=" width:140px; height:35px ;" />
										</td>
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