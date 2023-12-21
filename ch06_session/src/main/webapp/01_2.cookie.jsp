<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>01_2.cookie</title>
</head>
<body>
<%
	Cookie[] cookies = request.getCookies();
	if(cookies != null){
		for(int i = 0; i<cookies.length; i++ ){
			if(cookies[i].getName().equals("myCookie")){ // i번째가 myCookie와 같다면
				out.print("Cookie Name : " + cookies[i].getName()+"<p/>");
				out.print("Cookie Value : " + cookies[i].getValue()+"<p/>");
			}
		}
	}
%>

</body>
</html>