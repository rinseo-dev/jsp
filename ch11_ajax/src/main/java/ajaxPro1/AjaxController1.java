package ajaxPro1;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AjaxController1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String str = request.getParameter("input");
		// input에서 가져온 값을 str에 넣어서 사용.
		
		/*
		PrintWriter out = response.getWriter();
		out.print("<html>");
		 위 두 줄을 아래 한 줄로 씀*/
		
		String responseDate = "입력된 값" + str +", 길이" + str.length();
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print(responseDate);
	}

}
