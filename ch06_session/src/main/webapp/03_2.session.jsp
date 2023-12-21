<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03_2.session</title>
</head>
<body>
<%
	String id = (String)session.getAttribute("idKey");
	Enumeration en = session.getAttributeNames();
	while(en.hasMoreElements()){
		String name = (String)en.nextElement(); // Enumer type이라 형변환
		String value = (String)session.getAttribute(name);
		out.print("session name : " + name + "<p/>");
		out.print("session value : " + value + "<hr>");
	}
%>
</body>
</html>