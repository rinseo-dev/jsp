<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>04_2_while</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String msg = request.getParameter("msg"); // name="msg"에 입력된 값을 가져옴
		int count = Integer.parseInt(request.getParameter("count"));
		// name="count"에서 넘어온 값을 넣어줌
		// count가 ""에 감싸져서 String형태로 넘어오기 때문에'
		// Integer.parseInt()로 형변환해주면 int형으로 사용 가능함
		
		int num = 0;
		while(count>num){
			out.print(msg+"<br>");
			num++; // 이걸 안해주면 num이 계속 0인상태로 무한반복됨
		}
	%>
</body>
</html>