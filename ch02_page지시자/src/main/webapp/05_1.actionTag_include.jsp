<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>05_1.actionTag_include</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String siteName = request.getParameter("siteName"); // siteName에 있는 값 가져옴
		String siteTel = request.getParameter("siteTel"); // siteTel값 가져옴
	%>
	<%-- include된 페이지가 먼저 출력되고, 아래에 <%=%>로 입력한 구문 나옴 --%>
	<jsp:include page="05_2.actionTag_include.jsp">
		<jsp:param value="jsp수업" name="siteName"/>
		<jsp:param value="02-1122-3344" name="siteTel"/>
	</jsp:include>
	<%-- < jsp : param value="< % =siteName %>" name="sitename"/>
		<jsp : param value="< % =siteTel %>" name="sitetel"/> --%>
	<%-- parameter로 값을 넘겨주기 위해서 < / jsp:include>로 닫음 --%>

<%-- parameter로 들어가있을 때 사용 가능함. 이런식으로 값 넘겨주기도 가능--%>
	<hr>
	아래가 원래 바디, 위는 include된 내용<p/>
	<!-- siteName="jsp수업" / siteTel="02-1122-3344이렇게 넘어감 -->
	include Action Tag의 Body입니다<p/>
	<%=siteName %><p/>
	<%=siteTel %><p/>
</body>
</html>