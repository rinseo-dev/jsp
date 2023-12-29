package board;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


public class BoardPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			  throws ServletException, IOException {
		// 모든 값은 request를 통해서 넘어감(?)
		/*
		Board board  = new Board();
		board.setName(request.getParameter("name"));
		// name이라는 이름의 매개변수를 기대하고, request.getParameter("name")을 사용하여
		// 해당 값을 추출하고 이를 Board 객체의 이름 속성으로 설정하고 있음. 
		board.setSubject(request.getParameter("subject"));
		board.setContent(request.getParameter("content"));
		board.setContent(request.getParameter("pass"));
		board.setContent(request.getParameter("ip"));
		board에서 값을 가져 올 때 이런 방식으로 반복해도 되지만, 생성자로 가져올 수도 있음
		*/
		
		// board변수는 값을 저장하는데 사용됨. 세부정보를 캡슐화..?
		Board board = new Board(request.getParameter("name"),
								request.getParameter("subject"),
								request.getParameter("content"),
								request.getParameter("pass"),
								request.getParameter("ip"));
		// Board Bean에 만들어둔 5개짜리 생성자를 사용하는 방법도 사용함.
		
		/*
		BoardDao bd = new BoardDao();
		bd.insertBoard(board);
		위 두 줄을 아래 한줄로 합쳐서 작성할 수 있음
		*/
		new BoardDao().insertBoard(board);
		response.sendRedirect("list.jsp");
	}

}
