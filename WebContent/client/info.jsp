<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>电子书城</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/client/css/main.css" type="text/css" />
</head>
<body class="main">
	<jsp:include page="head.jsp" />
	<jsp:include page="menu_search.jsp" />
	<div id="divpagecontent">
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td>
				    <div style="text-align:center; margin:5px 10px 5px 0px">
						<h2>${ b.category} </h2>
					</div>
					<table cellspacing="0" class="infocontent">
						<tr>
							<td>
								<table width="100%" border="0" cellspacing="0">
									<tr>
										<td width="30%">
											<div class="divbookcover">
												<b>
													<img src="${pageContext.request.contextPath}${b.imgurl}" width="213" height="269" border="0" />
												</b>
											</div>
											<div style="text-align:center; margin-top:10px">
												<a href="${pageContext.request.contextPath}/AddCartServlet?id=${b.id}">
													<input type="button" value="去借书" style="background-color: #7ED321;width: 76px;height: 36px; font-size:16px;"/>
													<!-- <img src="${pageContext.request.contextPath }/client/images/buybutton.gif" border="0" width="100" height="25" /> 
												 	-->
												</a>
											</div>
										</td>
										<td style="padding:20px 5px 5px 5px">
											<img src="${pageContext.request.contextPath }/client/images/miniicon3.gif" width="16" height="16" />
											<font class="bookname">&nbsp;${b.name}</font>
											<hr />售价：<font color="#FF0000">￥${b.price}</font>
											<hr /> 类别：${b.category}
											<hr />
											<b>
												<b>内容简介：</b>
											</b> ${b.description}
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
