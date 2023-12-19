<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03_1.include_footer</title>
</head>
<body>
	include 지시자의 Bottom부분 입니다<br>
	<% Date date = new Date(); %>
	<%=date.toLocaleString() %>
</body>
</html>