<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>04.logout</title>
</head>
<body>
<!-- 여기서 session을 끊어줄것 -->
<%
	session.invalidate();
	response.sendRedirect("04.login.jsp");
%>
</body>
</html>