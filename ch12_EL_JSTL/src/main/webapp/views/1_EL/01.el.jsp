<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="el_jstl.Person" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>01.el</title>
</head>
<body>
	<h3>1. 기존 방식대로 스트립트릿과 표현식을 이용하여 각 scope에 담겨있는 값을 화면에 출력</h3>
	
	<%
		String classRoom = (String)request.getAttribute("classRoom");
	// 문자열로 출력하려고 String classRoom을 만들었는데, request로 받아오면 Object객체 타입이라 형변환
	
	/*
		<form>
			<input name="id">
		</form>
		파라미터 => id="사용자가 입력한 값"
		파라미터로 넘겼을 때는 키:값 으로 받는게 아니라 String으로 받음
	*/
		
		Person Student = (Person)request.getAttribute("student");
		/* Student는 Person타입임.
		request.setAttribute("student", new Person("김예감",23,"남자")); 이므로 Person타입
		하지만 request는 Oject타입이라 오류 발생. Pserson타입으로 형변환*/
		
		// session scope 값 얻어오기
		String academy = (String)session.getAttribute("academy");
		//값을 문자열에 넣었으므로 String형 / 뒤는 Object타입이라 형변환
		
		Person teacher = (Person)session.getAttribute("teacher");
		// Person형 / 뒤는 Object형이라 형변환
	%>
	<p>
		학원명 : <%=academy %><br>
		강의장 : <%=classRoom %><br>
		강사 : <%=teacher.getName() %>, <%=teacher.getAge() %>, <%=teacher.getGender() %><br><br>
		<!-- toString에 Overing해놔서 teacher를 출력하면 toString이 출력됨 -->
		
		수강생정보
		<ul>
			<li>이름: <%=Student.getName() %></li>
			<li>나이: <%=Student.getAge() %></li>
			<li>성별: <%=Student.getGender() %></li>
		</ul>
		<!-- Servlet을 들리지 않으면 데이터가 옮겨가지 못하므로
			index를 타고 오지않고 01.el.jsp를 열려고 하면 500오류 -->
	</p>
	
	<h3>2. EL을 이용하여 보다 쉽게 scope의 값을 출력하기</h3>
	<p>
		EL을 이용하여 getxxx를 통해 값을 가져올 필요 없이
		EL구문내의 키값만 제시하면 바로 접근 가능<br>
		기본적으로 EL은 JSP냊아객체를 구분하지 않고
		자동으로 모든 내장객체의 키값을 검색하여 존재하는 경우 그 값을 가져옴
	</p>
	<p>
	<!-- 가장 작은 scope부터 키값을 찾아서 비교 후 값을 가져옴.
		pageContext -> reuqestContext -> sessionScope -> application 순서로 확인
		그 중에 키값이 있는 scope에서 값을 가져옴
		
		필드는 private이므로, 내부적으로 getterMathod를 호출해서 사용하는 것과 같음
		-->
		학원명 : ${academy }<br>
		강의장 : ${classRoom }<br>
		강사 : ${teacher.name }, ${teacher.age }, ${teacher.gender }<br><br>	
		<!-- 필드명만 써주면 필드에 해당하는 getter method()를 가져와서 출력해줌 -->
	</p>

	
		수강생정보
		<ul><!-- 
			<li>이름: ${student.getName() }</li>
			<li>나이: ${student.getAge() }</li>
			<li>성별: ${student.getGender() }</li>
			 -->
			<li>이름: ${student.name }</li>
			<li>나이: ${student.age }</li>
			<li>성별: ${student.gender }</li>
		</ul>
	
	<h3>3. scope의 키값이 동일한 경우</h3>
	scope값 : ${scope }<br>
	<!--
		EL은 공유 범위가 제일 작은 scope부터 해당 키값을 검색함
		page -> request -> session -> application

		**pageContext엔 없고 request엔 있으므로 request값이 나옴.
		
		 만약 모든 영역에 키 값이 없을 경우 => 아무것도 출력안됨(오류도 안남)
	-->
	test값 : ${test }
	<!-- test라는 값은 없으므로 아무것도 출력되지 않음 -->
	
	<h3>4. 직접 scope를 지정하여 접근하기</h3>
	<%
		// pagescope에 담기
		pageContext.setAttribute("scope", "page");
	%>
	<!-- 위에서는 pageContext에 scope가 정의되지 않은 상태여서  request에 들어간 값이 나오고
		바로 뒤에서 pageContext에 "scope"에 page라는 값을 담았으므로
		아래에서 scope를 출력할 때는 page가 출력됨 -->
	pageScope값 : ${scope } 또는  ${pageScope.scope }<br>
	requestScope값 : ${requestScope.scope }<br>
	sessionScope값 : ${sessionScope.scope }<br>
	applicationScope값 : ${applicationScope.scope }<br><br>
	<!-- pageScope, requestScope등 카멜표기법을 지켜야됨 -->
	
	잘못된 접근 예시)<br>
	session의 classRoom키를 찾았을 때 : ${sessionScope.classRoom }
	<!-- 값을 잘못 찾으면 빈칸 / session에는 classRoom이 없음 -->
</body>
</html>