<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>04.cookieLogin</title>
</head>
<body>
<%
// 04_3.cookieLoginOK.jsp에 있던 코드 가져옴/ 아래 식으로 id를 얻어올 수 있음
	String id ="";
	Cookie[] cookies = request.getCookies();
	for(int i=0; i<cookies.length; i++){
		if(cookies[i].getName().equals("idKey")){ // cookies i번째의 이름이 idKey와 같으면
			id = cookies[i].getValue(); // cookies배열에 있는 i 번째 값에서 value를 가져와서 id에 넣음	
		}
	}
	if(id.equals("")) { // id가 비어있으면 = id = cookies[i].getValue();가 없다는 것
		// 뭐라더라 처음 로그인 하면 쿠키가 비어있다고?
%>
	<h1>Cookie 로그인</h1>
	<form method="post" action="04_2.cookieLoginProc.jsp">
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
	}else{
%>
	<%=id %>님이 로그인 되어 있습니다
	<a href = "04_4.cookieLogout.jsp">로그아웃</a>
<%
	}
%>

</body>
</html>