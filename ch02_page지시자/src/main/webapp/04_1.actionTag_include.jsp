<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>04_1.actionTag_include</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		// String name = request.getParameter("name"); 넘어온 값에서 name가져오기
		String name = "Korea web JSP";
	%>
	<h1>Action Tag Include</h1>
	<jsp:include page="04_2.actionTag_include.jsp"/><p/>
	<!-- 이렇게 하면 페이지를 호출만 하고 파라미터 값을 넘겨주지않음.
	사이에 파라미터 값을 넣고 < / jsp:include>로 닫아주면 값을 넘겨줄 수 있음-->
	include Action Tag의  Body입니다.
	<!-- 사용자가 action을 취했을 때 여기에 04_2페이지를 포함해서 보여줌-->
</body>
</html>