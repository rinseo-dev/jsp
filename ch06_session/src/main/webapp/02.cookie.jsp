<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	response.addCookie(new Cookie("NAME","John"));
	response.addCookie(new Cookie("GENDER","MALE"));
	response.addCookie(new Cookie("AGE","24"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>02.cookie</title>
</head>
<body>
<h1>Cookie를 사용하여 연결 유지</h1>
	쿠키를 만듭니다<p/>
	쿠키 내용은 <a href="02_2.cookie.jsp">클릭하세요</a>
</body>
</html>