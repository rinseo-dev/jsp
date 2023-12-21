<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>04_3.cookieLoginOK</title>
</head>
<body>
<%
	String id ="";
	Cookie[] cookies = request.getCookies();
	for(int i=0; i<cookies.length; i++){
		if(cookies[i].getName().equals("idKey")){ // cookies i번째의 이름이 idKey와 같으면
			id = cookies[i].getValue(); // cookies배열에 있는 i 번째 값에서 value를 가져와서 id에 넣음	
		}
	}
%>

	<%=id %>님 반갑습니다.<p/>
	<a href = "04_4.cookieLogout.jsp">로그아웃</a>
	<!-- logout은 쿠키를 삭제해주면 됨. setMaxAge()를 0으로 하면 끊김 -->
</body>
</html>