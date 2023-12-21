<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie cookie = new Cookie("myCookie","Apple");
	cookie.setMaxAge(60); // 초단위-1분
	cookie.setValue("Banana"); // 이 값으로 바꾸시오
	response.addCookie(cookie);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>01.cookie</title>
</head>
<body>
	<h1>Cookie를 사용하여 연결 유지</h1>
	쿠키를 만듭니다<p/>
	쿠키 내용은 <a href="01_2.cookie.jsp">클릭하세요</a>
</body>
</html>