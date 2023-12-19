package ch04;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class PostServletTest3 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id"); // name="id" 가져와서 id에 넣어줌
		String pw = request.getParameter("pw"); // name="pw" 가져와서 pw에 넣어줌
		String email = request.getParameter("email"); // name="eamil" 가져와서 email에 넣어줌
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter(); // 출력할 걸 얻어옴
		out.print("<html>");
		out.print("<body>");
		out.print("<h1>Post Servlet 방식</h1>");
		out.print("<h3>ID : "+id+ "</h3>");
		out.print("<h3>PW : "+pw+ "</h3>");
		out.print("<h3>EMAIL : "+email+ "</h3>");
		out.print("</body>");
		out.print("</html>");
	}
}
