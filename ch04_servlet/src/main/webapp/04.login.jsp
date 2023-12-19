<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>04.login</title>
</head>
<body>
<%
	String id = (String)session.getAttribute("idKey"); // 여기에 사용자의 id가 있음
	// session타입은 String으로 바꿔줘야함. 형변환
	if(id != null){// id=null이면 처음 들어온 사람.
		// out.print(id+"님 반갑습니다"); 이렇게 해도 됨
%>
		<%=id %>님 반갑습니다
		<a href="04.logout.jsp">로그아웃</a>
<%
	}else{ // id=null인 경우는 아래 로그인 페이지를 띄워줌.
%>
	<h1>Post Servlet방식 로그인(session유지)</h1>
	<form method="post" action="LoginServlet">
		ID : <input name="id"><p/>
		PW : <input type="password" name="pw"><p/>
		<input type="submit" value="로그인">
	</form>
		
<%
	}
%>

	
</body>
</html>