<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>bookStore列表</title>
<%--导入css --%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/client/css/main.css"
	type="text/css" />
</head>
<body class="main">
	<jsp:include page="head.jsp" />
	<jsp:include page="menu_search.jsp" />
	<div id="divpagecontent">
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td>
					<table cellspacing="0" class="listcontent">
						<tr>
							<td>
								<h2>商品目录</h2>
								<hr />
								<h2>${bean.category}</h2>&nbsp;&nbsp;&nbsp;&nbsp;共${bean.totalCount}种商品
								<hr />
								<div style="margin-top: 20px; margin-bottom: 5px">
									<img
										src="${pageContext.request.contextPath }/client/images/productlist.gif"
										width="100%" height="38" />
								</div>
								<table cellspacing="0" class="booklist">
									<tr>
										<c:forEach items="${bean.bs}" var="b" varStatus="vs">
											<td>
												<div class="divbookpic">
													<b> <a
														href="${pageContext.request.contextPath}/FindBookByIdServlet?id=${b.id}">
															<img src="${pageContext.request.contextPath}${b.imgurl}"
															width="115" height="129" border="0" />
													</a>
													</b>
												</div>
												<div class="divlisttitle">
													<a
														href="${pageContext.request.contextPath}/FindBookByIdServlet?id=${b.id}">书名：
														${b.name}<br />售价：￥${b.price}
													</a>
												</div>
											</td>
										</c:forEach>
									</tr>
								</table>
								<div class="pagination">
									<ul>
										<c:if test="${bean.currentPage!=1}">
											<li class="disablepage_p"><a class="disablepage_a"
												href="${pageContext.request.contextPath}/ShowBookByPageServlet?currentPage=${bean.currentPage-1}&category=${bean.category}"></a>
											</li>
										</c:if>
										<c:if test="${bean.currentPage==1}">
											<li class="disablepage_p2"></li>
										</c:if>
										<c:forEach begin="1" end="${bean.totalPage}" var="pageNum">
											<c:if test="${pageNum==bean.currentPage}">
												<li class="currentpage">${pageNum }</li>
											</c:if>
											<c:if test="${pageNum!=bean.currentPage}">
												<li><a
													href="${pageContext.request.contextPath}/ShowBookByPageServlet?currentPage=${pageNum}&category=${bean.category}">${pageNum}</a>
												</li>
											</c:if>
										</c:forEach>

										<c:if
											test="${bean.currentPage==bean.totalPage||bean.totalPage==0}">
											<li class="disablepage_n2"></li>
										</c:if>
										<c:if
											test="${bean.currentPage!=bean.totalPage&&bean.totalPage!=0}">
											<li class="disablepage_n"><a class="disablepage_a"
												href="${pageContext.request.contextPath}/ShowBookByPageServlet?currentPage=${bean.currentPage+1}&category=${bean.category}"></a>
											</li>
										</c:if>
									</ul>
								</div>
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
