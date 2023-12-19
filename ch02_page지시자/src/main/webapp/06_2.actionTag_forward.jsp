<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>06_2.actionTag_forward</title>
</head>
<body>
	<h1>Forward Tag Ex1 맨 마지막 페이지</h1>
	당신의 아이디는 <b><%=id %></b>이고,<br>
	패스워드는 <b><%=pw %></b>입니다.
	<!-- 중간 페이지는 마지막에 호출될 페이지를 위한 징검다리  -->
</body>
</html>