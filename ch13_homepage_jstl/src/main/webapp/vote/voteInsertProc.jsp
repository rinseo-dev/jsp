<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="vDao" class="vote.VoteDao"/>
<jsp:useBean id="vlist" class="vote.VoteList"/>
<jsp:setProperty name = "vlist" property="*" />
<jsp:useBean id="vitem" class="vote.VoteItem"/>
<jsp:setProperty name="vitem" property="*"/>
<%
	// dates,s voteList테이블에 저장됨
	// 따로 받은 년,월,일 데이터를 sdate, edate에 String 형으로 담아서 setSdate, setEdate에 담음 
	String sdate = request.getParameter("sdateY")+"-"
				 + request.getParameter("sdateM")+"-"
				 + request.getParameter("sdateD");

	String edate = request.getParameter("edateY")+"-"
				 + request.getParameter("edateM")+"-"
				 + request.getParameter("edateD");
	vlist.setSdate(sdate); // String date, edate가 매개변수로 들어가서 set으로 넘어가게 됨
	vlist.setEdate(edate);
	
	// voteInsert()에 vlist, vitem을 매변수로 하는 값을 result에 넣어줌
	boolean result = vDao.voteInsert(vlist,vitem);
	// voteInsert()결과가 result에 들어가고, result결과가 잘 되었으면 T, 아니면 F
	
	String msg = "설문 추가에 실패하였습니다";
	String url = "voteInsert.jsp";
	if(result){
		msg = "설문이 추가 되었습니다";
		url = "voteList.jsp";
	}
%>
<script>
	alert("<%=msg %>");
	location.href="<%=url %>";
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VoteInsertProc</title>
</head>
<body>

</body>
</html>