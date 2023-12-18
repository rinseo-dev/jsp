<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03_for for문</title>
</head>
<body>
	<!-- 1~10 합계 -->
	<%
		int sum = 0;
		for(int i=1; i<=10; i++){
			sum += i;
		}
	%>
	for문: [<%=sum %>] 단순 합계 구함<br><br>
	
	[1+2+3+4+5+6+7+8+9+10=55] 로 출력 방법<br>
	<%
		int sum2 = 0;
		for(int i=1; i<=10; i++){
			if(i<10){ // if시작
			//if문은 윗단에서 시작되고 맨 아랫단에서 중괄호로 닫힌 상태
	%> 
		<%=i%>+<%--<%=(i+"+") %> 이렇게 해도 됨 --%>
	<%-- <% %>구문 사이를 끊어주면 끊긴 곳은 html이 적용됨 
		그래서 <%=i %>는 프로그램이고 뒤에 붙은 '+'는 html로 인식됨--%>
	<% 
		}else{
		// else를 넣기 위해서 중간에 한번 더 끊어줌
	%>
		<%=i%>=<%-- else조건일 때 i값 + '='출력 --%>
	<%
			} // if 끝
			sum2 += i;
		}
	%>
	<%=sum2 %> => 1~10까지 합
	<br><br>
	더 간단하게 뽑아내는 방법<br>
	<%
		int sum3 = 0; // sum = 0으로 덮어쓰기 해도 됨.
	for(int i=1; i<=10; i++){
		if(i<10){
			out.print(i+"+");
			// html값과 같이 출력을 하기 위해 프로그램을 끊어야 할 때 유용함
			// 단, 안되는 경우가 있음. <tr><td>를 넣을 때 라던가..
			//out.print("<tr><td>어떤 글씨</td></tr>");이런 형태가 문제가 되는듯
		}else{
			out.print(i+"=");
		}
		sum3+=i;
	}
	%>
	<%=sum3 %>
	
</body>
</html>