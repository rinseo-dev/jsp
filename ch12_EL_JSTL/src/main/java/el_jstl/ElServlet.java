package el_jstl;

import java.io.IOException;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class ElServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
										// 받아온 값 , 넘겨줄 값
	/*
	 데이터들을 담을 수 있는 jsp내장객체의 종류
	 1. ServletContext(application scope)
	 	-> 한 애플리케이션당 단 1개만 존재하는 객체
	 	   이 영역에 데이터를 담으면 애플리케이션 전역에서 사용가능
	 	   공유 범위가 가장 큼(jsp/servlet/java)
	 	   
	 2. HttpSession(session Scope)
	 	-> 한 브라우저당 1개 존재하는 객체
	 	   이 영역에 데이터를 담으면 jsp/servlet 단에서 사용가능
	 	   공유범위가 2번째로 큼
	 	   
	 3. HttpServletRequest(request Scope)
	 	-> 요청 때마다 매번 생성되는 객체
	 	   이 영역에 데이터를 담으면 해당 request객체를 포워딩 받는 응답  jsp(+servlet)에서만 사용 가능
	 	   공유범위가 응답 jsp(+servlet)에서만 사용 가능
	 	   
	 	   **응답 받는 쪽에서 request.xx으로 하면 그때 종료가 됨
	 	   
	 4. PageContext(page Scope)
	 	-> jsp(+servlet)마다 존재하는 객체
	 	   공유 범위가 가장 작음(해당 페이지)
	 
	 ** jsp에서만 받는 게 아니라, servlet에서도 받을 수 있음.
	 
	 위의 4개의 객체들에
	 데이터를 담을 때 : .setAttribute("키",담고자하는데이터)
	 데이터를 꺼내올 때 : .getAttribute("키") => 데이터가 출력
	 데이터를 삭제할 때 : .removeAttribute("키")
	 */

		
		// requestScope에 담기
		request.setAttribute("classRoom", "3강의장");
		request.setAttribute("student", new Person("김예감",23,"과자"));
		// Person.java에 담음 / 그래서 필드와 담을 값을 맞춤
		
		//sessionScope에 담기 - HttpSession해서 담음
		HttpSession session = request.getSession(); // import필요
		session.setAttribute("academy", "AddInEdu");
		session.setAttribute("teacher", new Person("김지원",35,"여자"));
				// 키는 teacher, new Person()을 객체로 담아서 보냄
		
		/* 입력한 값들이 key가 다 다른 상태.
		같은 scope안에 같은 키값을 갖고 있다면 덮어쓰기가 됨
		단, scope가 다르면 동일한 이름을 가지고 있을 수 있음*/
		
		// requestScope, sessionScope에 동일한 키값으로 데이터 담기
		request.setAttribute("scope", "request");
		session.setAttribute("scope", "session");
		// scope가 다르면 동일한 이름도 각각 담을 수 있음
		
		// application에 담기
		ServletContext application = request.getServletContext();
		application.setAttribute("scope", "application");
		
		// request, session, application에 같은 이름인 scope로 다 다른 값을 넣은 상태
		
		// 응답페지이를 지정하여 거기에 포워딩 되도록 설정
		request.getRequestDispatcher("views/1_EL/01.el.jsp").forward(request, response);
		/* 어디로 갈지 url지정 webapp하위만 작성 - request, response를 가지고 경로 감
		 이렇게 작성하면 mapping을 하지 않아도 됨. */
		
	}

}
