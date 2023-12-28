package board;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			  throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		
		Board upBoard = new Board();
		upBoard.setSubject(request.getParameter("subject")); // upboard에 넣어줄 값이므로 set
		upBoard.setContent(request.getParameter("content"));
		
		int num = Integer.parseInt(request.getParameter("num")); // num값을 넘겨야 하므로 변수로
		upBoard.setNum(num); // num값인 2줄 중요
		
		String inputPass = request.getParameter("pass"); //사용자가 넣은 pass값
		// session에 있는 pass(DB값)과 비교해야 함
		
		/* session을 가져오려면 session.getAttribute("bean"); 이렇게 작성하면 오류남
		request에서 session을 받아와야함*/
		HttpSession session = request.getSession();
		Board dbBoard = (Board)session.getAttribute("bean"); // 얻어온 값이라 반환형이 Board임.
		PrintWriter out = response.getWriter();
		
		/*String dbPass = dbBoard.getPass(); // DB에 있는 pass값을 가져옴
		// 사용자가 입력한 inputPass와 비교해야 하므로 dbPass에 넣어줌*/
		
		if(inputPass.equals(dbBoard.getPass())) { // 사용자가 가져온 값을 if문 안에 바로 넣어줬음.
			new BoardDao().updateBoard(upBoard); // BoardDao() 값을 넘겨주려는게 아니므로 바로 생성만
			response.sendRedirect("read.jsp?num="+num);
			// Integer.parseInt(request.getParameter("num"))이 필요해서 num변수 만들어서 넣어줌
		}else {
			out.print("<script>");
			out.print("alert('비밀번호가 맞지않습니다');");
			out.print("history.back();");
			out.print("</script>");
		}
	}

}
