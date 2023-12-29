<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*" %> <!-- board에 있는 모든걸 가져옴.  -->
<jsp:useBean id ="bDao" class="board.BoardDao" />

<%
//세션에서 이름 얻어오기
	/*시도해봄..
	Board board = bDao.updateBoard(num);
	session.setAttribute("bean",board);
	*/
	
	// read.jsp에서 수정버튼을 클릭했을 때 update.jsp가 실행되는데 수정버튼에서 num값이 넘어옴
	int num = Integer.parseInt(request.getParameter("num"));
	
	Board board = (Board)session.getAttribute("bean");
	//session.setAttribute("bean",board); read에서 이렇게 bean을 통째로 받아옴
	
	String nowPage = request.getParameter("nowPage");
	
%>

<!-- 제목, 내용만 업데이트 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update</title>
</head>
<body>
  <form action="boardUpdate" method="post">
    <table align="center">
      <tr>
        <th colspan="2">수 정 하 기</th>
      </tr>
      <tr>
        <td width="15%">성명</td>
        <td>
        	<!-- 세션에서 얻어온 이름 넣기 -->
        	<%=board.getName() %>
        </td>
      </tr>
      <tr>
      	<!-- 제목, 내용만 update로 수정 -->
        <td>제목</td>
        <td><input name="subject"></td>
      </tr>
      <tr>
        <td>내용</td>
        <td><textarea name="content" rows="10" cols="50"></textarea></td>
      </tr>
      <tr>
        <td>비밀번호</td>
        <td><input type="password" name="pass">수정시 비밀번호가 필요합니다</td>
      </tr>
      <tr>
      	<td colspan="2"><hr></td>
      </tr>
      <tr>
        <td colspan="2" align="center">
          <input type="submit" value="수정완료">&emsp;
          <input type="reset" value="다시쓰기">&emsp;
          <input type="button" value="뒤로" onclick="history.go(-1);">
        </td>
      </tr>
    </table>
    <input type="hidden" name="num" value="<%=num %>">
    <input type="hidden" name="nowPage" value="<%=nowPage %>">
  </form>
</body>
</html>