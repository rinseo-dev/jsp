<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="beanTest" class="ch04.BeanTest5"/> <!-- 패키지이름.클래스이름 -->
<jsp:setProperty name="beanTest" property="name" value="자바빈 사용"/>
<!-- property="name"은 String name으로 지정한 변수 name을 가져옴 -->
<!-- useBean에서 설정한 id값을 setProperty에서 name으로 연결함 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	당신의 이름은 : <jsp:getProperty property="name" name="beanTest"/>
	<!-- 실행하면 setProperty value값이 불러와짐 -->
</body>
</html>