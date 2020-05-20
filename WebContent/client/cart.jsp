<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>电子书城</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/client/css/main.css" type="text/css" />
<script>
	//当商品数量发生变化时触发该方法
	function changeProductNum(count, totalCount, id) {
		count = parseInt(count);
		totalCount = parseInt(totalCount);
		//如果数量为0，判断是否要删除商品
		if (count == 0) {
			var flag = window.confirm("确认删除商品吗?");
	
			if (!flag) {
				count = 1;
			}
		}
		if (count > totalCount) {
			alert("已达到商品最大购买量");
			count = totalCount;
		}
		location.href = "${pageContext.request.contextPath}/changeCart?id="
				+ id + "&count=" + count;
	}
	//删除购物车中的商品
	function cart_del() {   
	    var msg = "您确定要删除该商品吗？";   
	    if (confirm(msg)==true){   
	    return true;   
	    }else{   
	    return false;   
	    }   
	}   
</script>
</head>
<body class="main">
	<p:user/>
	<jsp:include page="head.jsp" />
	<jsp:include page="menu_search.jsp" />
	<div id="divpagecontent">
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td>
					<table cellspacing="0" class="infocontent">
						<tr>
							<td>
								<table width="100%" border="0" cellspacing="0">
									<tr>
										<td>
											<img src="${pageContext.request.contextPath}/client/images/buy1.gif" width="635" height="38" />
										</td>
									</tr>
									<tr>
										<td>
											<table cellspacing="1" class="carttable">
												<tr>
													<td width="10%">序号</td>
													<td width="20%">商品名称</td>
													<td width="10%">价格</td>
													<td width="10%">库存</td>
													<td width="10%">取消</td>
												</tr>
											</table>
											<!-- 循环输出商品信息 -->
											
											<c:forEach items="${cart}" var="entry" varStatus="vs">
												<table width="100%" border="0" cellspacing="0">
													<tr>
														<td width="10%">${vs.count}</td>
														<td width="20%">${entry.key.name }</td>
														<td width="10%">${entry.key.price }</td>
														<td width="10%">${entry.key.pnum}</td>
														<td width="10%">
														    <!-- 删除商品 -->
															<a href="${pageContext.request.contextPath}/ChangeCartServlet?id=${entry.key.id}&count=0"
															style="color:#FF0000; font-weight:bold" onclick="javascript:return cart_del()">X</a>
														</td>
													</tr>
												</table>
											
											</c:forEach>

											<table cellspacing="1" class="carttable">
												<tr>
													<td style="text-align:right; padding-right:40px;">
														<font style="color:#FF6600; font-weight:bold">合计：&nbsp;&nbsp;${cart.size()}本</font>
													</td>
												</tr>
											</table>
											<div style="text-align:right; margin-top:10px">
											    <!--继续购物 -->
												<a href="${pageContext.request.contextPath}/ShowBookByPageServlet">
													<img src="images/gwc_jx.gif" border="0" />
												</a>
												&nbsp;&nbsp;&nbsp;&nbsp;
                                                 <!--结账 -->
												<a href="${pageContext.request.contextPath}/client/order.jsp">
													<img src="${pageContext.request.contextPath}/client/images/gwc_buy.gif" border="0" />
												</a>
											</div>
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
	<jsp:include page="foot.jsp" />
</body>
</html>
