package board;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class BoardReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			Board board = new Board();
			board.setName(request.getParameter("name"));
			board.setSubject(request.getParameter("subject"));
			board.setContent(request.getParameter("content"));
			board.setRef(Integer.parseInt(request.getParameter("ref")));
			board.setPos(Integer.parseInt(request.getParameter("pos")));
			board.setDepth(Integer.parseInt(request.getParameter("depth")));
			board.setPass(request.getParameter("pass"));
			board.setIp(request.getParameter("ip"));
			
			BoardDao bDao = new BoardDao();
			bDao.replyUpBoard(board.getRef(),board.getPos());
			//ref에 있는 값을 1개씩 증가 시킬것
			bDao.replyBoard(board);
			
//			response.sendRedirect("list.jsp?nowPage="+request.getParameter("nowPage"));
			response.sendRedirect("list.jsp?"); // nowPage하니까 고정돼서 치움
			/*
			 2번 페이지에 있던 글을 보고 나서 목록으로 돌아가면 2번 페이지를 보여줘야 함.
			 sendRedirect("list.jsp")로 첫번째 페이지로 돌아가게 되므로
			 사용자가 보던 페이지를 그대로 보여주고 싶다면 nowPage에 담긴 값을 사용하면 됨
			 */
	}

}
