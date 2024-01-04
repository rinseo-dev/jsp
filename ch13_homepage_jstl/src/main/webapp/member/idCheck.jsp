<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mDao" class="mem.MemberDao"/>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	// out.print("id:"+id); 테스트
	boolean result = mDao.checkId(id);
	// checkId를 memberDao에 만들어줘야함.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>idCheck</title>
</head>
<body>
	<%
		if(result){ // id값이 true면 중복인 상태
			out.print(id+"는 이미 존재하는 ID입니다<p/>");
		}else{
			out.print(id+"는 사용 가능합니다<p/>");
		}
	%>
	<a href="#" onclick="self.close();">닫기</a>
</body>
</html>