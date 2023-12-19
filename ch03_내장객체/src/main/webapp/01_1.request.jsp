<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	// 사용자 입력 값을 request.getParameter로 받음
	String sNum = request.getParameter("studentNum");
	String gen = request.getParameter("gender");
	String major = request.getParameter("major");
	String[] hobby = request.getParameterValues("hobby");
	// hobby는 여러가지를 가져올 수 있으므로 배열로 받음
	// 배열을 받을 때는 Values로 받게 됨
	// 배열은 그냥 출력하면 toString이 들어있어서 객체의 주소가 출력됨
	
	//String gender ="";
	if(gen.equals("M")){
		// gender = "남자";
		gen = "남자";
	}else{
		// gender = "여자";
		gen = "여자";
	}
	// gender로 하면 아래 출력문에서도 gen->gender로 수정해줘야 함
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>01_1.request</title>
</head>
<body>
	이름 : <%=name %><p/>
	학번 : <%=sNum %><p/>
	성별 : <%=gen %><p/>
	학과 : <%=major %><p/>
	취미 : 
	<%
		for(int i=0; i<hobby.length; i++){
			// index번호 0부터 hobby의 길이만큼 돌리기
			out.print(hobby[i]+", "); // index i번에 해당하는 내용 출력
		}
	%>
	입니다. <!-- < %% >바깥은 html이므로 그냥 적어줘도 됨 -->
</body>
</html>