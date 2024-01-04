<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JSTL이란?</h1>
	<p>
		JSP Standard Tag Library의 약자로 jsp에서 사용되는 커스텀 액션 태그<br>
		공통적으로 자주 사용하는 코드들을 집합으로 보다 쉽게 사용할 수 있도록 태그화해서 표준으로 제공하는 라이브러리<br>
		필요한 라이브러리를 추가한 후 사용가능
	</p>
	
	<h3>* JSTL 선언 방법</h3>
	<p>
		JSTL을 사용하려면 해당 JSP페이지 상단에 taglib지시어를 선언해야 함<br>
		< %@ taglib prefix="접두어" uri="라이브러리 파일상의 uri주소" %>
		
	</p>
	<h4>1. JSTL Core Library</h4>
	<p>변수와 조건문, 반복문 등의 로직과 관련된 문법을 제공</p>
	<a href="01.core.jsp">core library</a>
</body>
</html>