<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03.fn</title>
</head>
<body>
	<h1>3. JSTL Function Library</h1>
	
	<c:set var="str" value="How are you?" />
	
	str : ${str }<br>
	
	문자열의 길이 : ${str.length() }<br>
	문자열의 길이 : ${fn:length(str) }<br>
	
	모두 대문자로 출력 : ${fn:toUpperCase(str) }<br>
	모두 소문자로 출력 : ${fn:toLowerCase(str) }<br><br>
	
	are의 시작 인덱스 : ${fn:indexOf(str,'are') }<br>
	are => were 변경 : ${fn:replace(str,'are', 'were') }<br>
	<!-- 원본은 바뀌지 않고, 출력때만 are -> were로 바뀐 상태로 출력됨 -->
	str : ${str }<br><br>
	
	str에 are이 포함되어있는지 : 
	<c:if test="${fn:contains(str,'are')}">
		포함되어 있음
	</c:if>
	
</body>
</html>