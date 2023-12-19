<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	String mbti = request.getParameter("mbti");
	String name = request.getParameter("name");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1></h1>
	<jsp:forward page='<%=mbti+".jsp"%>'>
		<jsp:param value="<%=name %>" name="name"/>
	</jsp:forward>
	<!-- 보여줄 값이 있다면 jsp:param으로 가져올 수 있음 -->
	<%--
	forward문을 사용하면
	if문 사용하는 것과 같음
	<%
	if(mbti.equals("intj")) {
	%>
		<jsp:forward page="intj.jsp"/>
	<%
	}
	%> 
	--%>
</body>
</html>