<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>电子书城</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/client/css/main.css"
	type="text/css" />
</head>
<body class="main">
	<p:user />
	<jsp:include page="head.jsp" />
	<jsp:include page="menu_search.jsp" />
	<div id="divpagecontent">
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td>
					<form id="orderForm"
						action="${pageContext.request.contextPath}/CreateOrderServlet"
						method="post">
						<table cellspacing="0" class="infocontent">
							<tr>
								<td>
									<table width="100%" border="0" cellspacing="0">
										<tr>
											<td>
												<p>你好，${user.username}！欢迎您来到网上书城结算中心</p>
											</td>
										</tr>
										<tr>
											<td>
												<table cellspacing="1" class="carttable">
													<tr>
														<td width="10%">序号</td>
														<td width="15%">图书名称</td>
														<td width="10%">类别</td>
														<td width="10%">可借阅时间</td>
													</tr>
												</table> <c:set value="0" var="totalPrice" /> <c:forEach
													items="${cart}" var="entry" varStatus="vs">
													<table width="100%" border="0" cellspacing="0">
														<tr>
															<td width="10%">${vs.count}</td>
															<td width="15%">${entry.key.name }</td>
															<td width="10%">${entry.key.category }</td>
															<td width="10%">两个月</td>
														</tr>
													</table>
													<c:set var="totalPrice"
														value="${totalPrice+entry.key.price*entry.value}" />
												</c:forEach>
												<table cellspacing="1" class="carttable">
													<tr>
														<td style="text-align: right; padding-right: 40px;"><font
															style="color: #FF0000">合计：&nbsp;&nbsp;${cart.size()}本</font>
															<input type="hidden" name="money" value="${cart.size()}">
														</td>
													</tr>
												</table>
												<hr />
												<div style="width: 100%; height: 51px; text-align: right">
													<input type="submit" name="submit" value="提交申请 " border="0"
														style="width: 120px; height: 35px; background-color: yellow; margin-top: 10px;" />
												</div>


											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
		</table>
	</div>
	<jsp:include page="foot.jsp" />
</body>
</html>
