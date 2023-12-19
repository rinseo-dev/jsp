<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>07.config</title>
</head>
<body>
	<h1>Config EX</h1>
	<table border="1">
		<tr>
			<th>초기 파라미터 이름</th>
			<th>초기 파라미터 값</th>
		</tr>
		<%
			Enumeration e = config.getInitParameterNames(); //이름으로 하나씩 객체가 생성됨
			while(e.hasMoreElements()){ // true이면 nextElement해서 하나씩 값을 가져옴
				String initParamName = (String)e.nextElement(); // enumer타입을 String으로 변환
			
		%>
		<tr>
			<td><%=initParamName %></td> <!-- 이름에 해당하는 값 출력 -->
			<td><%=config.getInitParameter(initParamName) %></td> <!-- 이름에 해당하는 값 가져오기 -->
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>