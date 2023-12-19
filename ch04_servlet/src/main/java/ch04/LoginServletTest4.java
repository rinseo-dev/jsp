package ch04;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginServletTest4 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		if(id != null && pw != null) { // DB연동되고 나면 일치하는지도 확인해야 함
			// request.getSession(); session을 request로 부터 얻어옴 이걸변수에 넣음
			HttpSession session = request.getSession(); // import : HttpSession
			session.setAttribute("idKey", id);
			
			/*
			 챗gpt 설명
			 ID와 비밀번호가 null이 아닌 경우, `request.getSession()`을 호출하여
			 현재 요청에 대한 세션을 가져오거나 새로 생성합니다.
			 그리고 `setAttribute` 메서드를 사용하여 세션에 "idKey"라는 이름으로
			 ID를 저장합니다. 이를 통해 서버 측에서 세션을 통해
			 사용자를 식별하거나 상태를 유지할 수 있습니다.
			 
			 */
		}
		response.sendRedirect("04.login.jsp");
	}

}
