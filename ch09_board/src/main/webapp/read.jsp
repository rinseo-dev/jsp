<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*" %>
<jsp:useBean id="bDao" class="board.BoardDao" />
<%
	int num = 17; // 명시적으로 1번 넣어두고 list.jsp 수정 후 바꿀 것
	bDao.upCount(num); // 글 읽기를 했을 때 조회수를 증가시켜줄 것
	
	// DB에서 검색해서 num을 가져옴 / num을 넘겨줘야 가져올 수 있음
	Board board = bDao.getBoard(num); // Board Bean에 담아서 넘겨줄것 
	
	// session에 board를 넣어주면 여러번 로그인을 해야 하지 않음.
	// BoardDao에서 보면 board에 비밀번호까지 모두  들어가있음
	session.setAttribute("bean",board); // board를 실행한 결과를 session에 넣음 bean이라는 이름으로 사용
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>read</title>
</head>
<body>
	<table align="center">
		<tr>
			<th colspan="4">글 읽 기</th>
		</tr>
		<tr>
			<td width="15%">성명</td>
			<td><%=board.getName() %></td>
			<td>등록 날짜</td>
			<td><%=board.getRegdate() %></td>
		</tr>
		<tr>
			<td>제목</td>
			<td colspan="3"><%=board.getSubject() %></td>
		</tr>
		<tr>
			<td colspan="4"><br><pre><%=board.getContent() %></pre><br></td>
		</tr>
		<tr>
			<td colspan="4" align="right"><%=board.getIp() %>로 부터 글을 남기셨습니다 / 조회수<%=board.getCount() %></td>
		</tr>
		<tr>
			<td colspan="4" align="center">
			<hr>
			[
			<a href="list.jsp">리스트</a>|
			<a href="update.jsp?num=<%=num%>">수  정</a>| <!-- update에 num을 넘겨줌 -->
			<%-- <a href="reply.jsp?num=<%=num%>">답  변</a>| 답변 수정하면서 여기서 num빼줌--%>
			<a href="reply.jsp">답  변</a>|
			<a href="delete.jsp?num=<%=num%>">삭  제</a>|
			]
			</td>
		</tr>
	</table>
</body>
</html>