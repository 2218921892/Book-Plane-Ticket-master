
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
	session.setAttribute("admin_id", null);//清除当前管理员用户的登录状态
	response.sendRedirect("/jsp_plane_ticket_book/admin/index.jsp");//重定向
%>
</body>
</html>