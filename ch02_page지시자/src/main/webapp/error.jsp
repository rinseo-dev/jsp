<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %> <!-- 에러페이지임을 명시함 -->
<!-- errorPage="error.jsp"로 에러가 발생했을 때 띄울 페이지를 설정해줬고,
	isErrorPage="true"를 선언해주면 error났을 때 이페이지를 가져오게 함 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>error</title>
</head>
<body>
	<h1>Error Page</h1>
	<p>다음과 같은 예외가 발생되었습니다</p>
	0으로 나누면 안됨
	<%-- 에러타입 : <%=exception.getClass().getName() %>
	에러메시지 : <%=exception.getMessage() %> --%>
</body>
</html>