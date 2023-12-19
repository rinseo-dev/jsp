<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp" %> <!-- 같은 page 지시자 안에 다 넣어줘도 되긴 함 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>02.userError 사용자 에러페이지 만들기</title>
</head>
<body>
	<%
		int one = 1;
		int zero = 0;
	%>
	<h1>사용자 에러페이지 만들기</h1>
	<p>one과 zero의 사칙연산</p>
	one+zero=<%=one+zero %><p/>
	one-zero=<%=one-zero %><p/>
	one*zero=<%=one*zero %><p/>
	one/zero=<%=one/zero %><p/> <!-- 1을 0으로 나누면 에러가 발생하게 됨. -->
	<!-- 발생할 오류 메시지를 @ page 지시자에 넣어줘야 함 -->
</body>
</html>