package ajaxReply;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AjaxReplyInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// jsp에서 data로 부모글번호ref, 이름name, 컨텐츠입력내용content 세가지를 넘겨옴
		int boardNum = Integer.parseInt(request.getParameter("bnum")); // 부모글 번호
		String name = request.getParameter("name");
		String content = request.getParameter("content");
		
		Reply bean = new Reply();
		bean.setRef(boardNum);
		bean.setName(name);
		bean.setContent(content);
		
		int result = new ReplyDao().insertReply(bean); // 반환값을 int 로 했었음. 0 or 1들어옴
		
		response.getWriter().print(result);
	}

}
