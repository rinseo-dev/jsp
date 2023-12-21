<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="regMgr" class="ch06.RegisterMgr"/>
<!-- regMgr이 ch06.RegisterMgr 이 클래스를 의미하게 됨 -->
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	// regMgr에서 id, pw를 불러옴
	if(regMgr.login(id,pw)){//true가 되면 id와 pw가 존재
		// RegisterMgr.java에서 return loginFlag;값이 true가 된다면.
		Cookie cookie = new Cookie("idKey",id);
		response.addCookie(cookie);
%>
	<script type="text/javascript">
		alert("로그인이 되었습니다");
		location.href="04_3.cookieLoginOK.jsp";
	</script>
<%
	}else{
		%>
			<script type="text/javascript">
				alert("로그인이 되지 않았습니다");
				location.href="04.cookieLogin.jsp";
			</script>
		<%
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>