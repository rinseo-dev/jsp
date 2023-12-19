<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>05_2.actionTag_include</title>
</head>
<body>
	<%
		String siteName = request.getParameter("siteName");
		String siteTel = request.getParameter("siteTel");
	%>
	
	include Action Tag 포함되는 페이지입니다<p/>
	<%=siteName %><p/>
	<%=siteTel %><p/>
</body>
</html>