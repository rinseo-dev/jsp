<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mDao" class="mem.MemberDao"/>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	// 로그인 아이디, 패스워드를 MemberDao로 넘겨서 true, false 체크
	boolean result = mDao.loginMember(id,pwd);

	String msg = "로그인에 실패하였습니다";
	if(result){ // id,pwd가 참이면 msg가 바뀌어서 표시됨
		session.setAttribute("idKey",id);
		msg = "로그인이 되었습니다";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginProc</title>
</head>
<body>
	<script>
		alert("<%=msg %>");
		location.href="login.jsp";
	</script>
</body>
</html>