<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate(); 
%>
<script type="text/javascript">
	alert("로그아웃 되었습니다");
	location.href="05.sessionLogin.jsp";
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>05_4.sessionLogout</title>
</head>
<body>

</body>
</html>