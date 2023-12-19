<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String season = request.getParameter("season");
	String fruit = request.getParameter("fruit");
	// 사용자가 선택한 season, fruit값을 가져옴
	
	//session.setAttribute("idKey",id);
	// 속성을 넣음. key는 idKey고 값으로 사용자가 넣은 id를 넣음
	String id = (String)session.getAttribute("idKey"); // session을 String으로 형변환
	// 05_1페이지에서 idKey에 사용자가 입력한 id값을 받았음. 그걸 활용하기 위해 String id값에 넣어줌
	
	String sessionId = session.getId(); // 현재 session Id값을 가져옴
	// 서버에 접속한 클라이언트에게 자동으로 부여된 session에서 session의 id값을 가져오는 것
	
	int intervalTime = session.getMaxInactiveInterval(); // 세션 만료시간을 가져옴
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% if(id != null){
	%>
		<h1>Session 3번째 페이지</h1>
		<%=id %>님이 좋아하는 계절과 과일은 <%=season %>과 <%=fruit %>입니다<p/>
		세션 ID : <%=sessionId %><p/>
		세션 유지시간 : <%=intervalTime %>초<p/>
	<%
		session.invalidate();
	}else{
		out.print("세션의 시간이 경과하였거나 다른 이유로 연결할 수 없습니다");
	}
	%>
	
</body>
</html>