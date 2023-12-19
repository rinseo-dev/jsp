<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03.response</title>
</head>
<body>
	<h3>sendRedirect Ex</h3>
	<%
		//response.sendRedirect("03_1.response.jsp");
		// ("")안에 있는 URL로 보냄
		
		response.sendRedirect("https://www.naver.com");
		
	%>
</body>
</html>