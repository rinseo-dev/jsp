<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	String mbti = request.getParameter("mbti");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>isfp</title>
</head>
<body>
	<b><%=name %></b>님의 MBTI는 <b><%=mbti %></b>입니다<p/>
	침대를 제일 좋아함
</body>
</html>