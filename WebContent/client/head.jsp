<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="cn.itcast.bms.domain.User"%>
<div id="divhead">
	<table cellspacing="0" class="headtable" width="100%">
		<tr>
			<td>
				<a href="${pageContext.request.contextPath}/client/login.jsp">
				   	<div class="title">图书管理系统</div>
				 </a> 
			</td>
		</tr>
		<tr>
			<td style="text-align:right;padding-right:40px;background-color:#fff;">
				 <img src="${pageContext.request.contextPath}/client/images/cart.gif" width="26" height="23" style="margin-bottom:-4px" />
				   &nbsp; 
				  <a href="${pageContext.request.contextPath}/client/cart.jsp">购物车</a> 
				| <a href="#">帮助中心</a> 
				<%-- | <a href="${pageContext.request.contextPath}/MyAccountServlet">我的帐户</a> --%>
				<% 
				User user = (User) request.getSession().getAttribute("user");
				if(null == user){
				%>
				| <a href="${pageContext.request.contextPath}/MyAccountServlet">登录</a>
				| <a href="${pageContext.request.contextPath}/client/register.jsp">新用户注册</a>							
				<% 	
				}else{
				%>
				| <a href="${pageContext.request.contextPath}/MyAccountServlet">我的账户</a>
				| <a href="${pageContext.request.contextPath}/logoutServlet" onclick="javascript:return confirm_logout()">用户退出</a>
				&nbsp;欢迎您： ${user.username}
				<% 	
				}
				%>			
			</td>	
		</tr>
	</table>	
</div>

