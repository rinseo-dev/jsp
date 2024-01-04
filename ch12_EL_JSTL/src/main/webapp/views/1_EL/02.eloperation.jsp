<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>02.eloperation</title>
</head>
<body>
<!-- OperationServlet랑 연결된 상태
<a href="operation.do">로 OperationServlet과 index가 연결됐고
request.getRequestDispatcher("views/1_EL/02.eloperation.jsp")로
02.eloperation.jsp랑 연결
-->
	<h3>1. 산술 연산</h3>
	기존방식 : 10 + 3 = <%=(int)request.getAttribute("big") + (int)request.getAttribute("small") %>
			<!-- parameter로 받은 게 아니라서 (int)만 붙여도 자료형 바뀜 -->
	<br><br>
	
	EL방식 : $&#123;	&#125; <br>
	10 + 3 = ${big } + ${small}<br> <!-- 형변환 알아서 해줌 -->
	10 - 3 = ${big - small }<br>
	10 * 3 = ${big * small }<br>
	10 / 3 = ${big / small } 또는 ${big div small }<br>
	10 % 3 = ${big % small } 또는 ${big mod small }<br>
	
	<h3>2. 대소 비교</h3>
	10 &gt; 3 = ${big > small } 또는 ${big gt small }<br>
	10 &lt; 3 = ${big < small } 또는 ${big lt small }<br>
	10 &gt;= 3 = ${big >= small } 또는 ${big ge small }<br>
	10 &lt;= 3 = ${big <= small } 또는 ${big le small }<br><br>
	
	<h3>3. 동등 비교</h3>
	<!--  el에서는 ==비교는 equals()와 같은 동작 - 값을 비교 -->
	sOne과 sTwo가 일치합니까? ${sOne == sTwo } 또는 ${sOne eq sTwo }<br>
	sOne과 sTwo가 일치하지 않습니까? ${sOne != sTwo } 또는 ${sOne ne sTwo }<br>
	<!-- sOne, sTwo에 담긴 값이 다름-->
	
	big에 담긴 값이 10과 일치합니까? ${big == 10 } 또는 ${big eq 10 }<br>
	
	sThree에 담긴 값이 '안녕'과 일치합니까? ${sThree =='안녕' } 또는 ${sThree eq "안녕" }<br><br>
	<!-- el안에서 문자열 리터럴 값은 홑따옴표나 쌍따옴표를 가리지 않음 -->
	
	<h3>4. 객체가 null인지 아닌지 리스트가 비어있는지 비교</h3>
	pTwo가 null 입니까? ${pTwo == null } 또는 ${pTwo eq null } 또는 ${empty pTwo }<br>
	pOne이 null 입니까? ${pOne == null } 또는 ${pOne eq null } 또는 ${empty pOne}<br>
	pOne이 null 아닙니까? ${pOne != null } 또는 ${pOne ne null } 또는 ${not empty pOne}<br><br>
	
	<!-- ArrayList에 있는 값들에 a붙어있음 - servlet에서 확인 가능 -->	
	aOne이 텅비어있습니까? ${empty aOne }<br>
	sTwo이 텅비어있습니까? ${empty aTwo }<br><br>
	
	<h3>5. 논리연산자</h3>
	true && true : ${true && true } 또는 ${true and true}<br> 
	true && false : ${true && false } 또는 ${true and false}<br><br>
	
	true || true : ${true || true } 또는 ${true or true }<br>
	true || false : ${true || false } 또는 ${true or false }<br><br>
	
	big이 small보다 크고, aOne이 텅 비어있습니까? ${bit gt small and empty aOne }
	<!-- 양쪽이 참일때만 참 -->
	
	
	
	
</body>
</html>