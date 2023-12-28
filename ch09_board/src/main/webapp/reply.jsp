<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*" %> <!-- board패키지에 있는 모든것 -->
<%
	/*
	read에서 답변에 대한 num값을 받아오던 부분이 사라졌으므로 여기서도 지움
	int num = Integer.parseInt(request.getParameter("num"));
	*/
	Board board = (Board)session.getAttribute("bean");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reply</title>
</head>
<body>
  <form action="boardReply" method="post">
    <table align="center">
      <tr>
        <th colspan="2">답 글 등 록</th>
      </tr>
      <tr>
        <td width="15%">성명</td>
        <td><input name="name"></td>
      </tr>
      <tr>
        <td>제목</td>
        <td><input name="subject" value="답변:<%=board.getSubject() %>"></td>
      </tr>
      <tr>
        <td>내용</td>
        <td><textarea name="content" rows="10" cols="50">
        	<%=board.getContent() %>
        	========== 답글을 작성하세요 ==========
        </textarea></td>
      </tr>
      <tr>
        <td>비밀번호</td>
        <td><input type="password" name="pass"></td>
      </tr>
       <tr>
      	<td colspan="2"><hr></td>
      </tr>
      <tr>
        <td colspan="2" align="center">
          <input type="submit" value="답변등록">&emsp;
          <input type="reset" value="다시쓰기">&emsp;
          <input type="button" value="뒤로" onclick="history.back();">
        </td>
      </tr>
    </table>
    <!-- 나의 정보 : 아이피를 넘겨줌 -->
    <input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>">
    
    <!-- 상위 부모들의 정보 : session에서 가져오면 됨-->
    <input type="hidden" name="ref" value="<%=board.getRef() %>">
    <input type="hidden" name="pos" value="<%=board.getPos() %>">
    <input type="hidden" name="depth" value="<%=board.getDepth() %>">
  </form>
</body>
</html>