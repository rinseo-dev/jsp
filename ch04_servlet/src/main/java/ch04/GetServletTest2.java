package ch04;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GetServletTest2
 */
public class GetServletTest2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

						// request, response는 변수명이므로 수정 가능
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String msg = request.getParameter("msg");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter(); // 출력할 걸 얻어옴
		out.print("<html>");
		out.print("<body>");
		out.print("<h1>Get Servlet 방식</h1>");
		out.print("<h3>msg : "+msg+ " </h3>"); // msg는 변수이므로 끊어서 넣어줌
		out.print("</body>");
		out.print("</html>");
	}

}
