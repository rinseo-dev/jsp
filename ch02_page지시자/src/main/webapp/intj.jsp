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
<title>intj</title>
</head>
<body>
	<b><%=name %></b>님의 MBTI는 <b><%=mbti %></b>입니다<p/>
	얘넨 진짜 힘들게 사는듯..5년 뒤 미래도 정해져있음;
</body>
</html>