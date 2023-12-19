<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>MBTI로 보는 당신의 성격테스트</h1>
	<form action="07_1.actionTag_forward_MBTI.jsp">
		이름 : <input name="name"><p/>
		MBTI 선택<p/>
		<input type="radio" name="mbti" value="intj">intj<br>
		<input type="radio" name="mbti" value="entj">entj<br>
		<input type="radio" name="mbti" value="isfp">isfp<br>
		<input type="radio" name="mbti" value="esfp">esfp<br>
		<input type="submit">
	</form>
</body>
</html>