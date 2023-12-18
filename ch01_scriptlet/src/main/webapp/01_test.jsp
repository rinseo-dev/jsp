<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>01_test</title>
</head>
<body>
	
	<!-- 바깥은 html이므로 이 주석 -->
	<!-- < % %> 안쪽은 프로그래밍 주석인 // /**/ 사용 -->
	<%--
		jsp용 주석 html, 프로그래밍 둘 다 사용 가능
		한 줄에 html과 프로그램이 섞여 있을 경우 사용하면 편함
	--%>

	HTML:나의 이름은 홍길동 입니다<br> <!-- 여기는 html로 compile -->
	<!-- < % % > 이 사이에 들어가는 것은 compile이 됨. java문법 사용 -->
	
	<%
		String name = "홍길동";
		int age = 25;
		
		// 메소드 정의 불가
		//String me2(){
		//	return "여기서는 메소드 정의 안됨 오류";
		//}
	%>
	<!-- String은 문자열이니까 ""사용함 -->
	JSP:나의 이름은 <%=name %>입니다(String name = "홍길동")<br>
	JSP:나의 나이는 <%=age %>입니다(int age ="25")<br>
	JSP:내가 쓴 글씨 <%=str %>(String str ="글씨")<br>
	
	<%! 
		// 메소드를 정의할 때는 < %! % >느낌표가 있는 곳에서 해야 함.
		String str = "글씨";
		int me(){
			return 12;
		}
		int me2(int a, int b){
			return a+b;
		}
	%>
	<!-- < %! % >이렇게 느낌표를 붙이면 가장 먼저 불러와져서  < %=str % >보다 뒤에 있지만 값 가져오기 가능 -->
	<!-- 인스턴스변수 생성자처럼 제일 먼저 불러오기 된다고..? -->
	
	메소드 : <%=me() %> -> (int me(){ return 12;}로 값 가져옴<br>
	메소드 : <%=me2(3,5) %> ->int me2(int a, int b){ return a+b;}<br>
	
	< % : Scriptlet<br>
	< %! : Declaration
</body>
</html>

