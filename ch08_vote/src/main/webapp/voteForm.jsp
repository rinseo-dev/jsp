<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vote.*, java.util.*"%>
<jsp:useBean id ="vDao" class="vote.VoteDao"/>
<%
	int num = 0;
	// !가 붙었고 ||으로 연결되어서, 둘 다 거짓일 때만 if가 실해되는 상태
	if(!(request.getParameter("num") == null || request.getParameter("num").equals(""))){
		num = Integer.parseInt(request.getParameter("num"));
	}
	
	//VoteList가 반환형
	VoteList vlist = vDao.getOneVote(num);
	ArrayList<String> vItem = vDao.getItem(num);
	// Item을 ArrayList로 받아왔으므로 값을 뽑으려면 for문으로 돌려야 함.
	
	//num에 해당하는 아이템, 리스트 가져오기
	// getOneVote()메소드로 설문 투표할 질문 가져옴.
	// vDao.getOneVote(num); 이 구문으로 가져옴
	// VoteDao에 설정해놨듯이 order by decs를 해서 가장 최근의 것 하나만 가져오게 됨
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>voteForm</title>
</head>
<body>
	<div>
		<form action="voteFormProc.jsp" method="post">
			<table>
				<tr>
					<th>Q : <%=vlist.getQuestion() %></th>
				<!-- VoteList에 있는 Question()가져옴 -->
				<tr>
					<td>
					<!-- DB에서 num에 해당하는 VoteItem을 가지고 옴. -->
					<%
					// DB에 저장할 때 type이 1이면 체크박스, 0이면 라디오버튼으로 사용하기로 했음. 중복유무
						for(int i=0; i<vItem.size(); i++){
							/*
							DB에서 itemnum을 0번부터 들어가도록 했기 때문에 for문도 0부터 돌림
							아래 if문에서 value에는 i값이 들어가야함
							*/
							String itemList = vItem.get(i);
							if(vlist.getType() == 1){
								// 1은 체크박스
								// value에 i값을 넣어줄건데, 변수이므로 끊어서 넣어줘야함.
								out.print("<input type='checkbox' name='itemnum' value='"+ i +"'>" + itemList);
							}else{
								// 0은 라디오버튼
								out.print("<input type='radio' name='itemnum' value='"+ i +"'>"+itemList);
							}
							out.print("<br>"); //하나 출력하고 엔터
						}
					%>
					</td>
				</tr>
				<tr>
					<td>
						<%
							//투표 마감일이 지나고 나면 버튼을 비활성화 시키기
							if(vlist.getActive() == 1){
							// <input type="submit" value="투표">
								out.print("<input type='submit' value='투표'>");
							}else{
								out.print("투표");
							}
						%>
						
						<input type="button" value="결과"
							   onclick="window.open('voteView.jsp?num=<%=num%>','VoteView','width=500, height=400')">
						<!-- hidden으로 num을 넘겨줘야 뭘 증가시켜야하는지 알 수 있음 -->
						<input type="hidden" name="num" value="<%=num %>">
					</td>
				</tr>
			</table>
			
		
		
		</form>
	</div>
</body>
</html>