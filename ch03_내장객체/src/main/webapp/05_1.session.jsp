<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	session.setAttribute("idKey", id);// session에는 true가 기본값
	// key:value형태로 "idKey"가 key, 사용자가 넣은 id가 value가 됨. idKey에 사용자가 입력한 id를 저장
	session.setMaxInactiveInterval(60*5); // 초 분 시 순으로 올라감. 만료시간 5분 설정
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>05_1.session</title>
</head>
<body>
	<h1>Session 2페이지</h1>
	<form method="post" action="05_2.session.jsp">
		1. 가장 좋아하는 계절은?<p/>
		<input type="radio" name="season" value="봄">봄&emsp;
		<input type="radio" name="season" value="여름">여름&emsp;
		<input type="radio" name="season" value="가을">가을&emsp;
		<input type="radio" name="season" value="겨울">겨울<p/><br>
		
		2. 가장 좋아하는 과일은?<p/>
		<input type="radio" name="fruit" value="포멜로">포멜로&emsp;
		<input type="radio" name="fruit" value="스위티">스위티&emsp;
		<input type="radio" name="fruit" value="자몽">자몽&emsp;
		<input type="radio" name="fruit" value="레드향">레드향<p/>
		
		<input type="submit" value="전송">
	</form>
</body>
</html>