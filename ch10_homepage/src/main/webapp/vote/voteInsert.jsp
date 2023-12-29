<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>voteInsert</title>
</head>
<body>
<h2>투표 프로그램</h2>
<p/>
<h3>설문작성</h3>
<p/>
<form method="post" action="voteInsertProc.jsp">
    <table border="1">
      <tr>
        <th>질문</th>
        <td colspan="2">q:<input name="question" size="48"></td>
      </tr>
      <tr>
        <th rowspan="7">항목</th>
        <%
        for(int i=1; i<=4; i++){
        	out.print("<td>"+(i*2-1)+ ":<input name='item'></td>");
        	//첫 td는 홀수로 들어감. i*2는 짝수가 되고 -1로 홀수 만듦
        	out.print("<td>"+(i*2)+ ":<input name='item'></td>");
        	// 이건 짝수번
        	out.print("</tr>");
        	
        	if(i<4){
        		out.print("<tr>");
        	}
        }
        // 아래에서 식을 for문으로 구성 할 수 있음 
        %>
        <!--
        <td>1:<input name="item"></td>
        <td>2:<input name="item"></td>
      </tr>
      <tr>
        <td>3:<input name="item"></td>
        <td>4:<input name="item"></td>
      </tr>
      <tr>
        <td>5:<input name="item"></td>
        <td>6:<input name="item"></td>
      </tr>
      <tr>
        <td>7:<input name="item"></td>
        <td>8:<input name="item"></td>
      </tr> -->
      <tr>
        <td>시작일</td>
        <td>
	        <select name="sdateY">
	        	<option value="2023">2023</option>
	        	<option value="2024">2024</option>
	        </select>년
	        <select name="sdateM">
	        <%
	       		for(int i=1; i<=12; i++){
	       			out.print("<option value='" + i +"'>" + i +"</option>");
	       		} %>
	        </select>월
	        <select name="sdateD">
	        <%
	        	for(int i=1; i<=31; i++){
	        		out.print("<option value='" + i + "'>" + i +"</option>");
	        	} %>
	        </select>일
        </td>
      </tr>
      <tr>
        <td>종료일</td>
        <td>
         <select name="edateY">
        	<option value="2023">2023</option>
        	<option value="2024">2024</option>
        </select>년
        <select name="edateM">
        <%
       		for(int i=1; i<=12; i++){
       			out.print("<option value='"+i+"'>"+i+"</option>");
       		} %>
        </select>월
        <select name="edateD">
        <% for(int i=1; i<=31; i++){
        	out.print("<option value='"+i+"'>"+i+"</option>");
        	} %>
        </select>일
        
        </td>
      </tr>
      <tr>
        <td>이중답변</td>
        <td>
          <input type="radio" name="type" value="1" checked>YES&ensp;
          <input type="radio" name="type" value="0">NO
        </td>
      </tr>
      <tr>
        <td colspan="3" align="center">
          <input type="submit" value="작성하기">
          <input type="reset" value="초기화">
          <input type="button" value="리스트보기"
          		 onclick="location.href='voteList.jsp'">
        </td>
      </tr>
    </table>
  </form>
</body>
</html>