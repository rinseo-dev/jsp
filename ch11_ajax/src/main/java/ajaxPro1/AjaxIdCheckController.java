package ajaxPro1;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class AjaxIdCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("checkId");
		boolean result = new MemberDao().checkId(id);
		// MemberDao()객체 생성해서 id값 받고, T/F로 result에넣어줌
		
		if(result) {
			response.getWriter().print("idN");// id가 존재함. 쓸 수 없음
		}else {
			response.getWriter().print("idY");// id가 없음. 쓸 수 있음
		}
	}

}
