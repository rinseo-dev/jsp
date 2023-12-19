<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>06_1.actionTag_forward</title>
</head>
<body>
<!-- body에서 변수를 호출하기 전에 변수가 정의가 되어 있어야 사용할 수 있음.
	단, 선언문은 화면이 로딩될때 제일 처음 실행되므로 상관 없음 -->
	
<h1>여기는 forward파일이 거쳐가는 페이지</h1>
Forward Tag의 포워딩이 되기 전의 페이지 임<p/>
<jsp:forward page="06_2.actionTag_forward.jsp"/>
<!-- 06_2페이지로 포워딩 하겠다고 선언 -->
</body>
</html>