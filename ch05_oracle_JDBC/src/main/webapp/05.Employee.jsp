<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, ch05.*" %>
<jsp:useBean id="regMgr" class="ch05.RegisterMgr5"/>
<!-- Bean은 import해놔서(ch05.*) 나중에 객체생성 해도 됨 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>05.Employee</title>
</head>
<body>
	<h1>Bean을 이용한 ORACLE 연동</h1>
	<table>
		<tr>
			<th>사번</th>
			<th>사원명</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>급여</th>
			<th>입사일</th>
		</tr>
		<%
			ArrayList<EmployeeBean5> alist = regMgr.getEmpList();
			// 반환값이 ArrayList여서 alist에 저장해서 사용
			for(int i=0; i<alist.size();i++){ // ArrayList는 길이를 size로
				/*
				배열을 가져올 때 alist[인덱스번호]를 사용하고
				ArrayList에서 0번쨰 index를 가져 올 때 ArrayList는 리스트명.get(인덱스번호); 사용
				*/
				EmployeeBean5 bean = alist.get(i);
				String hireDate = bean.getHire_date().substring(0,10);
		%>
		<tr>
			<td><%=bean.getEmp_id() %></td>
			<td><%=bean.getEmp_name() %></td>
			<td><%=bean.getEmail() %></td>
			<td><%=bean.getPhone() %></td>
			<td><%=bean.getSalary() %></td>
			<td><%-- <%=bean.getHire_date() %> --%>
				<%=hireDate %></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>