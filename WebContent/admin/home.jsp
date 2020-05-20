<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>菜单</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/style.css" type="text/css" />
</head>
<frameset rows="130,30,*,43" frameborder=0 border="0" framespacing="0">
	
  <frame src="${pageContext.request.contextPath}/admin/head.jsp" name="topFrame" scrolling="NO" noresize>
  <frame src="${pageContext.request.contextPath}/admin/top.jsp" name="topFrame" scrolling="NO" noresize>
  <frameset cols="159,*" frameborder="0" border="0" framespacing="0">
		<frame src="${pageContext.request.contextPath}/admin/left.jsp" name="leftFrame" noresize scrolling="YES">
		<frame src="${pageContext.request.contextPath}/admin/loginsuccess.jsp" name="mainFrame">
  </frameset>
  <frame src="${pageContext.request.contextPath}/client/foot.jsp" name="bottomFrame" scrolling="NO"  noresize>
</frameset>

</html>