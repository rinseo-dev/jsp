<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="vDao" class="vote.VoteDao"/>
<%
	int num = Integer.parseInt(request.getParameter("num"));

	// itemnum이 checkbox일땐 여러개가 넘어오므로 배열로 받음
	String[] itemnum = request.getParameterValues("itemnum");
	
	// 결과값을 boolean으로 받음
	boolean result = vDao.updateCount(num, itemnum);
	String msg = "투표가 등록되지 않았습니다";
	if(result){ // 투표가 잘 등록되었다면
		msg = "투표가 정상적으로 등록되었습니다";
	}
%>
<script type="text/javascript">
	alert("<%=msg %>");
	location.href="voteList.jsp?num=<%=num%>";
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>voteFormProc</title>
</head>
<body>

</body>
</html>