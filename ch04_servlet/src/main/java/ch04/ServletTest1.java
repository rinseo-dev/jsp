package ch04;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ServletTest1
 */
public class ServletTest1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8"); // 내가 어떤걸로 보여줄지 선택
		
		//out.print형식을 사용해서 출력해줘야 함
		PrintWriter out = response.getWriter(); // import PrintWriter
		out.print("<html>");
		out.print("<body>");
		out.print("<h1>서블릿으로 html문서 만들기</h1>");
		out.print("</body>");
		out.print("</html>");
	}

}
