<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = (String)session.getAttribute("idKey");
/*
session.getAttribute("idKey"): 현재 세션에서 "idKey"라는 이름의 속성 값을 가져오는 메서드
이 값은 Object 타입으로 반환됨

(String):String으로 형변환. 세션에서 가져온 값이 어떤 타입이든 간에 String으로 형변환하여 id 변수에 저장 

코드 실행 후에는 id변수에String 타입으로 저장되게 됨.
세션을 통해 사용자의 정보를 유지하고 해당 정보를 JSP 페이지에서 사용
*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
<% if(id != null){ // 로그인이 안된 상태%>
	<b><%=id %></b>님 환영합니다.
	<p>즐거운 하루 되세요</p>
	<a href="logout.jsp">로그아웃</a>
<% }else{ %>
	<h3>로그인</h3>
	<form method="post" action="loginProc.jsp">
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
				<td><input type="password" name="pwd" required></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="login">&emsp;
					<input type="reset" value="reset">&emsp;
					<input type="button" value="회원가입" onclick="location.href='member.jsp'">
				</td>
			</tr>
		</table>
	</form>
<%} %>
</body>
</html>