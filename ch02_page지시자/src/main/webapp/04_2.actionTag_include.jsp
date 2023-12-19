<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>04_2.actionTag_include</title>
</head>
<body>
	<%
		String name = request.getParameter("name");
	%>
	include Action Tag에 포함되는 페이지 입니다<p/>
	<%=name %> Fighting!!! <!-- 사용자가 넣은 name값 출력 -->
</body>
</html>