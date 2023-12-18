<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>02_2_if If문 처리</title>

<%
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		// request로 넘어온 것 중에 name="name"에 input에 입력된 값(value)을 받아서 String name에 저장
		String color = request.getParameter("color");
		// request로 넘어온 name="color"에서 사용자가 선택한 value값이 넘어옴.
				
		String msg = "";
		
		/*
		switch(color){ // color값이 case값이면 case 실행문 실행
		case "blue":
			msg = "파란색";
			break;
		case "red":
			msg = "빨간색";
			break;
		case "orange":
			msg = "주황색";
			break;
		default:
			msg = "기타";
			break;
		}
		*/
		
		// 조건문
		if(color.equals("blue")){ // equals로 문자를 비교
			msg="파란색";
		}else if(color.equals("red")){
			msg="빨간색";
		}else if(color.equals("orange")){
			 msg="주황색";
		}else{
			msg="기타";
			color = "green"; // 기타에 색상 임의로 지정해줌
		}
	%>

</head>
<body bgcolor = "<%=color%>">
<!-- body에 bgcolor를 적용시키려면 color를 불러오는 구문이 먼저 와야 함 그래서 프로그램 구문을 head로 옮김.
	이제 실행하면 위에서부터 실행되므로 color값을 받아서 body에 넣을 수 있음-->
	
	
	<%=name %>님 반갑습니다.<br>
	<%-- 당신이 선택한 색상은 <%=color %>입니다.--%>
	당신이 선택한 색상은 <%=msg %>입니다.<br>
	<!-- name=홍길동, color=orange를 선택했을 때 get방식으로 넘겨주면
	ch01_scriptlet/02_2_if.jsp?name=홍길동&color=orange 이렇게 넘어옴
	action에 넣은 파일이름?name=name에넣은값&color=사용자가선택한color값 형태임.
	-->
</body>
</html>