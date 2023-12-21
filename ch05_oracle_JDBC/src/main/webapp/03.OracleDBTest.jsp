<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %><!-- sql을 사용할 수 있게 import -->
<!--
	java 7 버전 이전에서는 try-catch-finally로 일일이 해제해주어야 한다
	java 9 버전부터는 try-with-resource로 작성하며, 자원해제를 해주지 않아도 자동 해제됨
-->
<%
	// class안에 서비스 등이 만들어지고 변수가 들어가는데, local변수가 된 상태여서 null값으로 초기화 해야 되는듯
	Connection con = null;
	Statement st = null;
	ResultSet rs = null; // st, rs를 닫으려고..?바깥으로 뽑아냄
	String id, title, location; // 변수 선언. 나중에 아래에서 사용할 수 있게
	try{
		Class.forName("oracle.jdbc.OracleDriver"); // try-catch문 안에 넣어줘야함
		con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","aie","aie");
				
		st = con.createStatement();
		rs = st.executeQuery("select * from department");
%>
			
<!-- connection, driver는 클래스파일과 똑같이 넣어야 함 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03.OracleDBTest</title>
</head>
<body>
	<h1>JSP를 이용한 ORACLE 연동</h1>
	<table border="1">
		<tr>
			<th>부서번호</th>
			<th>부서명</th>
			<th>위치번호</th>
		</tr>
		<%
			if(rs!= null){
				while(rs.next()){
					id = rs.getString(1);
					title = rs.getString(2);
					location = rs.getString(3);
		%>
		<!-- while문의 개수만큼 tr,td가 생기는 것. 첫번째 tr,td생성하고 두번째 돌 때 또 생성 -->
		<tr>
			<td><%=id %></td>
			<td><%=title %></td>
			<td><%=location %></td>
		</tr>
		<%
				}
			}
		
		%>
	</table>

<% // 전체에 적용할 수 있게 body끝날 부분에 넣어줌
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs != null){ // rs가 null일 경우 rs.close를 해주는데, try-catch해줘야함
			try{rs.close();}catch(Exception e){}
		}
		
		if(st != null){
			try{st.close();}catch(Exception e){}
		}
		
		if(con != null){
			try{con.close();}catch(Exception e){}
		}
		// 닫는거 까지가 마무리
	}
%>
</body>
</html>