<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="jsp 현재페이지 정보" %>
<%@ page import="java.util.*" session="true" autoFlush="true" %>
<%@ page buffer="16kb" %>
<%@ page trimDirectiveWhitespaces = "true" %>
<!-- trimDirectiveWhitespaces="true"가 없으면 페이지를 띄워서 소스를 볼 때
	page내용 모두가 빈칸으로 표시됨 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>01.page_info</title>
</head>
<body>
	<% Date date = new Date(); %>
	<%=this.getServletInfo() %>
	<!-- 현재 페이지에 info로 되어 있는 정보를 가져오는 메소드 사용 -->
	<p>현재 날짜와 시간은?</p>
	<%=date.toLocaleString() %> <!-- 이렇게 하면 로컬 시간으로 표시됨 -->
	
</body>
</html>