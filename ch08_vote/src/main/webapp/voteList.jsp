<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,vote.*" %>
<jsp:useBean id="vDao" class="vote.VoteDao"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>voteList</title>
</head>
<body>
	<h2>투표 프로그램</h2>
	<hr>
	
	<b>설문폼</b>
	<jsp:include page="voteForm.jsp" />
	<hr>
	
	<b>설문리스트</b>
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>시작일~종료일</th>
		</tr>
		<%
		// DB에서 data를 가져와서 data개수만큼 for문(?)
		ArrayList<VoteList> alist = vDao.getList();
		
		for(int i=0; i<alist.size(); i++){
			VoteList vlist = alist.get(i);
			// voteList라는 객체가 생성되었고 그 주소들이 vlist라는 변수에 들어가게 됨.??
			int num = vlist.getNum();
			String question = vlist.getQuestion();
			String sdate = vlist.getSdate();
			String edate = vlist.getEdate();
			
			out.print("<tr><td>"+(alist.size()-i) + "</td>");
			out.print(" <td><a href='voteList.jsp?num="+num+"'>"+question+"</a></td>");
			// num이 하나도 안넘어오면 list에서 0을 넘겨줄 것??
			// num값에 0이 들어오면 가장 최신의 값을 보여주게끔.
			out.print(" <td>"+sdate+"~"+edate+"</td></tr>");
		}	
		%>
		<tr>
			<td colspan="3"><a href="voteInsert.jsp"> 설문 작성하기</a></td>
		</tr>
	</table>
</body>
</html>