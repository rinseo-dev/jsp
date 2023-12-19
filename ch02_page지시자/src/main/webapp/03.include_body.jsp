<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03.include_body</title>
</head>
<body>
	<h1>include 하기</h1>
	<!-- 사용자가 어떤 액션을 취하지 않아도 보여주는게 include 지시자 -->
	<%@ include file="03_1.include_Top.jsp" %><p/>
	<br><br><br>
	include 지시자의 body부분 입니다<br><p/>
	<br><br><br>
	<%@ include file="03_2.include_Bottom.jsp" %>
</body>
</html>