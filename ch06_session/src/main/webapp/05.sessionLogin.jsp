<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>05.sessionLogin</title>
</head>
<body>
<%
	String id = (String)session.getAttribute("idKey");
	// idKey가 존재하면 String id에 넣어서 사용하게 됨
	if(id != null){ // null과 같지 않으면 로그인 한 상태
%>		
	<h2>session 로그인</h2>
	<h3><%=id %>님이 로그인 하였습니다</h3>
	<a href="05_4.sessionLogout.jsp">로그아웃</a>
<%
	}else{
%>
	<h1>Session 로그인</h1>
	<form method="post" action="05_2.sessionLoginProc.jsp">
		<table border="1" align="center" width="300px">
			<tr>
				<th colspan="2">Login</th>
			</tr>
			<tr>
				<td>ID</td>
				<td><input name="id" required></td>
			</tr>
			<tr>
				<td>PW</td>
				<td><input type="password" name="pw" required></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="login">&emsp;
					<input type="reset" value="reset">
				</td>
			</tr>
		</table>
	</form>
<%
	} //else
%>

</body>
</html>