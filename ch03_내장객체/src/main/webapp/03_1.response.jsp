<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03_1.response</title>
</head>
<body>
	<%
		if(request.getProtocol().equals("HTTP/1.1")){ 
			response.setHeader("Cache-Control","no-cache"); // HTTP/1.1버전 일 때
		}else{
			response.setHeader("Pragma","no-cache"); // HTTP/1.0버전 일 때
		}
	%>
	<h1>Response 다음 페이지</h1>
	03.response.jsp에서 03_1.response.jsp 파일로 바로 클라이언트에게 보여줌
</body>
</html>