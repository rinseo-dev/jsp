<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>06.actionTag_forward</title>
</head>
<body>
	<form action="06_1.actionTag_forward.jsp"> <!-- submit 누르면 action 경로로 -->
		ID : <input name="id"><p/>
		PW : <input name="pw"><p/>
		<input type="submit" value="서버로 전송">
	</form>
	이 페이지에서는 사용자로부터 값을 받고, 06_1.actionTag_forward.jsp는 중간다리역할
</body>
</html>