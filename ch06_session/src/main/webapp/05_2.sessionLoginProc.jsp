<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="regMgr" class="ch06.RegisterMgr"/>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	if(regMgr.login(id,pw)){ //login()메소드 부르면서 id, pw가 있는지 확인
		// if조건이 참이면
		session.setAttribute("idKey",id);
%>
	<script type="text/javascript">
		alert("로그인이 되었습니다");
		location.href="05_3.sessionLoginOK.jsp";
	</script>
<%
	}else{
%>
	<script type="text/javascript">
		alert("로그인이 되지 않았습니다");
		location.href="05.sessionLogin.jsp";
	</script>
<%
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>05_2.sessionLoginProc</title>
</head>
<body>

</body>
</html>