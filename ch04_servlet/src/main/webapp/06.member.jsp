<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>06.member 회원가입</title>
<script src="script.js" charset="UTF-8"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>

<style>
	*{margin:0 auto;}/*부트스트랩때문에 안먹힘ㅋㅋ*/
</style>
</head>
<body>
	<table class="table">
		<form method="post" name="regForm" action="06_1.member.jsp">
			<tr>
				<th colspan="3">회원가입</th>
			</tr> 
			<tr>
				<td>아이디</td>
				<td><input name="id"></td>
				<td>영문과 숫자로만 5글자 이상</td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type="password" name="pw"></td>
				<td>영문, 숫자, 특수기호 반드시 1개이상씩 포함하여 9글자 이상</td>
			</tr>
			<tr>
				<td>패스워드 확인</td>
				<td><input type="password" name="repw"></td>
				<td>입력한 패스워드와 일치하는지 확인</td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input name="name"></td>
				<td>한글이름</td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input name="birthday"></td>
				<td>예)23/12/19</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="email" name="email"></td>
				<td>예) email@email.com</td>
			</tr>
			<tr>
				<td colspan="3" align="center">
					<!-- inputCheck(); js에서 submit되면 action="06_1.member.jsp"여기로 감 -->
					<input type="button" value="회원가입" onclick="inputCheck();">&emsp;
					<input type="reset" value="초기화">
				</td>
			</tr>
		</form>
	</table>
</body>
</html>