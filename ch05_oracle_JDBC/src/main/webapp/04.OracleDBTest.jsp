<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	Connection con = null;
	Statement st = null;
	ResultSet rs = null;
	// String id, name, email, phone;
	String emp_id, emp_name, email, phone;
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","aie","aie");
		
		st = con.createStatement();
		// rs = st.executeQuery("select * from employee"); 필요한 값만 가져와서 출력하는 방법으로 변경
		rs = st.executeQuery("select emp_id, emp_name, email, phone from employee");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>04.OracleDBTest</title>
</head>
<body>
<!-- employee 테이블에서 모든 사원의 emp_id, emp_name, email, phone을 검색하여
테이블로 보여주기
레코드(행)가 몇개 인지 출력하기 -->
<table border="1">
	<tr>
		<th>사원번호</th>
		<th>이름</th>
		<th>이메일</th>
		<th>전화번호</th>
	</tr>
	<%
		if(rs!=null){
			while(rs.next()){
				/* id = rs.getString(1); 이렇게 하면 전체 테이블에서 행별로 가져오기
				name = rs.getString(2);
				email = rs.getString(4);
				phone = rs.getString(5); */
				emp_id = rs.getString(1);
				emp_name = rs.getString(2);
				email = rs.getString(3);
				phone = rs.getString(4);
	%>
		<tr>
			<%-- <td><%=id %></td>
			<td><%=name %></td>
			<td><%=email %></td>
			<td><%=phone %></td> --%>
			<td><%=emp_id %></td>
			<td><%=emp_name %></td>
			<td><%=email %></td>
			<td><%=phone %></td>
		</tr>
	<%
			}
		}
	
	%>

</table>

<%
	}catch(Exception e){
		
	}
%>
</body>
</html>