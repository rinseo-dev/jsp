<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id ="";
	Cookie[] cookies = request.getCookies();
	for(int i=0; i<cookies.length; i++){
		if(cookies[i].getName().equals("idKey")){ // cookies i번째의 이름이 idKey와 같으면
			cookies[i].setMaxAge(0); // 유지시간 0
			response.addCookie(cookies[i]);
		}
	}
%>
<script type="text/javascript">
	alert("로그아웃 되었습니다");
	location.href="04.cookieLogin.jsp";
</script>

</body>
</html>