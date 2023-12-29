<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vote.*,java.util.*" %> <!-- java.util.*로 ArrayList<> import -->
<jsp:useBean id="vDao" class="vote.VoteDao" /> <!-- DB사용 -->
<%
	int num = 0;
	
	// num이 null과 같지않거나, 비어있지않으면 받아온 parameter값을 int형으로 num값을 넣어줌.
	if(!(request.getParameter("num") == null || request.getParameter("num").equals(""))){
		num = Integer.parseInt(request.getParameter("num"));
	}

	int sum = vDao.sumCount(num);
	ArrayList<VoteItem> alist = vDao.getView(num);
	
	VoteList vlist = vDao.getOneVote(num);
	String q = vlist.getQuestion();
	Random r = new Random();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>vote view</title>
<style>
	.outerT{border:1px solid black; border-collapse:collapse;}
	th, td{border:1px solid black;}
</style>
</head>
<body>
	<div align="center">
		<table width="450" class="outerT">
			<tr>
				<th colspan="4">Q: <%=q %></th>
			</tr>
			<tr>
				<td colspan="4">총 투표수 : <%=sum %></td>
			</tr>
			<tr>
				<th width="10%">번호</th>
				<th width="30%">item</th>
				<th>그래프</th>
				<th width="15%">득표수</th>
			</tr>
			<%
				for(int i=0; i<alist.size(); i++){
					VoteItem vItem = alist.get(i);
					String[] item = vItem.getItem();
					int rgb = r.nextInt(255*255*255);
					String rgbHex = Integer.toHexString(rgb); // 16진수로 고치기
					String hRGB = "#" + rgbHex;
					
					int ratio = (int)(Math.ceil(vItem.getCount() / (double)sum * 100));
					/*
					퍼센트 비율을 보려면 전체 득표수를 하나의 득표수에서 나누고 100을 곱함
					int형은 정수/정수만 가능하므로 산술 식에 있는 세가지 숫자 중 하나 이상이 double형이어야 함

					가장 큰 반환형의 형태를 따라가므로 계산식 전체가 double형으로 반환됨
					하지만 int값이 필요하므로 int형으로 형변환 해서 ratio에 넣어줌
					*/
			%>
			<tr>
				<td align="center"><%=i+1 %></td>
				<td><%=item[0] %></td>
				<!-- vitem에서 0번째 item가져오기
					vItem.getItem()[0] 이런 형식을 가지게 됨. 위에 변수 있는거 가져와서 씀
					item[]배열을 하나밖에 만들지 않았으므로 itrm[0]임-->
				<td>
					<table width="<%=ratio%>" height="15"> <!-- 테이블의 길이는 득표 퍼센테이지 만큼 -->
						<tr>
							<td bgcolor="<%=hRGB%>"></td><!-- 랜덤색상 -->
						</tr>
					</table>
				</td>
				<td align="center">
					<%=vItem.getCount() %>
				</td>
			</tr>
			
			<%
				}
			%>
		</table>
		<a href="javascript:window.close();">닫기</a>
	</div>
</body>
</html>
