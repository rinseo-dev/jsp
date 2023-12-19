<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page buffer="5kb" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>04.out</title>
</head>
<body>
	<h1>Out Ex</h1>
	<%
		int totalBuffer = out.getBufferSize(); // 총 버퍼
		int remaining = out.getRemaining(); // 남은 버퍼 양
		int useBuffer = totalBuffer - remaining; // 사용한 버퍼 양
	%>
	<h3>현재 페이지의 Buffer 상태</h3>
	출력 Buffer의 전체 크기 : <%=totalBuffer %>byte<p/>
	<!-- 페이지 단에서 page buffer="5kb"설정해줘서 BufferSize가 바뀜 -->
	남은 Buffer의 크기 : <%=remaining %>byte<p/>
	현재 Buffer의 사용량 : <%=useBuffer %>byte<p/>
	
	<%
		out.print("문자열<br>");
		out.print("두번째 문자열<br>");
		out.print("<h2>문자</h2>");
		// println해도 new line이 되지 않음. ""안은 html이어서 \n도 먹히지 않음. <br>해야됨 
	 %>
	</body>
</html>