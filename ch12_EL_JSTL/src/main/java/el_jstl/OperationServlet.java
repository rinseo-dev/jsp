package el_jstl;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class OperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("big", 10);
		request.setAttribute("small", 3);
		
		request.setAttribute("sOne", "");
		request.setAttribute("sTwo", "");
		request.setAttribute("sThree", "안녕");
		
		request.setAttribute("pOne", new Person("",20,"")); // age에만 값 넣은 상태
		request.setAttribute("pTwo", null);
		
		ArrayList<String> list1 = new ArrayList<String>(); // 텅 빈 리스트. add 한 게 없음
		request.setAttribute("aOne", list1);
		
		ArrayList<String> list2 = new ArrayList<String>();
		list2.add("좋은 아침");
		request.setAttribute("aTwo", list2); // list2에 어떤 값이 담겨있는 상태
		
		request.getRequestDispatcher("views/1_EL/02.eloperation.jsp").forward(request, response);
		// dispatcher를 정의해주고 forward해줘야 그 곳으로 감
	}

}
