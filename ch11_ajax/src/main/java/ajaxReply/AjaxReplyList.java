package ajaxReply;

import java.io.IOException;
import java.util.ArrayList;

import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AjaxReplyList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNum = Integer.parseInt(request.getParameter("bnum"));//data:{bnum:<%=ref %>}
		
		System.out.println("Board Number: " + boardNum);
		
		/*
		ReplyDao replydao = new ReplyDao(); // 객체생성
		ArrayList<Reply> alist = replydao.getReplyList(boardNum); // 반환형이 ArrayList라서 안에 넣어줌
		위 두 줄을 아래 한줄로 작성함.
		*/
		ArrayList<Reply> alist = new ReplyDao().getReplyList(boardNum);
		System.out.println(alist.size());
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(alist,response.getWriter());
		
	}

}
