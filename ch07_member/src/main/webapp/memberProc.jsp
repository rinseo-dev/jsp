<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mDao" class="mem.MemberDao" />
<jsp:useBean id="bean" class="mem.Member" />
<jsp:setProperty name="bean" property="*" /> <!-- property모든값이라 setId, setName등 다 불러옴 -->
<%
	boolean result = mDao.insertMember(bean);
	String msg = "회원가입에 실패하였습니다";
	String location = "member.jsp";
	if(result){
		msg = "회원가입이 되었습니다";
		location = "login.jsp";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberProc</title>
</head>
<body>
	<script>
	alert("<%=msg %>");
	location.href="<%=location %>";
</script>
</body>
</html>