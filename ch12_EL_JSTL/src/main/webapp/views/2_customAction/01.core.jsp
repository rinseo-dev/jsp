<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, el_jstl.*" %>
<!-- java.util에 있는 ArrayList를 사용하기 위해 java.util.*넣어주고
	el_jstl패키지에 있는 Person을 사용하기 위해 el_jstl.*넣어줌 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl-core</title>
</head>
<body>
	<h1>JSTL Core Library</h1>
	<h3>1. 변수(속성 == attribute)</h3>
	<pre>
		* 변수 선언과 동시에 초기화(c:set var="" value="")
		- 변수 선언하고 초기값을 대입해주는 기능을 제공
		- 해당 변수를 어떤 scope에 담을 것인지 지정가능(생략시 기본적으로 pageScope에 담김)
		=> 즉, 해당 scope에 setAttribute를 통해 key-value형태로 데이터를 담아놓는 것과 같음
		=> c:set으로 선언된 변수는 EL로 접근하여 사용해야 함(스크립팅 원소로는 접근 불가 %%)
	</pre>
	
	<c:set var="num1" value="20"/> <!-- pageContext.setAttribute("num","20"); -->
	<c:set var="num2" value="10" scope="request"/><!-- request.setAttribute("num2","20"); -->
	
	num1 변수값 : ${num1 }<br>
	num2 변수값 : ${num2 }<br>
	<!-- **이렇게는 접근 불가능< %=num %>  -->
	
	<%-- <c :set var="result" value="num1+num2" scope="session" /> 이렇게 넣으면 String값임 --%>
	<!-- 변수를 호출한게 아니라 num1+num2라는 문자열을 말하는 것.  -->
	
	<c:set var="result" value="${num1+num2 }" scope="session" />
	<!-- result라는 값에 ${num1+num2 }가 sessionScope로 입력된..? -->
	result : ${result }<br>
	
	pageScope.num1 : ${pageScope.num1 }<br>
	requestScope.num2 : ${requestScope.num2 }<br>
	sessionScope.result : ${sessionScope.result }<br>
	requestScope.result (존재하지않음) : ${requestScope.result }<br><br> <!-- 이건 존재하지 않으므로 빈칸. -->
	
	<!-- value속성 대신 시작태그와 종료태그 사이에 초기값을 넣을 수 있음 -->
	<c:set var="result" scope="request">
		777
	</c:set>
	
	requestScope.result : ${requestScope.result }
	
	<hr>
	
	<pre>
		*변수 삭제 (c:remove var="제거하고자 하는 변수명" [scope=""])
		- 해당 scope 영역에서 해당 변수를 찾아서 제거하는 태그
		- scope 지정 생략시 모든 scope에서 해당 변수를 모두 찾아서 제거함
		=> 즉 해당 scope에.removeAttribute를 통해 제거하는 것과 같다
	</pre>
	
	<!-- 여기까지는 requestScope에 result값 777이 존재했음 -->
	삭제전 result : ${result }<br><br>
	
	
	1) 특정 scope 지정해서 삭제<br>
	<c:remove var="result" scope="request" />
	
	<!-- requestScope에 있던 result값을 삭제해서 sessionScope단위에 있는 result값이 불러와짐  -->
	requestScope의 result(request) 삭제 후 : ${result }<br><br>
	
	2) 모든 scope에서 삭제<br>
	<c:remove var="result" />
	모두 삭제 후 result : ${result }<br><br>
	<!-- page,request,session,application 모든 영역에 있는 result를 삭제한 후라서 아무것도 안뜸 -->
	
	<hr>
	
	<pre>
		* 변수의 데이터 출력(c:out value="출력하고자 하는 값" [default="기본값"][escapeXml="true|false"])
		  데이터를 출력하고자할 때 사용하는 태그
		  
		**escapeXml은 기본값이 true / false를 넣으면 
	</pre>
	
	$ {result } : <c:out value="${result }" /><br>
	$ {result } default="없음" : <c:out value="${result }" default="없음" /><br><br>
	
	<c:set var="outTest" value="<b>출력테스트</b>" />
	
	<c:out value="${outTest }" /><br> <!-- escapeXml은 기본값이 true == 태그해석X(문자열로 취급) -->
	<c:out value="${outTest }" escapeXml="false" /><br> <!-- escapeXml="false"는 태그해석O -->
	
	<hr>
	<h3>2.조건문 - if(c:if test="조건식")</h3>
	<pre>
		- JAVA의 if문과 비슷한 역할을 하는 태그
		- 조건식은 test속성에 작성(단, EL구문으로 작성)
	</pre>
	
	<!-- ${num1 gt num2 }이 참이면 구문 수행 -->
	num1 gt num2 :
	<c:if test="${num1 gt num2 }">
		<b>num1이 num2보다 크다</b>
	</c:if>
	<br>
	
	<!-- 거짓인 경우는 출력이 되지 않음 -->
	num1 le num2 : 
	<c:if test="${num1 le num2 }">
		<b>num1 이 num2보다 작거나 같다</b>
	</c:if>
	
	<br>
	<c:set var="str" value="안녕" />
	<c:if test="${str eq '안녕' }">
		<h4>Hello JSP</h4>
	</c:if>
	
	<c:if test="${str ne '안녕' }">
		<h4>Bye JSP</h4>
	</c:if>
	
	<!-- 이런 기본 구조와 다름< %if(){}else{}% > -->
	
	<h3>3. Choose - (c:choose, c:when, c:otherwise )</h3>
	<pre>
		- JAVA의 if-else, if-else if문과 비슷한 역할을 하는 태그
		- 각 조건들을 c:choose의 하위요소로 c:when(if, else if의 역할)을 통해 작성 c:otherwise(else)의 역할
	
	if{}		=> when
	else if{}	=> when (else if도 if처럼 씀)
	else{}		=> otherwise
	
	</pre>
	
	<c:choose>
		<c:when test="${num1 ge 30 }">
			<b>num1은 30보다 큰 수</b>
		</c:when>
		<c:when test="${num1 ge 20 }">
			<b>num1은 20보다 크거나 같은 수</b>
		</c:when>
		<c:otherwise>
			<b>num1은 20보다 작은 수</b>	
		</c:otherwise>
	</c:choose>
	<!-- 이런 느낌
	< % if(20>30){
	}else if(20>=20){
	}else{
	% >
	 -->
	 
	 <h3>4. 반복문 - (forEach)</h3>
	 <pre>
	 	for loop문 - (c:forEach var="변수명" begin="초기값" end="끝값" [step="반복시증가값"])
	 		** step 생략시 1씩 증가
	 	
	 	향상된 for문 - (c:forEach var="변수명" items="순차적으로 접근하고자 하는 객체(배열|컬렉션)"
	 							[varStatus="현재 접근 된 요소의 상태값을 보관할 변수명"])
	 	var속성으로 선언된 변수에 접근하고자 할 때는 반드시 EL구문으로 접근
	 </pre>
	 <!-- 이런 스크립트릿 구문으로는 안됨 
	 < %
	 	for(var i=1; i<10; i+=2) // 이 for문에는 i값을 출력할 수 있음
	 	for(Person p : list) // list라는 리스트에 있는 값을 하나씩 꺼내서 도는거
	 % > -->
	 
	 forEach var="i" begin="1" end="10" step="2"
	 <c:forEach var="i" begin="1" end="10" step="2">
	 	반복확인 : ${i }<br>	
	 </c:forEach>
	 <br><br>
	 
	 &lt;\${i}&gt;태그안에서도 적용가능&lt;/\${i}&gt;
	 <!-- step을 안써서 1씩 증가  -->
	 <c:forEach var="i" begin="1" end="6">
	 	<h${i}>태그안에서도 적용가능</h${i}>
	 </c:forEach>
	 <!--
	 	<h1>어쩌구</h1>
	 	<h2>어쩌구</h2>
	 	<h3>어쩌구</h3>
	  -->
	<br><br>
	
	<c:set var="colors">
		red, orange, green, hotpink
	</c:set>
	
	color 변수값 : ${colors }<br>
	
	<ul>
		<c:forEach var="c" items="${colors }">
			<li style="color:${c}">${c }</li>
		</c:forEach>
	</ul>
	
	<!-- 상위에 import해놓음. 설명도 같이 %@ page import="java.util.*, el_jstl.*" % -->
	<%
		ArrayList<Person> list = new ArrayList<Person>();
		list.add(new Person("유재석",43,"남자"));
		list.add(new Person("전준우",8,"남자"));
		list.add(new Person("에스파",4,"여자"));
	%>
	
	<!-- var변수 value값 형태..? / pList에 list값 가져옴 -->
	<c:set var="pList" value="<%=list %>" scope="request" />
	<table border="1">
		<thead>
			<tr>
				<th>이름</th>
				<th>나이</th>
				<th>성별</th>
			</tr>
		</thead>
		<!-- pList를 for나 if로 돌려서 tbody에 출력
		먼저 pList가 비어있는지 확인하고, 값이 있으면 for문으로 출력시키기
		현재 pList에는 3개 값이 있는 상황 -->
		<tbody>
		<!-- if만 있을때는 if만 쓰지만, else가 필요한 경우 choose로 감쌈
			if->when, else->otherwise
			items="순차적으로 접근하고자 하는 객체(배열|컬렉션)"
			-->
		<!-- ArrayList에 있는 p를 하나씩 꺼내옴
			getterMethod를 쓰지 않고 필드 이름만 써줘도 사용가능.
			알아서 처리해준다고 ㅇㅇ  -->
		<c:choose>
			<c:when test="${empty pList }">
				<tr>
					<td colspan="3">조회된 사람이 없습니다</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="p" items="${pList }">
					<tr>
						<td>${p.name }</td>
						<td>${p.age }</td>
						<td>${p.gender }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
			<!-- < %
				if(pList.isEmpty()){
					
				}else{
					for(Person p :pList){
				}
			% > -->
		</tbody>
	</table>
	<br><br><br>
	<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>나이</th>
				<th>성별</th>
			</tr>
		</thead>
		<tbody>
		<!-- [varStatus="현재 접근 된 요소의 상태값을 보관할 변수명"]
			 번호는 list에 존재하지 않는 값.
		-->
		<c:choose>
			<c:when test="${empty pList }">
				<tr>
					<td colspan="3">조회된 사람이 없습니다</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="p" items="${pList }" varStatus="status">
					<tr>
					<!-- varStatus속성은 2가지
						> index : 0부터 시작
						> count : 1부터 시작 
						  **향상된 for문 일때만 가능 -->
						<td>${status.count }</td>
						<td>${p.name }</td>
						<td>${p.age }</td>
						<td>${p.gender }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</tbody>
	</table>
	<br>
	
	<h3>5. 반복문 - (forTokens)</h3>
	<pre>
		- 구분자를 통해 분리된 각각의 문자열에 순차적으로 접근하여 반복을 수행
		  (c:forTokens var="번수명" items="분리시키고자 하는 문자열" delims="구분자")
		- JAVA의 split("구분자") 비슷한 기능
	</pre>
	
	<!-- set으로 변수 만들었음. value에 ','만 구분돼있어야 순수 배열로 볼 수 있는데
		 굳이 나누자면 4개 배열이 되고, 지금은 split로 나누어서 사용할 값으로 봄 ㄴ-->
	<c:set var="device" value="컴퓨터,핸드폰,TV,에어컨/냉장고.세탁기" />
	
	<!-- delims=",./"구분자 ,./로 value값을 나눔. 모든 단어가 하나씩 떨어지는 결과값  -->
	<ol>
		<c:forTokens var="d" items="${device }" delims=",./">
			<li>${d}</li>
		</c:forTokens>
	</ol>
	
	<hr>
	<h3>6. url, 쿼리 스트링 - url, param</h3>
	<pre>
		- url경로를 생성하고, 쿼리스트링을 정의해 둘 수 있는 태그<br>
		  (c:url var="변수명" value="요청할 url")
		  	(c:param name="키" value="전달할 값" /) << 이건 여러줄 추가 가능.
		  (/c:url)
	</pre>
	<a href="list.jsp?num=2&nowPage=3">기존방식</a><br>
	<!-- 파일이 없으므로 기존방식, c:url방식 클릭해도 404뜸 -->
	<c:url var="bo" value="list.do">
		<c:param name="num" value="2" />
		<c:param name="nowPage" value="3"/>
	</c:url>
	<!-- name키 value값 형태로 넣음
		 'bo'로 가게끔 되어 있고, list.do를 타고 가게 됨
		 list.do로 가는 파일은 만들어놓은게 없으므로 당연히 404에러가 나지만,
		 주소창에 있는 get방식의 주소넘기기를 봐야함. -->
	<a href="${bo }">c:url을 이용한 방식</a>
	<!--
		기존방식 : views/2_customAction/list.jsp?num=2&nowPage=3
		c:url방식 : views/2_customAction/list.do?num=2&nowPage=3
		둘 다 주소를 num, noPage로 받아올 수 있음. 그걸 보려고 만듦
	-->
	
</body>
</html>