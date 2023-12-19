<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- post로 넘어와서 encoding안해도 됨 -->
<jsp:useBean id="member" class="ch04.MemberBean"/> <!-- ch04에 MemberBean을 사용 -->
<jsp:setProperty name="member" property="*"/><!-- 모두 가져올때는 property에 '*'해도 됨 -->
<!-- set하면 Property이름에 있는게 호출이 됨. 각각 지정해서 가져올수도 있음 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>06_1.member.jsp</title>
</head>
<body>
	<form method="post" action="memberInsert">
		이름 : <jsp:getProperty name="member" property="name"/>회원님이 작성한 내용입니다. 확인 해주세요.<p/>
		<!-- Bean파일이 여러개가 될 수도 있음 그럴때는 name에 사용할 Bean과 연결해야 함 -->
		아이디 : <jsp:getProperty name="member" property="id"/><p/>
		비밀번호 : <jsp:getProperty name="member" property="pw"/><p/>
		생년월일 : <jsp:getProperty name="member" property="birthday"/><p/>
		이메일 : <jsp:getProperty name="member" property="email"/><p/>
		<input type="submit" value="확인완료">
		<input type="button" value="다시쓰기" onclick="history.back();">
	</form>
</body>
</html>