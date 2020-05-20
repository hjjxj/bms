<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<HTML>
<HEAD>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/admin/css/Style.css"
	rel="stylesheet" type="text/css" />
<script language="javascript"
	src="${pageContext.request.contextPath}/admin/js/public.js"></script>
<script type="text/javascript">
	//删除订单
	function o_del() {
		var msg = "您确定要删除该订单吗？";
		if (confirm(msg) == true) {
			return true;
		} else {
			return false;
		}
	}
	//还书操作
	function o_return() {
		var msg = "您确定要还书？";
		if (confirm(msg) == true) {
			return true;
		} else {
			return false;
		}
	}
	//借书申请的确定
	function o_lend() {
		var msg = "您确定要确定该借书申请？";
		if (confirm(msg) == true) {
			return true;
		} else {
			return false;
		}
	}
</script>
</HEAD>
<body>
	<br />
	<form id="Form1" name="Form1"
		action="${pageContext.request.contextPath}/findOrderByManyCondition"
		method="post">
		<table cellSpacing="1" cellPadding="0" width="100%" align="center"
			bgColor="#f5fafe" border="0">
			<TBODY>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3"><strong>查
							询 条 件</strong></td>
				</tr>
				<tr>
					<td>
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr>
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">
									订单编号</td>
								<td class="ta_01" bgColor="#ffffff"><input type="text"
									name="id" size="15" value="" id="Form1_userName" class="bg" />
								</td>
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">
									收件人：</td>
								<td class="ta_01" bgColor="#ffffff"><input type="text"
									name="receiverName" size="15" value="" id="Form1_userName"
									class="bg" /></td>
							</tr>
							<tr>
								<td width="100" height="22" align="center" bgColor="#f5fafe"
									class="ta_01"></td>
								<td class="ta_01" bgColor="#ffffff"><font face="宋体"
									color="red"> &nbsp;</font></td>
								<td align="right" bgColor="#ffffff" class="ta_01"><br /> <br /></td>
								<td align="right" bgColor="#ffffff" class="ta_01">
									<button type="submit" id="search" name="search"
										value="&#26597;&#35810;" class="button_view">
										&#26597;&#35810;</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
									type="reset" name="reset" value="&#37325;&#32622;"
									class="button_view" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3"><strong>订
							单 列 表</strong></td>
				</tr>
				<tr>
					<td class="ta_01" align="right"></td>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#f5fafe">
						<table cellspacing="0" cellpadding="1" rules="all"
							bordercolor="gray" border="1" id="DataGrid1"
							style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
							<tr
								style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">
								<td align="center" width="20%">订单编号</td>
								<td align="center" width="10%">用户</td>
								<td align="center" width="15%">图书</td>
								<td width="10%" align="center">状态</td>
								<td width="10%" align="center">订单时间</td>
								<td width="10%" align="center"><c:if test="${flag == true}">
										同意还书
									</c:if> <c:if test="${flag == false }">
										 同意借书申请
									</c:if></td>
								<td width="10%" align="center">删除</td>
							</tr>
							<c:forEach items="${orders}" var="order">
								<tr onmouseover="this.style.backgroundColor = 'white'"
									onmouseout="this.style.backgroundColor = '#F5FAFE';">
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="20%">${order.id}</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="10%">${order.user_id}</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="15%">${order.book_name }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="10%">${order.flag==false?"未成功":"已成功"}</td>
									<td width="8%" align="center">${order.time}</td>

									<td align="center" style="HEIGHT: 22px">
									<c:if test="${flag == true}">
										<a
											href="${pageContext.request.contextPath}/DeleteOrderServlet?id=${order.id}&flag=true" onclick="javascript:return o_return()">
												<img
												src="${pageContext.request.contextPath}/admin/images/i_ok.gif"
												border="0" style="CURSOR: hand">
										</a>
									</c:if>
									<c:if test="${flag == false}">
										<a
											href="${pageContext.request.contextPath}/AgreeLendServlet?id=${order.id}" onclick="javascript:return o_lend()">
												<img
												src="${pageContext.request.contextPath}/admin/images/i_ok.gif"
												border="0" style="CURSOR: hand">
										</a>
									</c:if>
									</td>
									<td align="center" style="HEIGHT: 22px">
										<!--  已支付，弹出提示框由操作人确认 --> <c:if test="${order.flag== true }">
											<a
												href="${pageContext.request.contextPath}/DeleteOrderServlet?id=${order.id}&flag=false"
												onclick="javascript:return o_del()"> <img
												src="${pageContext.request.contextPath}/admin/images/i_del.gif"
												width="16" height="16" border="0" style="CURSOR: hand">
											</a>
										</c:if> <!--  未支付 ，不能删除--> <c:if test="${order.flag==false}">
											<a href="javascript:alert('不能删除借书申请未成功的订单')"> <img
												src="${pageContext.request.contextPath}/admin/images/i_del.gif"
												width="16" height="16" border="0" style="CURSOR: hand">
											</a>
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</table>
					</td>
				</tr>
			</TBODY>
		</table>
	</form>
</body>
</HTML>