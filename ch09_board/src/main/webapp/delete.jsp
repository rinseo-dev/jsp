<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*" %>
<jsp:useBean id="bDao" class="board.BoardDao" />
<%
	int num = Integer.parseInt(request.getParameter("num"));
	//Board board = (Board)session.getAttribute("bean");
	
	String nowPage = request.getParameter("nowPage"); // page번호 받음
	
	// int pass = Integer.parseInt(request.getParameter("pass"));
	
	//처음 들어 왔을때는 실행되지 않고 null과 같지 않을때만 실행됨
	if(request.getParameter("pass") != null){
		String inputPass = request.getParameter("pass"); // 사용자가 password에 넣은 값
		Board board = (Board)session.getAttribute("bean"); // DB에서 가져온 값
		String dbPass = board.getPass();
		
		if(inputPass.equals(dbPass)){ // 비밀번호가 맞는지
			boolean result = bDao.deleteBoard(num);
			if(result){
				// response.sendRedirect("list.jsp?nowPage="+nowPage); // nowPage값 씀
				response.sendRedirect("list.jsp?nowPage="+nowPage); // 여기서도 nowPage날림
			}else{
%>
			<script>
				alert("댓글이 있어 삭제할 수 없습니다");
				history.go(-2);
			</script>
<%
			}
		}else{
%>
	<script>
		alert("비밀번호가 맞지않습니다");
		history.back();
	</script>
<%
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete</title>
</head>
<body>
	<form action="delete.jsp" method="post"> <!-- 삭제를 누르면 내 페이지가 리로드됨 -->
		<table align="center">
			<tr>
				<th height="30">사용자의 비밀번호를 입력해주세요</th>
			</tr>
			<tr>
				<td><input type="password" name="pass" required></td>
			</tr>
			<tr>
				<td><hr></td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="삭제완료">
					<input type="reset" value="다시쓰기">
					<input type="button" value="뒤로" onclick="history.back();">
				</td>
			</tr>
		</table>
		<input type="hidden" name="num" value="<%=num %>">
		<input type="hidden" name="nowPage" value="<%=nowPage %>"> <!-- hidden으로 넘겨줌 -->
	</form>
</body>
</html>